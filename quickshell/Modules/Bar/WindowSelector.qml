pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Hyprland
import qs.Common
import qs.Common.Texts

Repeater {
    model: 10
    GenericText {
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
