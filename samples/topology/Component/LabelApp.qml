import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
//import "./Component" as Settings

Item {
    property string labelstring: " "
    property int labelradius: setting_handler.globalradius
    Rectangle{
        anchors.fill: parent
        color:setting_handler.forgroundThemelighter
        radius: labelradius
        Label{
            anchors.fill: parent
            text: labelstring
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: setting_handler.nazaninFont.name
            font.pointSize: setting_handler.pointsize
            color: "#FFFFFF"
        }
    }
}
