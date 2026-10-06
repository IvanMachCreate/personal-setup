pragma Singleton
import QtQuick

ListModel {
    id:root
    property int historyCount: root.count
    function addNotification (title, body, appName, timestamp) {
        insert(0, {
            title: title,
            body: body,
            appName: appName,
            timestamp: timestamp 
        })
    }

    function removeNotification (index) {
        remove(index)
    }

    function clearAll () {
        clear() 
    }
}
