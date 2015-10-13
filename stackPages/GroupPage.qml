import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1

import "../common"

ScrollView {
    id: view
    property int formIndex
    width: parent.width
    height: parent.height

    flickableItem.interactive: true

    ListView {
        anchors.fill: parent
        model: GroupModel{
            formIndex: view.formIndex
        }

        delegate: AndroidDelegate {
            text: title
            onClicked: stackView.push({item:Qt.resolvedUrl("GroupItem.qml"),
                                      properties:{formIndex: formIndex, groupIndex: index}})
        }
    }

    style: ScrollViewStyle {
        transientScrollBars: true
        handle: Item {
            implicitWidth: sp(14)
            implicitHeight: sp(26)
            Rectangle {
                color: "#424246"
                anchors.fill: parent
                anchors.topMargin: sp(6)
                anchors.leftMargin: sp(4)
                anchors.rightMargin: sp(4)
                anchors.bottomMargin: sp(6)
            }
        }
        scrollBarBackground: Item {
            implicitWidth: sp(14)
            implicitHeight: sp(26)
        }
    }
}
