import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1


//Отображает запись с CD
Rectangle {
        //public:
        //private:
        radius: sp(5)
        border.color: "black"

        Image{
            source: scaled_image("qrc:/images/Compact_disc")
            anchors.fill: parent
            fillMode: Image.Stretch
        }

//            ColumnLayout {
//                width: parent.width
//                spacing: 2
//                Label {
//                    text: title
//                }
//                Label {
//                    text: artist
//                }
//                Label {
//                    text: country
//                }
//                Label {
//                    text: company
//                }
//                Label {
//                    text: price
//                }
//                Label {
//                    text: year
//                }
//            }
}
