/*
*This file is part of Milczarek Karate Scoreboard.
*
*    Milczarek Karate Scoreboard: you can redistribute it and/or modify
*    it under the terms of the GNU Lesser General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    Milczarek Karate Scoreboard is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License Lesser for more details.
*
*    You should have received a copy of the GNU General Public License Lesser
*    along with Milczarek Karate Scoreboard.  If not, see <https://www.gnu.org/licenses/>6.

*Este arquivo é parte do programa Milczarek Karate Scoreboard
*
*   Milczarek Karate Scoreboard é um software livre; você pode redistribuí-lo e/ou
*   modificá-lo dentro dos termos da Licença Pública Geral Menor GNU como
*   publicada pela Free Software Foundation (FSF); na versão 3 da
*   Licença, ou (a seu critério) qualquer versão posterior.
*
*   Este programa é distribuído na esperança de que possa ser útil,
*   mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO
*   a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
*   Licença Pública Geral Menor GNU para maiores detalhes.
*
*   Você deve ter recebido uma cópia da Licença Pública Geral Menor GNU junto
*   com este programa, Se não, veja <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtMultimedia 5.12

ApplicationWindow {
    id: root
    visible: true
    width:1920
    height: 1080
    title: qsTr("Milczarek Karate Scoreboard")
    //property bool externalWinV : false
    property int akaPoints: 0
    property int aoPoints: 0
    signal akaPointChanged()
    signal aoPointChanged()
    SoundEffect
    {
        id: buzzer
        source: "./buzzer.wav"
    }

    /*menuBar : MenuBar
    {
        anchors.left: parent.left
        anchors.right: parent.right
        background: Rectangle{anchors.top: myMenu.top;anchors.bottom: myMenu.bottom;color: "lightgray"}
        id: myMenu
        implicitHeight: 20
        Menu
        {
            title: qsTr("teste")
            Action{text: qsTr("&About");onTriggered: {externalWinV= !externalWinV} }
        }

    }*/
    RowLayout
    {
        spacing: 0
        anchors.fill: parent
        Score
        {
            id: aka
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            backgroundColor: "#ff0000"
            buttonsEnable: myControl.buttonsEnable
            onPoint: {if(score - ao.score >= 8){buzzer.play();};akaPoints=aka.score;root.akaPointChanged();}

        }

        Control
        {
            id: myControl
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            onTimeout:buzzer.play()
            onReset: {aka.score=0;ao.score=0;aka.actualCat1Penalty=0;aka.actualCat2Penalty=0;ao.actualCat1Penalty=0;ao.actualCat2Penalty=0}
        }

        Score
        {
            id: ao
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            backgroundColor: "#0000ff"
            buttonsEnable: myControl.buttonsEnable
            onPoint: {if(score - aka.score >= 8){buzzer.play()}}
        }
    }

/*
    ExternalScreen
    {
        id: extWin
        visible: true

    }
    Connections
    {
        target: root
        onAkaPointChanged:
        {
            console.log("teste1")
            extWin.akaPointSlot(akaPoints)
        }
    }*/

}
