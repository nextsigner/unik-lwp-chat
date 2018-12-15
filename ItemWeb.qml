import QtQuick 2.0
import QtWebEngine 1.2

WebEngineView{
    id: wv
    anchors.fill: parent
    zoomFactor: app.zoomFactor
    property int area
    visible: area===appSettings.area
    Timer{
        id: ts
        running: wv.area!==0
        repeat: true
        interval: 250
        onTriggered: {
            setColor('div')
            setColor('body')
            setColor('section')
            setColor('input')
            setColor('p')
            setColor('span')
            setColor('textarea')
            setColor('a')
            //bot1. visible=(''+wv.url).indexOf('https://www.lawebdelprogramador.com/chat/QT/')<0
        }
    }

    function setColor(t){
        wv.runJavaScript('document.getElementsByTagName(\''+t+'\').length', function(result) {
            var js='function setColor(d){d.style.backgroundColor="#333333";d.style.color="#fff";};'
            for(var i=0;i<result;i++){
                js += 'setColor(document.getElementsByTagName(\''+t+'\')['+i+']);'
            }
            wv.runJavaScript(js, function(result2) {
                //console.log("Result Styles Divs: "+result2)
            })
        })
    }
}
