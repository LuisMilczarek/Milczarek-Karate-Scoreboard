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
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12

Rectangle {
        id: scoreArea
        color: backgroundColor

        property int score: 0
        property int actualCat1Penalty: 0
        property int actualCat2Penalty: 0
        property var penalty: ["","CHUKOKU","KEIKOKU","HANSOKU CHUI","HANSOKU"]
        property color backgroundColor: "#ffffff"
        property bool  buttonsEnable: true
        signal point()
        signal penaltyChange()

        ColumnLayout {
            id: column
            spacing: 0
            anchors.fill: parent

            Text {
                id: element
                text: score
                property string property0: "none.none"
                renderType: Text.QtRendering
                font.weight: Font.Medium
                textFormat: Text.AutoText
                lineHeight: 1
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 1
                Layout.preferredWidth: -1
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 400
            }

            Rectangle {
                id: rectangle3
                width: 200
                height: 200
                color: backgroundColor
                Layout.preferredHeight: 1
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true

                ColumnLayout {
                    id: columnLayout
                    spacing: 2
                    anchors.fill: parent

                    RowLayout {
                        id: rowLayout1
                        width: 100
                        height: 100
                        Layout.preferredHeight: 1
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        spacing: 0
                        Item {
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                        }
                        Button {
                            id: yoko
                            text: "YOKO"
                            flat: false
                            onClicked: {++score;scoreArea.point()}
                            enabled: buttonsEnable
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                            

                        }

                        Button {
                            id: wazari
                            text: "WAZARI"
                            onClicked: {score +=2;scoreArea.point();}
                            enabled: buttonsEnable
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true

                        }
                        Button {
                            id: ippon
                            text: "IPPON"
                            onClicked: {score +=3;scoreArea.point()}
                            enabled: buttonsEnable
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                        }
                        Item {
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                        }
                    }

                    Button {
                        id: lessPoint
                        text: "-1"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                        onClicked: {if(score > 0){--score;scoreArea.point()}}
                        enabled: buttonsEnable
                    }

                    RowLayout {
                        id: rowLayout2
                        width: 100
                        height: 100
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                        Layout.preferredHeight: 1
                        Layout.fillHeight: true
                        spacing: 0

                        Button {
                            id: cat1Less
                            text: "-1"
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                            onClicked: {if(actualCat1Penalty > 0){--actualCat1Penalty;scoreArea.penaltyChange()}}
                            enabled: buttonsEnable
                        }

                        Button {
                            id: cat1
                            text: "C1"
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                            onClicked: {if(actualCat1Penalty< penalty.length -1){++actualCat1Penalty;scoreArea.penaltyChange()}}
                            enabled: buttonsEnable
                        }

                        Rectangle {
                            id: rectangle5
                            width: 100
                            height: 40
                            color: "#ffffff"
                            Layout.minimumHeight: 40
                            Layout.fillHeight: false
                            Layout.preferredWidth: 2
                            border.color: "#000000"
                            Layout.fillWidth: true
                            Layout.preferredHeight: -1

                            Text {
                                id: cat1Dysplay
                                color: "#000000"
                                text: penalty[actualCat1Penalty]
                                anchors.fill: parent
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignBaseline
                                styleColor: "#ffffff"
                                font.capitalization: Font.AllUppercase
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                lineHeight: 1
                                fontSizeMode: Text.Fit
                                Layout.fillHeight: false
                                Layout.fillWidth: true
                                font.pixelSize: 400
                            }
                        }
                    }

                    RowLayout {
                        id: rowLayout3
                        width: 100
                        height: 100
                        Layout.preferredWidth: 1
                        Layout.fillWidth: true
                        Button {
                            id: cat2Less
                            text: "-1"
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                            onClicked:{if(actualCat2Penalty > 0){--actualCat2Penalty;scoreArea.penaltyChange()}}
                            enabled: buttonsEnable
                        }

                        Button {
                            id: cat2
                            text: "C2"
                            Layout.preferredWidth: 1
                            Layout.fillWidth: true
                            onClicked: {if(actualCat2Penalty< penalty.length -1){++actualCat2Penalty;scoreArea.penaltyChange()}}
                            enabled: buttonsEnable
                        }

                        Rectangle {
                            id: rectangle6
                            width: 100
                            height: 40
                            color: "#ffffff"
                            Layout.preferredWidth: 2
                            Layout.fillWidth: true
                            Text {
                                id: cat2Dysplay
                                color: "#000000"
                                text: penalty[actualCat2Penalty]
                                verticalAlignment: Text.AlignVCenter
                                Layout.fillWidth: true
                                styleColor: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                lineHeight: 1
                                font.pixelSize: 400
                                font.capitalization: Font.AllUppercase
                                fontSizeMode: Text.Fit
                                anchors.fill: parent
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignBaseline
                                Layout.fillHeight: false
                            }
                            Layout.minimumHeight: 40
                            Layout.preferredHeight: -1
                            Layout.fillHeight: false
                            border.color: "#000000"
                        }
                        spacing: 0
                        Layout.preferredHeight: 1
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }

