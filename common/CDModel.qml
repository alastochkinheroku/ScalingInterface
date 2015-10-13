import QtQuick 2.1
import QtQuick.XmlListModel 2.0

//Модель дисков
XmlListModel {
    id: groupModel
    property int formIndex: 0
    property int groupIndex: 0
    source: "qrc:/cd_catalog.xml"
    // (note in XPath the first index is 1, not 0)
    query: "/CATALOG/FORM[" + (formIndex + 1) + "]/GROUP[" + (groupIndex + 1) + "]/CD"

    XmlRole {
        name: "title"
        query: "TITLE/string()"
    }
    XmlRole {
        name: "artist"
        query: "ARTIST/string()"
    }
    XmlRole {
        name: "country"
        query: "COUNTRY/string()"
    }
    XmlRole {
        name: "company"
        query: "COMPANY/string()"
    }
    XmlRole {
        name: "price"
        query: "PRICE/string()"
    }
    XmlRole {
        name: "year"
        query: "YEAR/string()"
    }
}
