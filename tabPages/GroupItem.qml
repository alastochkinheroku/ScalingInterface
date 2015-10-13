import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.0
import QtQuick.Layouts 1.1

import "../common"

//Отображает группы CD-дисков
ListView {
    id: view
    property int formIndex
    property int groupIndex
    orientation: ListView.Horizontal
    interactive: true
    clip: true


    model: CDModel{
        formIndex: view.formIndex
        groupIndex: view.groupIndex
    }

    delegate: CDItem{
        width: sp(200)
        height: sp(200)
    }
}
