
import qs.Modules.Bar
import QtQuick.Layouts 
import QtQuick 
import Quickshell 
import qs.Common
import qs.Services

PanelWindow {
    id:root
    anchors {
        top: true
        left: true
        right: true
    }
    color: Battery.isCriticalAndNotCharging ? Common.colAlert : Common.colBg
    implicitHeight:40
    RowLayout{
        anchors.fill:parent
        anchors.margins: 8
        spacing:8
        WindowSelector{}
        Item {Layout.fillWidth: true} 
        NotificationButton{}
        BatteryIndicator{}
        ClockIndicator{}

    }
}
