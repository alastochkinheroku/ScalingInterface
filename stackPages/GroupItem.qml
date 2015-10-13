import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

import "../common"

//Отображает группы с CD
ListView {
    id: view
    anchors.fill: parent
    property int formIndex
    property int groupIndex
    orientation: ListView.Horizontal

    height: childrenRect.height
    model: CDModel{
       formIndex: view.formIndex
       groupIndex: view.groupIndex
   }
    delegate: CDItem{
        width: view.width-sp(10)
        height: width
    }
}
