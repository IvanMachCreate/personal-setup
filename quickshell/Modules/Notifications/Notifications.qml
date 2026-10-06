import Quickshell
import Quickshell.Services.Notifications 
import QtQuick
import QtQuick.Layouts
import qs.Common
import qs.Common.Texts
import qs.Services

PanelWindow {
    anchors {top:true; right:true; bottom:true}
    margins { top: 50; right:12} 
    implicitWidth: 380
    exclusionMode: ExclusionMode.Ignore  
    color: "transparent"
    mask: Region {}
    ColumnLayout {
        id: column
        width: parent.width 
        height:implicitHeight
        spacing: 10 
        Repeater {
            model: NotificationListener.trackedNotifications
            delegate: Rectangle {
                id: card
                required property var modelData
                required property int index 
                property int animation: 300
                function dismissal () {
                    card.y = -parent.height * (index + 1)
                    dismissFinal.start()
                }
                Timer {
                    running: card.modelData.urgency !== NotificationUrgency.Critical
                    interval: Common.timeout - parent.animation
                    onTriggered: card.dismissal()
                }
                Timer {
                    id: dismissFinal
                    interval: parent.animation * (card.index + 1)
                    onTriggered: card.modelData.dismiss() 
                }    
                width: parent.width
                height: layout.implicitHeight + 20
                x: parent.width
                color: Common.colBg
                border.width:2
                border.color: modelData.urgency === NotificationUrgency.Critical ? Common.colYellow : Common.colMuted
                radius:8
                RowLayout {
                    id:full
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 10
                    width: parent.width -20
                    spacing:10 
                    Image {
                        Layout.preferredHeight: 36
                        Layout.preferredWidth: 36 
                        Layout.alignment: Qt.AlignTop 
                        fillMode: Image.PreserveAspectFit 
                        visible: source.toString() !== "" 
                        source: card.modelData.image || card.modelData.appIcon || "" 
                    }
                    ColumnLayout {
                        id: layout 
                        spacing: 2 
                        TitleText {
                            text: card.modelData.summary 
                        }
                        StyledText {
                            text: card.modelData.body 
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent 
                    onClicked: card.dismissal()
                }
                Behavior on x {
                    NumberAnimation { duration: card.animation; easing.type: Easing.OutCubic }
                }
                Behavior on y {
                    NumberAnimation { duration: card.animation * (card.index + 1); easing.type: Easing.OutCubic }
                }
                Component.onCompleted: {
                    x = 0
                }
            }
        }
    }
} 




