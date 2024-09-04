import QtQuick
import QtQuick.Window
import Test1 1.0

Window {
    width: 1300
    height: 700
    visible: true
    title: qsTr("Weather App")
    minimumWidth: 1300
    minimumHeight: 700

    property string rootBGcolor: "white"
    property bool wind_visible: true
    property int cardWidth: 300
    property int cardHeight: 350

    Rectangle{
        id: root
        width: parent.width
        height: parent.height
        color: rootBGcolor

        ClassA{
            id: controller
        }

        Rectangle{
            id: top_bar
            width: root.width
            height: (root.height/10)*0.5
            color: "lightgray"
            anchors{
                top: root.top
            }

            MouseArea{
                width: top_bar.width
                height: top_bar.height
                onClicked:{
                    //controller.callme()
                    if(wind_visible == true){
                        wind_visible = false
                        wind1.visible =false
                    }else{
                        wind_visible = true
                        wind1.visible = true

                    }
                }
            }
        }

        Wind{
            id: wind1
            //visible: wind_visible
            anchors{
                left: root.left
                top: top_bar.bottom
                leftMargin: 10
                topMargin: 10
            }
        }

        Rain{
            id: rain
            anchors{
                left: wind1.right
                top: top_bar.bottom
                leftMargin: 10
                topMargin: 10
            }

        }

    }
}
