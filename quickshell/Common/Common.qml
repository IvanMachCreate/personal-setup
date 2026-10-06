pragma Singleton 
import Quickshell
import QtQuick

Singleton {
    id: root
    property color colBg: '#1a1b26'
    property color colCyan: '#0db9d7'
    property color colBlue: '#7aa2f7'
    property color colYellow: '#e0af68'
    property color colMuted: '#444b6a'
    property color colRed: '#FF0000'
    property color colAlert: '#e03ac4'
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize:20 
    property int footnoteSize: 13
    property int timeout: 5000 
}

