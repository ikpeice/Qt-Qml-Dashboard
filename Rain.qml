import QtQuick

Item {
    id: root_rain
    width: cardWidth
    height: cardHeight
    property string label_text_color: "black"
    property string value_text_color: "black"
    property int angle: 0
    Rectangle{
        id: main_frame
        width: parent.width
        height: parent.height
        radius: 10
        color: "#e6dfcf"
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
                source: "images/cloud.rain.png"
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: text1
                x: 25
                y: 3
                text: qsTr("PRECIPITATION")
                color: "black"
                font.pixelSize: 12
                font.bold: true
                anchors{
                    bottom: wind_icon.bottom
                }
            }
        }

        Rectangle{
            id: data_frame_id
            width: main_frame.width/2
            height: (main_frame.height/10)*2
            color: main_frame.color
            anchors{
                verticalCenter: main_frame.verticalCenter
                left: main_frame.left
                leftMargin: 15
            }

            Text {
                id: data_id
                text: qsTr("0.0")
                font.pixelSize: 60
                font.bold: true
                anchors{
                    left: data_frame_id.left
                    bottom: data_frame_id.bottom
                }
            }
            Text {
                id: unit_id
                text: qsTr("mm")
                font.pixelSize: 25
                font.bold: true
                anchors{
                    left: data_id.right
                    bottom: data_id.bottom
                    bottomMargin: 7
                }
            }
            Text {
                id: text1_id
                text: qsTr("in the last 1 hour")
                font.pixelSize: 18
                anchors{
                    left: data_frame_id.left
                    top: data_id.bottom
                    //bottomMargin: 7
                }
            }
        }


    }

}
