import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
Item {
    anchors.fill: parent
    property string labelstring: ""
    property string tooltipstring: ""
    Label{
        anchors.fill: parent
        text: labelstring
        font.family: setting_handler.nazaninFont.name
        font.pointSize: setting_handler.pointsize
        width: parent.width
        horizontalAlignment: Text.AlignHCenter

        ToolTip {
            visible: text ? ipmouse.containsMouse : false
            font.family: setting_handler.nazaninFont.name
            font.pointSize: setting_handler.pointsize
            text: tooltipstring
        }

        MouseArea{
            id: ipmouse
            anchors.fill: parent
            hoverEnabled: true
        }
    }
}
