import Quickshell 
import Quickshell.Io
import QtQuick 
import QtQuick.Layouts
import qs.Common
import qs.Common.Texts
import qs.Services 

    PanelWindow {
    id: root
    visible: root.centerOpen 
    anchors {top:true; right:true}
    margins { top: 12; right:12} 
    implicitWidth: 380
    implicitHeight: centerCol.implicitHeight + 30
    exclusionMode: ExclusionMode.Ignore  
    color: "transparent"
    property bool centerOpen: false
    function toggle() : void {root.centerOpen = !root.centerOpen}
    function show() : void {root.centerOpen = true}
    function hide() : void {root.centerOpen = false}
    IpcHandler {
        target: "notifications"
        function toggle(): void {root.toggle()} 
        function show(): void {root.show()} 
        function hide(): void {root.hide()} 
    }
    Component {
        id: historyDelegate
        Rectangle {
            id: model 
            required property string title
            required property string body 
            required property string appName
            required property string timestamp 
            required property int index
            implicitWidth: ListView.view.width
            implicitHeight: historical.implicitHeight + 5
            color: Common.colBg
            border.width:2
            border.color:  Common.colMuted
            radius:8 
            ColumnLayout {
                id: historical
                spacing: 2
                anchors.fill:parent
                anchors.margins:5
                RowLayout {
                    Layout.fillWidth:true
                    StyledText {
                        text: model.title 
                    } 
                    Item {Layout.fillWidth:true}
                    MutedText {
                        text: "x"
                        MouseArea {
                            anchors.fill: parent 
                            onClicked: NotificationHistory.removeNotification(model.index)
                        }
                    }
                }
                StyledText {
                    text: model.body 
                }
                RowLayout {
                    MutedText {
                        text: model.appName 
                    }
                    Item {Layout.fillWidth:true}
                    MutedText {
                        text: model.timestamp 
                    }
                }
            }
        }
    } 
    Rectangle {
        anchors.fill: parent 
        radius: 10 
        color: Common.colBg 
        border.width: 2
        border.color: Common.colMuted 
        Layout.fillWidth: true
        ColumnLayout {
            id: centerCol 
            anchors.fill: parent
            anchors.margins: 12
            spacing: 10 
            RowLayout {
                Text {
                    Layout.fillHeight:true
                    Layout.fillWidth: true 
                    text: "Notifications" 
                    color: Common.colCyan 
                    font.family: Common.fontFamily 
                    font.pixelSize: Common.fontSize 
                    font.bold: true
                }
                Item {Layout.fillWidth:true}
                Text {
                    text: "Clear All" 
                    visible: NotificationHistory.historyCount > 0 
                    font.family: Common.fontFamily 
                    font.pixelSize: Common.fontSize - 3
                    font.bold: true
                    color: Common.colRed 
                    MouseArea  {
                        anchors.fill:parent 
                        onClicked: NotificationHistory.clearAll()
                    }
                }
                Item {Layout.fillWidth:true}
                MutedText {
                    text: "X"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.toggle()
                    }
                }
            }
            ListView {
                Layout.fillWidth: true 
                Layout.preferredHeight: 400
                model: NotificationHistory
                delegate: historyDelegate  
                spacing:10
                clip:true
            }
        }
    }
}

