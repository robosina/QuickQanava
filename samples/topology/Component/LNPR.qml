import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Material  2.12
import QtQuick.Controls.Material.impl 2.12

Item {
    property alias checkboxRemote: checkboxRemote
    property alias checkboxLocal: checkboxLocal
    property alias locationName: locationName
    property alias ipaddress: ipaddress
    property alias portclient: portclient
    property alias serverportNumber: serverportNumber
    property alias cameraRtsp: cameraRtsp

    property int labelheight: 45
    property int spacingval: 15
    property int elevsize: 6
    ScrollView{
        clip: true
        id:scroll
        anchors.fill: parent
        contentWidth: parent.width
        contentItem.opacity: 1
        LayoutMirroring.enabled: true
        Column {
            anchors.fill: parent
            //            anchors.margins: 20
            //            anchors.bottomMargin: 100
            LayoutMirroring.enabled: true
            spacing: 60
            //remote or local
            Pane{
                Material.elevation: elevsize

                Row{
                    anchors.fill: parent
                    CheckBox{
                        id:checkboxRemote
                        LayoutMirroring.enabled: true
                        text: "پردازش روی سیستم ریموت"
                        //                        text: "پردازش "
                        layer.format: ShaderEffectSource.RGB
                        antialiasing: true
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        onCheckStateChanged: {
                            if(checkboxRemote.checked){
                                checkboxLocal.checked=false
                                ipaddress.text="192.168.1.x"
                            }else{
                                checkboxLocal.checked=true
                                ipaddress.text="localhost"
                            }
                        }
                    }
                    CheckBox{
                        id:checkboxLocal
                        LayoutMirroring.enabled: true
                        text: "پردازش روی همین سیستم"
                        checked: true
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        onCheckStateChanged: {
                            if(checkboxLocal.checked){
                                ipaddress.text="localhost"
                                checkboxRemote.checked=false
                            }else{
                                checkboxRemote.checked=true
                                ipaddress.text="192.168.1.x"
                            }
                        }
                    }
                }
            }


            //نام مربوط به نود پردازشی
            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval
                Pane{
                    Material.elevation: elevsize
                    width: parent.width
                    height: labelheight
                    Label{
                        anchors.fill: parent
                        text: "نام محل پردازشی"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width
                        //                        color: "#ffffff"
                        font.bold: true
                        ToolTip {
                            delay: 400
                            visible: text ? locationNamemouse.containsMouse : false
                            font.family: setting_handler.nazaninFont.name
                            font.pointSize: setting_handler.pointsize
                            text: "بهتر است هر بخش یک نام منحصر به فرد داشته باشد. به طور مثال سیستم پلاکخوان درب جنوب ورودی اول"
                        }

                        MouseArea{
                            id: locationNamemouse
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }

                //ip address which send data
                Pane{
                    width: parent.width
                    TextField{
                        id:locationName
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        placeholderText: "پلاک خوان درب جنوب ورودی اول"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                    }
                }
            }


            //processing group
            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval
                Pane{
                    width: parent.width
                    height: labelheight
                    Material.elevation: elevsize
                    Material.accent: Material.Orange
                    //                    color: setting_handler.backGroundPurpleColor
                    //                    radius: 20
                    Label{

                        anchors.fill: parent
                        text: "گروه پردازشی"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true

                        ToolTip {
                            delay: 400
                            visible: text ? groupmouse.containsMouse : false
                            font.family: setting_handler.nazaninFont.name
                            font.pointSize: setting_handler.pointsize
                            text: "هر نود پردازشی می‌تواند متعلق به یک گروه پردازشی باشد. به طور مثال دوربین ورود و خروجی
مربوط به پلاکخوانی یک گروه پردازشی را تشکیل می‌دهند. اگر ما در یک معبر بیشتر از یک دوربین داشته باشیم این‌ها نیز
یک گروه پردازشی را تشکیل می‌دهند. به طور مثال ما می‌توانیم یک گروه متشکل از شش دوربین داشته باشیم
که سه تای آن‌ها به عنوان ورودی معبر هستند و سه تای دیگر به عنوان خروجی از پارکینگ"
                        }

                        MouseArea{
                            id: groupmouse
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }

                Row{
                    width: parent.width
                    //                    anchors.centerIn: parent
                    //ip address which send data
                    TextField{
                        width: parent.width/2
                        id:grouping
                        horizontalAlignment: Text.AlignHCenter
                        placeholderText: "درب جنوب"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize-2
                    }

                    Button {
                        width: parent.width/2
                        id: pluginselector
                        text: "انتخاب از گروه‌های موجود"
                        onClicked: menu.open()
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize

                        Menu {
                            id: menu
                            y: pluginselector.height
                            width: pluginselector.width

                            MenuItem {
                                LayoutMirroring.enabled: true
                                text: "گروه درب جنوب"
                                font.family: setting_handler.nazaninFont.name
                                font.pointSize: setting_handler.pointsize-2
                                onTriggered: {
                                    pluginselector.text = text
                                }
                            }
                            MenuItem {
                                LayoutMirroring.enabled: true
                                text: "گروه درب شمال"
                                font.family: setting_handler.nazaninFont.name
                                font.pointSize: setting_handler.pointsize-2
                                onTriggered: {
                                    pluginselector.text = text
                                }
                            }
                        }
                    }

                }
            }




            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval
                Pane{
                    Material.elevation: elevsize
                    width: parent.width
                    height: labelheight
                    Label{
                        anchors.fill: parent
                        text: "آدرس نود محاسباتی"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        //                        color: "#ffffff"
                        font.bold: true

                        ToolTip {
                            delay: 400
                            visible: text ? ipmouse.containsMouse : false
                            font.family: setting_handler.nazaninFont.name
                            font.pointSize: setting_handler.pointsize
                            text: "نود پردازشی روی چه آدرسی قرار دارد؟
تنظیمات سیستم پردازشی باید به این آدرس فرستاده شود"
                        }

                        MouseArea{
                            id: ipmouse
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }

                //ip address which send data
                TextField{
                    id:ipaddress
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "IP address"
                    font.family: setting_handler.gorditas.name
                }
            }


            //client listen port
            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval
                Pane{
                    Material.elevation: elevsize
                    width: parent.width
                    height: labelheight
                    Label{
                        anchors.fill: parent
                        text: "پورت کلاینت"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        //                        color: "#ffffff"
                        font.bold: true
                        ToolTip {
                            delay: 400
                            visible: text ? portclientmouse.containsMouse : false
                            font.family: setting_handler.nazaninFont.name
                            font.pointSize: setting_handler.pointsize
                            text: "مشخص می‌کند که کلاینت باید روی چه پورتی گوش بدهد تا تنظیمات برایش ارسال شود"
                        }

                        MouseArea{
                            id: portclientmouse
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }

                //ip address which send data
                TextField{
                    id:portclient
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "for example:5558"
                    font.family: setting_handler.gorditas.name
                }
            }

            //which port server is listening
            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval
                Pane{
                    Material.elevation: elevsize
                    width: parent.width
                    height: labelheight
                    Label{
                        anchors.fill: parent
                        text: "پورت سرور"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width
                        font.bold: true
                        ToolTip {
                            delay: 400
                            visible: text ? serverportmouse.containsMouse : false
                            font.family: setting_handler.nazaninFont.name
                            font.pointSize: setting_handler.pointsize
                            text: "سرور بر روی چه پورتی به کلاینت‌ها گوش می‌دهد. دقت کنید که این پورت باید برای همه‌ی کلاینت‌ها یکسان باشد"
                        }

                        MouseArea{
                            id: serverportmouse
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }

                //ip address which send data
                TextField{
                    id:serverportNumber
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "for example:6000"
                    font.family: setting_handler.gorditas.name
                }
            }

            //camera rtsp
            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval
                Pane{
                    Material.elevation: elevsize
                    width: parent.width
                    height: labelheight
                    Label{
                        anchors.fill: parent
                        text: "آدرس دوربین"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width
                        font.bold: true
                        ToolTip {
                            delay: 400
                            visible: text ? cameraipmouse.containsMouse : false
                            font.family: setting_handler.nazaninFont.name
                            font.pointSize: setting_handler.pointsize
                            text: "آدرس دوربین: با استفاده از این آدرس ما استریم دوربین را میگیریم و نشان میدهیم. همچنین برای پردازش تصویر نیز این آدرس مورد استفاده قرار میگیرد"
                        }

                        MouseArea{
                            id: cameraipmouse
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }

                //ip address which send data
                TextField{
                    id:cameraRtsp
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "Camera rtsp"
                    font.family: setting_handler.gorditas.name
                }
            }


            Pane{
                Material.elevation: elevsize
                width: parent.width
                LayoutMirroring.enabled: true
                LayoutMirroring.childrenInherit: true
                Row{
                    width: parent.width
                    CheckBox{
                        id:checkboxInputCam
                        LayoutMirroring.enabled: true
                        text: "فقط ورودی"
                        layer.format: ShaderEffectSource.RGB
                        antialiasing: true
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        onCheckStateChanged: {
                            if(checkboxInputCam.checked){
                                checkBoxOutputCam.checked=false
                                checkBoxinandout.checked=false
                            }
                        }
                    }
                    CheckBox{
                        id:checkBoxOutputCam
                        LayoutMirroring.enabled: true
                        text: "فقط خروجی"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        onCheckStateChanged: {
                            if(checkBoxOutputCam.checked){
                                checkboxInputCam.checked=false
                                checkBoxinandout.checked=false
                            }
                        }
                    }
                    //مشخص می‌کند که دوربین می‌تواند هم ورودی و هم خروجی را مدیریت کند
                    CheckBox{
                        id:checkBoxinandout
                        LayoutMirroring.enabled: true
                        text: "ورود و خروج با هم"
                        font.family: setting_handler.nazaninFont.name
                        font.pointSize: setting_handler.pointsize
                        onCheckStateChanged: {
                            if(checkBoxinandout.checked){
                                checkboxInputCam.checked=false
                                checkBoxOutputCam.checked=false
                            }
                        }
                    }
                }
            }

            //camera rtsp test
            Column{
                LayoutMirroring.enabled: true
                width: parent.width
                spacing: spacingval

                //ip address which send data
                Button{
                    id:cameraRtsptest
                    width: parent.width
                    font.family: setting_handler.nazaninFont.name
                    font.pointSize: setting_handler.pointsize
                    text: "تست دوربین"
                }

                Rectangle{
                    height: 300
                    width: parent.width
                    border.width: 2
                    radius: 20
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
