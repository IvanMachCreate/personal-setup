pragma Singleton
import QtQuick
import Quickshell.Services.Notifications 
import qs.Services

NotificationServer {
    id:server
    actionsSupported:true
    bodySupported:true
    imageSupported:true
    onNotification: n => {
        NotificationHistory.addNotification(
            n.summary,
            n.body,
            n.appName, 
            Qt.formatDateTime(new Date() , "HH:mm")
            
        )
        n.tracked  = true
    }
}
