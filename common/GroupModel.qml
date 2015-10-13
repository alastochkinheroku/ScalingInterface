import QtQuick 2.1
import QtQuick.XmlListModel 2.0

//Модель наименований групп
XmlListModel {
    id: groupModel
    property int formIndex: 0
    source: "qrc:/cd_catalog.xml"
    // (note in XPath the first index is 1, not 0)
    query: "/CATALOG/FORM["+(formIndex+1)+"]/GROUP"
    //Заголовок группы
    XmlRole { name: "title"; query: "@name/string()" }
}
