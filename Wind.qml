import QtQuick


Item {
    id: root_wind
    width: cardWidth
    height: cardHeight
    property string label_text_color: "white"
    property string value_text_color: "white"
    property int angle: 0

    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered:{
            //controller.callme()
            angle  = angle+5;
            if(angle >= 360){
                angle = 0;
            }
        }
    }

    Rectangle{
        id: main_frame
        width: parent.width
        height: parent.height
        radius: 10
        color: "black"
        border{
            color: "gray"
            width: 3
        }

        Rectangle{
            id: topBar
            x: 10
            y: 10
            Image {
                id: wind_icon
                x: 0
                y: 0
                width: 20
                height: 15
                source: "images/wind.png"
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: text1
                x: 25
                y: 3
                text: qsTr("WIND")
                color: label_text_color
                font.pixelSize: 12
                font.bold: true
                anchors{
                    bottom: wind_icon.bottom
                }
            }
        }


        Image {
            id: compass
            width: (main_frame.width/10)*9
            height: (main_frame.width/10)*9
            source: "images/compass-2.png"
            fillMode: Image.PreserveAspectFit
            anchors{
                centerIn: main_frame
            }
        }
        Image {
            id: arrow
            width: (main_frame.width/10)*7
            height: (main_frame.width/10)*7
            source: "images/Arrow.png"
            fillMode: Image.PreserveAspectFit
            rotation: angle
            anchors{
                centerIn: main_frame
            }
        }

        Rectangle{
            id: speed
            width: 50
            height: 50
            color: main_frame.color
            anchors{
                centerIn: main_frame
            }
            Text {
                id: speed_value
                text: qsTr("1.34")
                font.bold: true
                font.pixelSize: 36
                color: value_text_color
                anchors.centerIn: speed
            }
            Text {
                id: speed_unit
                text: qsTr("m/s")
                font.bold: true
                font.pixelSize: 20
                color: value_text_color
                anchors{
                    top: speed_value.bottom
                    horizontalCenter: speed_value.horizontalCenter
                }

            }
        }

        Rectangle{
            id: left_bottom_text
            width: (main_frame.width/10)*3.5
            height: (main_frame.height/10)*1
            color: main_frame.color
            anchors{
                bottom: main_frame.bottom
                left: main_frame.left
                leftMargin: 10
                bottomMargin: 10
            }
            Text {
                id: _text
                text: qsTr("From:")
                font.pixelSize: 16
                font.bold: true
                color: label_text_color
            }
            Text {
                id: dir_text
                text: qsTr(angle+" NE")
                font.pixelSize: 16
                font.bold: true
                color: "blue"
                anchors{
                    top: _text.bottom
                }
            }

        }

        Rectangle{
            id: right_bottom_text
            width: (main_frame.width/10)*3.5
            height: (main_frame.height/10)*1
            color: main_frame.color
            anchors{
                bottom: main_frame.bottom
                right: main_frame.right
                rightMargin: 15
                bottomMargin: 10
            }

            Text {
                id: right_text
                text: qsTr("Today's peak:")
                font.pixelSize: 16
                font.bold: true
                color: label_text_color
                anchors{
                    top: right_bottom_text.top

                }
            }
            Text {
                id: peak_text
                text: qsTr("2.3 m/s")
                font.pixelSize: 16
                font.bold: true
                color: "blue"
                anchors{
                    top: right_text.bottom
                    horizontalCenter: right_text.horizontalCenter
                }
            }

        }
    }



}
