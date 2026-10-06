import QtQuick
import Quickshell.Io
import qs.Common
import qs.Common.Texts
import qs.Services

GenericText {
    visible: NotificationHistory.historyCount > 0
    text: "\uf0a2"
    color: Common.colBlue
    MouseArea {
        anchors.fill: parent
        onClicked: toggleCenter.running = true;
    }
    Process {
        id: toggleCenter
        command: ["sh","-c", "qs ipc call notifications toggle"]
    }
}


