import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

import "../common"

ScrollView {
    id: view
    property int formIndex
    anchors.fill: parent

    flickableItem.interactive: false

    Column {
        id: gridView
        width: parent.width
        property int formIndex

        Repeater{
            model: GroupModel{
                formIndex: view.formIndex
            }
            delegate: Item{
                    width: view.width
                    height: sp(230)
                    Text{
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: sp(20)
                        text: title
                    }

                    GroupItem{
                        id: cdGroup
                        y: sp(30)
                        width: parent.width
                        height: sp(200)
                        formIndex:  gridView.formIndex
                        groupIndex: index
                    }
            }
        }

    }

    //Стиль для скроллера
//    style: ScrollViewStyle {
//            transientScrollBars: true
//            handle: Item {
//                implicitWidth: 14
//                implicitHeight: 26
//                Rectangle {
//                    color: "#424246"
//                    anchors.fill: parent
//                    anchors.topMargin: 6
//                    anchors.leftMargin: 4
//                    anchors.rightMargin: 4
//                    anchors.bottomMargin: 6
//                }
//            }
//            scrollBarBackground: Item {
//                implicitWidth: 14
//                implicitHeight: 26
//            }
//        }
}
