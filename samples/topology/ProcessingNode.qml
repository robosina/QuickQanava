/*
Copyright (c) 2020, Benoit AUTHEMAN All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   * Neither the name of the author or Destrat.io nor the
     names of its contributors may be used to endorse or promote products
     derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL AUTHOR BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//-----------------------------------------------------------------------------
// This file is a part of the QuickQanava software library. Copyright 2015 Benoit AUTHEMAN.
//
// \file	ImgNode.qml
// \author	benoit@destrat.io
// \date	2016 02 11
//-----------------------------------------------------------------------------

import QtQuick              2.7
import QtQuick.Controls     2.0
import QtQuick.Layouts      1.3
import QtGraphicalEffects   1.0

import QuickQanava          2.0 as Qan
import "qrc:/QuickQanava"   as Qan

Qan.NodeItem {
   id: faceNodeItem
   Layout.preferredWidth: 160
   Layout.preferredHeight: 160
   width: Layout.preferredWidth
   height: Layout.preferredHeight

   DropShadow {
       id: backgroundShadow
       anchors.fill: parent
       source: image
       horizontalOffset: faceNodeItem.style.effectRadius
       verticalOffset: faceNodeItem.style.effectRadius
       radius: 4; samples: 8
       color: faceNodeItem.style.effectColor
       visible: faceNodeItem.style.effectEnabled
       transparentBorder: true
   }
   Pane {
       z: 2
       anchors.horizontalCenter: parent.horizontalCenter
       padding: 1
       opacity: 0.9
       ColumnLayout {
           Label {
               Layout.maximumWidth: faceNodeItem.width - 10
               z: 3
               text: faceNodeItem.node.label
               horizontalAlignment: Text.AlignHCenter
               maximumLineCount: 2; elide: Text.ElideLeft
           }

           Label {
               Layout.maximumWidth: faceNodeItem.width - 10
               z: 3
               text: faceNodeItem.node.rtsp
               horizontalAlignment: Text.AlignHCenter
               maximumLineCount: 2; elide: Text.ElideLeft
           }
       }
   }
   Pane {
       z: 2
       padding: 1
       anchors.left: parent.left; anchors.bottom: parent.bottom;
       opacity: 0.9
//       Label { text: image.sourceSize.width + "x" + image.sourceSize.height + "px" }
   }
   Image {
       id: image
       z: 1
       anchors.fill: parent
       smooth: true
       source: faceNodeItem.node.image
       antialiasing: true
       mipmap: true
       onSourceSizeChanged: {
           if ( sourceSize.width > 0 && sourceSize.height > 0 ) {
               faceNodeItem.ratio = sourceSize.width / sourceSize.height;
               // FIXME: generate a clean initial size here
           } else
               faceNodeItem.ratio = -1.;
       }
   }
}
