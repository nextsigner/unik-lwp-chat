import QtQuick 2.0
import QtQuick.Controls 2.0
import QtWebEngine 1.2
ApplicationWindow{
    id:app
    visible: true
    visibility: 'Maximized'
    property int fs: width*0.015
    property string blackCode
    WebEngineView{
        id: wv
        anchors.fill: parent
        url: 'https://www.lawebdelprogramador.com/chat/QT/'
    }
    Rectangle{
        id: bot1
        width: txtB1.contentWidth+app.fs*2
        height: app.fs*1.4
        color: 'black'
        radius: app.fs*0.2
        border.width: 3
        border.color: 'white'
        Text {
            id: txtB1
            text: 'Ir al Chat sobre Qt/C++/Qml/JavaScript'
            font.pixelSize: app.fs
            color: 'white'
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: wv.url='https://www.lawebdelprogramador.com/chat/QT/'
        }
    }
    Timer{
        id: ts
        running: true
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

            //setFS('a')
            setFS('input')
            setFS('h4')
            setFS('textarea')
            setFS('span')
            setFS('p')
            setFS('div')
            setFS('section')

            bot1. visible=(''+wv.url).indexOf('https://www.lawebdelprogramador.com/chat/QT/')<0

        }

    }

    Component.onCompleted: {

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
    function setFS(t){
        wv.runJavaScript('document.getElementsByTagName(\''+t+'\').length', function(result) {
            //var js='function setFS(d){d.style.fontSize = "30px";};'
            var js='function setFS(d){'
            js+='   if(d.className!==\'chat_header\'){'
            js+='       d.style.fontSize = "30px"; d.style.lineHeight = "30px"; '
            js+='   }else{'
            js+='       d.style.fontSize = "30px";d.style.height = "'+parseInt(30+(30/2))+'px";d.style.marginTop = "'+parseInt(30*2)+'px";'
            js+='   }'
            js+='}'
            for(var i=0;i<result;i++){
                js += 'setFS(document.getElementsByTagName(\''+t+'\')['+i+']);'
            }
            wv.runJavaScript(js, function(result2) {
                //console.log("Result Styles Divs: "+result2)
            })
        })
    }
}
