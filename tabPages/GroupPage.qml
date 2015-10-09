import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.XmlListModel 2.0

import "../common"

Flow {
    id: gridView
    property int formIndex: 0
    anchors.fill: parent
    //width: parent.width
    //height: childrenRect.height

    //Модель наименований групп
    XmlListModel {
        id: groupModel
        source: "qrc:/cd_catalog.xml"
        // (note in XPath the first index is 1, not 0)
        query: "/CATALOG/FORM["+(formIndex+1)+"]/GROUP"
        //Заголовок группы
        XmlRole { name: "title"; query: "@name/string()" }
    }

    Repeater{
        model: groupModel

        delegate: CDItem{
                width: 100
                formIndex:  gridView.formIndex
                groupIndex: index
             }
    }

}
