#This file is part of Milczarek Karate Scoreboard.
#
#    Milczarek Karate Scoreboard: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Milczarek Karate Scoreboard is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License Lesser for more details.
#
#    You should have received a copy of the GNU General Public License Lesser
#    along with Milczarek Karate Scoreboard.  If not, see <https://www.gnu.org/licenses/>6.

#Este arquivo é parte do programa Milczarek Karate Scoreboard
#
#   Milczarek Karate Scoreboard é um software livre; você pode redistribuí-lo e/ou
#   modificá-lo dentro dos termos da Licença Pública Geral Menor GNU como
#   publicada pela Free Software Foundation (FSF); na versão 3 da
#   Licença, ou (a seu critério) qualquer versão posterior.
#
#   Este programa é distribuído na esperança de que possa ser útil,
#   mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO
#   a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
#   Licença Pública Geral Menor GNU para maiores detalhes.
#
#   Você deve ter recebido uma cópia da Licença Pública Geral Menor GNU junto
#   com este programa, Se não, veja <http://www.gnu.org/licenses/>.



QT += quick
CONFIG += c++17

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =./

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
#else: unix:!android: target.path = /home/luismilczarek/Android/Sdk/tools/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Control.qml \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    score.qml

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
