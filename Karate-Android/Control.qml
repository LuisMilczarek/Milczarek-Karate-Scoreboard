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

import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Rectangle {
    id:root

    property color backGround: "lightgrey"
    property bool buttonsEnable: true
    property int minSet: 3
    property int segSet: 0
    property int actualMin: 3
    property int actualSeg: 0
    property int actualMili: 0
    property double finishTime: new Date().getTime()
    property double timeSpan: new Date().getTime()
    signal timeout();
    signal reset();

    Timer
    {
        id: myTimer
        repeat: true
        interval: 100
        onTriggered:
        {
            timeSpan= finishTime - new Date().getTime()
            actualMin = timeSpan / 60000
            actualSeg = (timeSpan % 60000) / 1000
            actualMili= (timeSpan % 60000) - (actualSeg * 1000)
            if(actualMin <= 0 && actualSeg <= 0)
            {
                stop();
                root.timeout();
            }
        }
    }

    color: backGround
    ColumnLayout
    {
        spacing: 0
        anchors.fill: parent
        RowLayout
        {

            spacing: 0
            Layout.fillHeight: true
            Layout.fillWidth: true

            SpinBox
            {

                to:20
                from: 0
                value: 3
                id: minSpin
                enabled: buttonsEnable
                onValueChanged: minSet=value
                Layout.fillWidth: true

            }
            SpinBox
            {
                to: 59
                from: 0
                enabled: buttonsEnable
                onValueChanged: segSet=value
                Layout.fillWidth: true


            }

       }


        Text {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            Layout.alignment: Qt.AlignHCenter
            text: actualMin + ":" + (actualSeg <10 ? "0" + actualSeg : actualSeg)
            textFormat: Text.AutoText
            font.pointSize: 400
            fontSizeMode: Text.Fit

            renderType: Text.QtRendering
        }

        Rectangle
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 3
            color: backGround
            ColumnLayout
            {
                anchors.fill: parent
                Button
                {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    text: "HAJIME"

                    onClicked:
                    {
                        //text=(text == "HAJIME" ? "YAME" : "HAJIME");

                        if(text == "HAJIME")
                        {
                            buttonsEnable= false
                            text= "YAME"
                            myTimer.start()
                            finishTime = new Date().getTime() + (actualMin*60000 + actualSeg*1000 + actualMili);
                        }
                        else
                        {
                            buttonsEnable=true
                            text = "HAJIME"
                            myTimer.stop()
                        }
                    }
                }
                Button
                {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    text: "Reset"
                    enabled: buttonsEnable
                    onClicked:
                    {
                        actualMin = minSet;
                        actualSeg = segSet;
                        root.reset()
                    }

                }
                Item
                {
                    Layout.fillHeight: true
                    Layout.preferredHeight: 10
                }
            }
        }
    }
}
