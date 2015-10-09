import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.2
import QtQuick.XmlListModel 2.0

import "stackPages"

ApplicationWindow {
    id: mainWindow
    title: "Пример масштабируемого интерфейса"
    width: 640
    height: 480
    visible: true
    property bool isSmallWidth: width < 400

    property string subHeaderTextMain: "Основное меню" //текст подзаголовка для основного меню
    property variant subHeaderTextList: [subHeaderTextMain] //список текстов подзаголовка текущей страницы

    //Топ-бар виден только при уменьшенном режиме
    toolBar: BorderImage {
        border.bottom: 8
        source: "images/toolbar.png"
        width: parent.width
        height: mainWindow.height * 0.2
        visible: isSmallWidth

        //Кнопка возврата назад
        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: (stackView.depth > 1) ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: mainWindow.height * 0.2
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity {
                NumberAnimation {
                }
            }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "images/navigation_previous_item.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: {
                    //console.log(stackView.currentItem)
                    //console.log(stackView.currentItem.blockBackButton)
                    stackView.pop()
                    var currHeader = mainWindow.subHeaderTextList
                    currHeader.pop()
                    mainWindow.subHeaderTextList = currHeader
                }
            }
        }

        Text {
            id: headerText
            anchors.left: parent.left
            anchors.leftMargin: backButton.x + backButton.width
            anchors.verticalCenter: parent.verticalCenter
            text: "Свернутый режим"
        }
    }

    //Модель для основного меню
    XmlListModel {
        id: pageModel
        source: "qrc:/cd_catalog.xml"
        query: "/CATALOG/FORM"
        //Заголовок страницы
        XmlRole {
            name: "title"
            query: "@name/string()"
        }
        onStatusChanged: {
            if (status == XmlListModel.Ready) {
                for (var i = 0; i < pageModel.count; i++) {
                    var tabComp = Qt.createComponent("tabPages/GroupPage.qml");
                    var tab = mainTabView.addTab(pageModel.get(i).title,tabComp)
                    //Формированная загрузка вкладки
                    tab.active = true
                    //установка номера формы
                    tab.item.formIndex = i
                    console.log("add tab ind="+i)
                }
            }
        }
    }

    //Для широкого режима
    TabView {
        id: mainTabView
        visible: !isSmallWidth
        anchors.fill: parent
        style: touchStyle
    }

    Component {
        id: touchStyle
        TabViewStyle {
            tabsAlignment: Qt.AlignVCenter
            tabOverlap: 0
            frame: Item {
            }
            tab: Item {
                implicitWidth: control.width / control.count
                implicitHeight: 50
                BorderImage {
                    anchors.fill: parent
                    border.bottom: 8
                    border.top: 8
                    source: styleData.selected ? "images/tab_selected.png" : "images/tabs_standard.png"
                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        text: styleData.title.toUpperCase()
                        font.pixelSize: 16
                    }
                    Rectangle {
                        visible: index > 0
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: 10
                        width: 1
                        color: "#3a3a3a"
                    }
                }
            }
        }
    }

    //Для узкого режима
    StackView {
        id: stackView
        visible: isSmallWidth
        anchors.fill: parent
        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                model: pageModel
                anchors.fill: parent
                delegate: AndroidDelegate {
                    text: title
                    onClicked: stackView.push({item:Qt.resolvedUrl("stackPages/GroupPage.qml"),
                                              properties:{formIndex: index}})
                }
            }
        }
    }
}
