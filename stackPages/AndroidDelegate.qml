import QtQuick 2.1

Item {
    id: root
    width: parent.width
    height: Math.max(sp(88),textitem.paintedHeight)

    property alias text: textitem.text
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#11ffffff"
        visible: mouse.pressed
    }

    Text {
        id: textitem
        color: "white"
        font.pixelSize: sp(32)
        text: modelData
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: sp(30)
        //elide: Text.ElideRight
        wrapMode: Text.Wrap
        anchors.right: nextItemImage.left
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: sp(15)
        height: 1
        color: "#424246"
    }

    Image {
        id: nextItemImage
        anchors.right: parent.right
        anchors.rightMargin: sp(20)
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/navigation_next_item.png"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()

    }
}
