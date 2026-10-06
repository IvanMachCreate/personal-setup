pragma ComponentBehavior: Bound
import QtQuick
import qs.Services
import qs.Common
import qs.Common.Texts

GenericText {
    id: time
    property bool timeOrDate : true;
    text:  timeOrDate ? Clock.time : Clock.date
    color:   Common.colCyan
    MouseArea {
        anchors.fill: parent 
        onClicked: time.timeOrDate = time.timeOrDate ? false : true;
    }
}
