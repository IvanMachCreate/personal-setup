import QtQuick
import QtQuick.Layouts
import qs.Common

Text {
    Layout.fillWidth: true 
    visible: text !== ""
    color: Common.colCyan 
    font.family: Common.fontFamily
    font.pixelSize: 15; 
    font.bold: true 
    wrapMode: Text.WordWrap
}

