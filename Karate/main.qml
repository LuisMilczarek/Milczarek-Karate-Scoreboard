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
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: root
    visible: true
    width:1920
    height: 1080
    title: "Milczarek Karate Scoreboard"
    property int akaPoints: 0
    property int aoPoints: 0
    property int min: 3
    property int seg: 0
    property int akaCat1Penalty: 0
    property int akaCat2Penalty: 0
    property int aoCat1Penalty: 0
    property int aoCat2Penalty: 0
    Action
    {
        shortcut: "F11"
        onTriggered: root.visibility=(visibility == 5 ? 2 : 5)
    }
    SoundEffect
    {
        id: buzzer
        source: "./buzzer.wav"
    }

    menuBar : MenuBar
    {
        anchors.left: parent.left
        anchors.right: parent.right
        background: Rectangle{anchors.top: myMenu.top;anchors.bottom: myMenu.bottom;color: "lightgray"}
        id: myMenu

        Menu
        {
            title: qsTr("Arquivo")
            background: Rectangle{border.color: "black";border.width: 1;implicitWidth: 200;color: "lightgray"}
            Action
            {
                text: qsTr("Tela Externa")
                onTriggered: {extWin.switchVisibleSlot();}
                shortcut: "Ctrl+T"
            }
            Action
            {
                text: qsTr("Sobre")
                onTriggered:{aboutDialog.visible = true;print(Qt.locale().name)}
            }
        }

    }
    RowLayout
    {
        spacing: 0
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.top: myMenu.bottom
        Score
        {
            id: aka
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            backgroundColor: "#ff0000"
            buttonsEnable: myControl.buttonsEnable
            onPoint: {if(score - ao.score >= 8){buzzer.play();};akaPoints=aka.score;}
            onPenaltyChange: {root.akaCat1Penalty = aka.actualCat1Penalty; root.akaCat2Penalty= root.akaCat2Penalty;console.log("hello")}
        }

        Control
        {
            id: myControl
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            onTimeOut:buzzer.play()
            onReset: {aka.score=0;ao.score=0}
            onTimeChange:{root.min = myControl.actualMin; root.seg= myControl.actualSeg;}
        }

        Score
        {
            id: ao
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 4
            backgroundColor: "#0000ff"
            buttonsEnable: myControl.buttonsEnable
            onPoint: {if(score - aka.score >= 8){buzzer.play()};aoPoints=ao.score;}
            onPenaltyChange: {root.aoCat1Penalty = ao.actualCat1Penalty; root.aoCat2Penalty= root.aoCat2Penalty;}
        }
    }


    ExternalScreen
    {
        id: extWin
        visible: false
        min: root.min
        seg: root.seg
        akaPoint: akaPoints
        aoPoint: aoPoints
        akaCat1Penalty: root.akaCat1Penalty
        akaCat2Penalty: root.akaCat2Penalty
        aoCat1Penalty: root.aoCat1Penalty
        aoCat2Penalty: root.aoCat2Penalty

    }

    MessageDialog
    {
        id: aboutDialog
        title: qsTr("Sobre")


        text: "<b> Milczarek Karate Score BETA 0.1.1</b>, <br>
                <p>
                <i>Basead on Qt 5.13.0</i><br>
                Compiled in 2019/8/29<br>
                Copyright© Luís Felipe Milczarek Quadros, all rigts reserved.<br>
                This software is under LGPLv3 license, for more information use this link: https://www.gnu.org/licenses/lgpl-3.0.en.html or read the file LICENSE.
                This software is under beta development, errors may occur. Please, send an email in this case.<br>
                The author DONT give any warranty by the use of this software.</p>
                <p>
                Author: Luís Milczarek<br>
                e-mail: luis.milczarek@hotmail.com</p>"
    }
}
