pragma Singleton 

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root
    property real percentage: UPower.displayDevice?.percentage ?? 1
    property var chargeState: UPower.displayDevice.state
    property bool isCharging: chargeState == UPowerDeviceState.Charging
    property bool isPluggedIn: isCharging || chargeState == UPowerDeviceState.PendingCharge
    
    property bool isCritical: percentage <= (15/100)
    property bool isCriticalAndNotCharging: isCritical && !isCharging
    
}
