import QtQuick 2.4
import QtGraphicalEffects 1.0
Item {
    property alias opensans: opensans
    property alias gorditas: gorditas
    property alias nazaninFont: nazaninFont
    property string backGroundColor: "#ffffff"
    property string backGroundPurpleColor : Qt.darker("#e91e63")
    property string backgroundTheme: "#101820" //backgroud
    property string lighterDarkblue: "#183db4"
    property string darkRed: "#00539c" //background color
    property string textColorBlack: "#000000"
    property int pointsize: 18
    property int pointSizeTrafficInfo: 15
    property int pointSizePlateInfo: 16
    property string normalDayColor: "#1638a3"
    property string trafficInfoColor: "#1d14cb"
    property string forgroundTheme: "#006B38"
    property string forgroundThemelighter: "#008042"

    property string forgroundThemelighter2: "#e28743"
    property string forgroundTheme2: "#9a5118"

    property int globalradius: 20
    property string danger: "#CC2F2C"
    property string dangerlight: "#EA4154"
    property string textcoloronBackgroundTheme: "#FFFFFF"
    FontLoader { id: nastaliqFont; source: "qrc:/fonts/nastaliq.ttf" }
    FontLoader { id: opensans ; source:"qrc:/fonts/B-NAZANIN.TTF"}
    FontLoader { id: gorditas ; source:"qrc:/fonts/Gorditas-Bold.ttf"}
    FontLoader { id: nazaninFont; source: "qrc:/fonts/B-NAZANIN.TTF" }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
