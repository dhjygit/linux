/***********************************************************************/


import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    width: 640
    height: 480

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = textConstants.loginSucceeded
        }

        onLoginFailed: {
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }
    }

    Repeater {
        model: screenModel
        Background {
            x: geometry.x; y: geometry.y; width: geometry.width; height:geometry.height
            property real ratio: geometry.width / geometry.height
            source: {
                if (ratio == 16.0 / 9.0) {
                    source = "background_169.png"
                }
                else if (ratio == 16.0 / 10.0) {
                    source = "background_1610.png"
                }
                else if (ratio == 4.0 / 3.0) {
                    source = "background_43.png"
                }
                else {
                    source = "background.png"
                }
            }
            fillMode: Image.PreserveAspectFit
            onStatusChanged: {
                if (status == Image.Error && source != config.defaultBackground) {
                    source = config.defaultBackground
                }
            }
        }
    }

    Rectangle {
        property variant geometry: screenModel.geometry(screenModel.primary)
        x: geometry.x; y: geometry.y; width: geometry.width; height: geometry.height
        property real scale: geometry.width / 1920
        color: "transparent"
        transformOrigin: Item.Top



        Rectangle {
            width: 600
            height: 250
            anchors.centerIn: parent
            anchors.verticalCenterOffset: parent.height / 5.5
            color: "#00000000"
            Image {
                id: loginframe
                width: 600
                height: 250
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 10
                anchors.horizontalCenterOffset: 0
                fillMode: Image.PreserveAspectFit
                transformOrigin: Item.Center
                source: "loginkey.png"
            }

            Image {
                id: pictpassword
                width: 125
                height: 125
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 75 - parent.width / 2
                fillMode: Image.PreserveAspectFit
                transformOrigin: Item.Center
                source: "password.png"
            }

            Column {
                id: mainColumn
                width: 300
                height: 140
                spacing: 4
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 9
                anchors.horizontalCenterOffset: 300 - parent.width / 2

                Row {
                    width: parent.width
                    spacing: 4
                    Text {
                        id: lblName
                        width: parent.width * 0.62; height: 40
                        color: "orange"
                        text: textConstants.userName
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 32
                        font.bold: true
                    }

                    TextBox {
                        id: name
                        color: "#30000000"
                        borderColor: "#1793d1"
                        textColor: "blue"
                        focusColor: "yellow"
                        width: parent.width * 0.7; height: 40
                        text: userModel.lastUser
                        font.pixelSize: 26
                        font.bold: true

                        KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, session.index)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    spacing : 4
                    Text {
                        id: lblPassword
                        width: parent.width * 0.62; height: 40
                        color: "orange"
                        text: textConstants.password
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pixelSize: 32
                    }

                    PasswordBox {
                        id: password
                        color: "#30000000"
                        borderColor: "#1793d1"
                        textColor: "blue"
                        focusColor: "yellow"
                        width: parent.width * 0.7; height: 40
                        font.pixelSize: 26
                        font.bold: true
                        tooltipBG: "lightgrey"

                        KeyNavigation.backtab: name; KeyNavigation.tab: session

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, session.index)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    spacing: 4

                    Text {
                        id: lblSession
                        width: parent.width * 0.62; height: 40
                        color: "orange"
                        text: textConstants.session
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pixelSize: 32
                    }

                    ComboBox {
                        id: session
                        color: "#30000000"
                        borderColor: "#1793d1"
                        textColor: "blue"
                        hoverColor: "yellow"
                        menuColor: "#90000000"
                        focusColor: "yellow"

                        width: parent.width * 0.7; height: 40
                        font.pixelSize: 26
                        font.bold: true
                        arrowIcon: "angle-down.png"
                        arrowColor: "#20000000"

                        model: sessionModel
                        index: sessionModel.lastIndex

                        KeyNavigation.backtab: password; KeyNavigation.tab: loginButton
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        id: errorMessage
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: textConstants.prompt
                        color: "purple"
                        font.pixelSize: 28
                        font.bold: true
                    }
                }
            }
        }
    }



Rectangle {
    anchors.centerIn: parent
    width: parent.width
    height: 256
    anchors.verticalCenterOffset: parent.height / 2.5
    color: "#00000000"

    Row {
        spacing: 4
        property int btnWidth: Math.max(loginButton.implicitWidth,shutdownButton.implicitWidth,rebootButton.implicitWidth, 80) + 8
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0

        ImageButton {
            id: loginButton
            source: "icon/login.png"
            onClicked: sddm.login(name.text, password.text, session.index)
            KeyNavigation.backtab: loginButton; KeyNavigation.tab: poweroffButton
        }

        ImageButton {
            id: poweroffButton
            source: "icon/poweroff.png"
            onClicked: sddm.powerOff()
            KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
        }

        ImageButton {
            id: rebootButton
            source: "icon/reboot.png"
            onClicked: sddm.reboot()
            KeyNavigation.backtab: poweroffButton; KeyNavigation.tab: suspendButton

        }

        ImageButton {
            id: suspendButton
            source: "icon/suspend.png"
            visible: sddm.canSuspend
            onClicked: sddm.suspend()
            KeyNavigation.backtab: rebootButton; KeyNavigation.tab: name
        }
    }
}

    Rectangle {
        anchors.centerIn: parent
        width: 256
        height: 256
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: 0
        color: "#00000000"
        Image {
            id: profilepicture
            width: 256
            height: 256
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            source: "ProfilePicture.png"
        }
    }


    Rectangle {
        anchors.centerIn: parent
        width: 600
        height: 600
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        color: "#00000000"

        Text {
            font.pixelSize: 100
            font.bold: true
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -460
            anchors.horizontalCenterOffset: 0
            color: "#85FF0000"
            text: new Date().toLocaleDateString()
            horizontalAlignment: Text.AlignRight
        }

        Clock {
            id: clock
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -270
            anchors.horizontalCenterOffset: 0
            timeFont.pixelSize: 225
            timeFont.bold: true
            dateFont.pixelSize: 1
            color: "#85FFFF00"
        }
    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}
