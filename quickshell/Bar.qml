import Quickshell 
import Quickshell.Hyprland
import QtQuick.Layouts 
import QtQuick 
import qs

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
        Repeater {
            model: 10
            Text {
                required property int index
                property var ws: Hyprland.workspaces.values.find(w => w.id ===  index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index +1)
                text: index + 1
                color: isActive ? Common.colCyan: (ws ? Common.colBlue : Common.colMuted)
                font {pixelSize : Common.fontSize; bold: false}

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("hl.dsp.focus({workspace =" + (parent.index +1) + "}) " )
                }
            }           
        }
        Item {Layout.fillWidth: true} 
        
        Text {
            id: battery
            color: Common.colYellow
            font { pixelSize: Common.fontSize}
            text: Math.floor(Battery.percentage * 100) + "%"
            
        }
        Text{
            id: time
            property bool timeOrDate : true;
            property string thing : timeOrDate ? "hh:mm" : "dd-MM-yyyy"
            text: Qt.formatDateTime(clock.date , thing) //"hh:mm:ss - yyyy-MM-dd" for the full thing
            color:   Common.colCyan
            font {pixelSize : Common.fontSize; }

            MouseArea {
                anchors.fill: parent 
                onClicked: time.timeOrDate = time.timeOrDate ? false : true;
            }

        }
        SystemClock {
            id:clock 
            precision: SystemClock.Seconds
        }
    }
}
