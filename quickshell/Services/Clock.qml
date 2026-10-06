pragma Singleton 

import QtQuick
import Quickshell

Singleton {
    property alias enabled: clock.enabled
    readonly property string time: format("hh:mm")
    readonly property string date : format("dd-MM-yyyy")
    readonly property string fullStr : "hh:mm:ss -dd-MM-yyyy"
    /* The following may be used in the formate parameter: 
     * hh: mm :ss hours, minutes, seconds 
     * d - day number without leading zero 
     * dd - day s a number with a leading zero ( 01- 31)
     * ddd The abbreviated day name ('Mon', etc)
     * dddd The long day name ('Monday')
     * M The month as a number without leading zero
     * MM The month as a number with leading zero
     * MMM The abbreviated Month name 
     * MMMM The long month name
     * yy THe year as a two digit number 
     * yyyy the year as a four digit number */ 

    function format(fmt: string): string {
        return Qt.formatDateTime(clock.date , fmt);
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

}
