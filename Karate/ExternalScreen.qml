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
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
Window
{
    id: root
    width: 1024
    height: 720
    property int min: 3
    property int seg: 0
    property int akaPoint: 0
    property int aoPoint: 0
    property int akaCat1Penalty: 0
    property int aoCat1Penalty: 0
    property int akaCat2Penalty: 0
    property int aoCat2Penalty: 0
    property var penaltys: ["","CHUKOKO","KEYKOKO","HANSOKU CHUI","HANSOKU"]
    function switchVisibleSlot()
    {
        root.visible = !root.visible
    }
    Action
    {
        shortcut: "F11"
        onTriggered: root.visibility=(visibility == 5 ? 2 : 5)
    }

    ColumnLayout
    {
        spacing: 0
        anchors.fill: parent
        Rectangle
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 6
            RowLayout
            {
                spacing: 0
                anchors.fill: parent
                Rectangle
                {
                    color: "red"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        anchors.fill: parent
                        text: akaPoint
                        fontSizeMode: Text.Fit
                        font.pixelSize: 800
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle
                {
                    color: "blue"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Text {
                        anchors.fill: parent
                        text: aoPoint
                        fontSizeMode: Text.Fit
                        font.pixelSize: 800
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

            }

        }
        Rectangle
        {
            color: "lightgrey"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 4
            RowLayout
            {
                anchors.fill: parent
                Item
                {
                    Layout.preferredWidth: 4
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    id: akaPenaltyArea
                    ColumnLayout
                    {
                        anchors.fill: parent
                        Item {
                            Layout.preferredHeight: 1
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                        }
                        Rectangle
                        {
                            color: "#ffffff"
                            border.color: "#000000"
                            Layout.preferredHeight:1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.fill: parent
                                text:"C1: " + penaltys[akaCat1Penalty]
                                font.pixelSize: 400
                                fontSizeMode: Text.Fit
                            }
                        }
                        Item
                        {
                            Layout.preferredHeight:1
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                        }
                        Rectangle
                        {
                            Layout.preferredHeight:1
                            color: "#ffffff"
                            border.color: "#000000"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.fill: parent
                                text:"C2: " + penaltys[akaCat2Penalty]
                                font.pixelSize: 400
                                fontSizeMode: Text.Fit
                            }
                        }
                        Item {
                            Layout.preferredHeight:1
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                        }

                    }
                }
                Text
                {
                    id:clock
                    Layout.preferredWidth: 5
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    font.pixelSize: 400
                    fontSizeMode: Text.Fit

                    text: min + ":" + (seg < 10 ? "0" + seg : seg)
                }
                Item {
                    id: aoPenaltyArea
                    Layout.preferredWidth: 4
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    ColumnLayout
                    {
                        anchors.fill: parent
                        Item {
                            Layout.preferredHeight: 1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }
                        Rectangle
                        {
                            color: "#ffffff"
                            border.color: "#000000"
                            Layout.preferredHeight:1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.fill: parent
                                text:"C1: " + penaltys[aoCat1Penalty]
                                font.pixelSize: 400
                                fontSizeMode: Text.Fit
                            }
                        }
                        Item
                        {
                            Layout.preferredHeight:1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }
                        Rectangle
                        {
                            Layout.preferredHeight:1
                            color: "#ffffff"
                            border.color: "#000000"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Text {
                                anchors.fill: parent
                                text:"C2: " + penaltys[aoCat2Penalty]
                                font.pixelSize: 400
                                fontSizeMode: Text.Fit
                            }
                        }
                        Item {
                            Layout.preferredHeight:1
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                        }

                    }

                }

            }

        }

    }

}
