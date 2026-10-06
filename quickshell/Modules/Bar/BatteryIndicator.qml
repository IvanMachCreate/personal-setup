pragma ComponentBehavior: Bound

import QtQuick
import qs.Services 
import qs.Common.Texts
import qs.Common

GenericText {
    id: battery
    color: Common.colYellow
    text: Math.floor(Battery.percentage * 100) + "%"
}
