import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1
import QtQuick.XmlListModel 2.0


//Отображает запись с CD
Column {
    property int formIndex
    property int groupIndex

    //Модель дисков
    XmlListModel {
        id: groupModel
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

    height: childrenRect.height
    Repeater {
        model: groupModel
        delegate: Rectangle {
            width: parent.width
            height: childrenRect.height
            radius: 5
            border.color: "black"
            ColumnLayout {
                width: parent.width
                spacing: 2
                Label {
                    text: title
                }
                Label {
                    text: artist
                }
                Label {
                    text: country
                }
                Label {
                    text: company
                }
                Label {
                    text: price
                }
                Label {
                    text: year
                }
            }
        }
    }
}
