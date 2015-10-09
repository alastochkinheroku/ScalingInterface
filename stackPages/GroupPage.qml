import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.XmlListModel 2.0

ScrollView {
    property int formIndex
    width: parent.width
    height: parent.height

    flickableItem.interactive: true

    ListView {
        //Модель наименований групп
        XmlListModel {
            id: groupModel
            source: "qrc:/cd_catalog.xml"
            // (note in XPath the first index is 1, not 0)
            query: "/CATALOG/FORM["+(formIndex+1)+"]/GROUP"
            //Заголовок группы
            XmlRole { name: "title"; query: "@name/string()" }
        }

        anchors.fill: parent
        model: groupModel
        delegate: AndroidDelegate {
            text: title
            onClicked: stackView.push({item:Qt.resolvedUrl("../common/CDItem.qml"),
                                      properties:{formIndex: formIndex, groupIndex: index}})
        }
    }

    style: ScrollViewStyle {
        transientScrollBars: true
        handle: Item {
            implicitWidth: 14
            implicitHeight: 26
            Rectangle {
                color: "#424246"
                anchors.fill: parent
                anchors.topMargin: 6
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.bottomMargin: 6
            }
        }
        scrollBarBackground: Item {
            implicitWidth: 14
            implicitHeight: 26
        }
    }
}
