import QtQuick 2.9
import QtQuick.Controls 2.0
import QtWebEngine 1.2
import Qt.labs.settings 1.0
ApplicationWindow{
    id:app
    visible: true
    visibility: 'Maximized'
    title: 'unik-lwp-chat https://www.lawebdelprogramador.com/chat/'+app.arrayUrls[appSettings.area]+'/'
    property int fs: width*0.015
    property real zoomFactor
    property var arrayUrls: ['QT', 'JavaScript', 'Linux']//Salas de Interes
    Item{
        id: xApp
        width: app.width
        height: app.height
    }
    Settings{
        id: appSettings
        property int area
    }
    Shortcut{
        sequence: 'Ctrl++'
        onActivated: {
            if(app.zoomFactor<2.0){
                app.zoomFactor+=0.1
            }
        }
    }
    Shortcut{
        sequence: 'Ctrl+-'
        onActivated: {
            if(app.zoomFactor>0.1){
                app.zoomFactor-=0.1
            }
        }
    }
    Shortcut{
        sequence: 'Ctrl+Right'
        onActivated: {
            if(appSettings.area<xApp.children.length){
                appSettings.area++
            }
        }
    }
    Shortcut{
        sequence: 'Ctrl+Left'
        onActivated: {
            if(appSettings.area>0){
                appSettings.area--
            }
        }
    }
    Component.onCompleted: {
        if(appSettings.area<0){
            appSettings.area=0
        }
        for(var i=0;i<app.arrayUrls.length;i++){
            var comp=Qt.createComponent('ItemWeb.qml')
            var obj=comp.createObject(xApp, {"url":"https://www.lawebdelprogramador.com/chat/"+app.arrayUrls[i]+"/", "area":i})
        }
    }
}
