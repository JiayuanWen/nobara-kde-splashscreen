/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore

Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = loadingIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
            pausa.start();
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            readonly property real size: PlasmaCore.Units.gridUnit * 7

            anchors.centerIn: parent

            asynchronous: true
            source: "images/logo.svg"

            sourceSize.width: size
            sourceSize.height: size
        }

        Image {
            id: loadingIndicator

            //in the middle of the remaining space
            y: parent.height - (parent.height - logo.y) / 4 - height/2
            anchors.horizontalCenter: parent.horizontalCenter
            asynchronous: true
            source: "images/busywidget.svgz"
            sourceSize.height: PlasmaCore.Units.gridUnit * 2
            sourceSize.width: PlasmaCore.Units.gridUnit * 2
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                // Not using a standard duration value because we don't want the
                // animation to spin faster or slower based on the user's animation
                // scaling preferences; it doesn't make sense in this context
                duration: 2100
                loops: Animation.Infinite
                // Don't want it to animate at all if the user has disabled animations
                running: PlasmaCore.Units.longDuration > 1
            }
        }
        Row {
            spacing: units.smallSpacing*2
            anchors {
                bottom: parent.bottom
                //right: parent.right
                //margins: PlasmaCore.Units.gridUnit
                margins: units.gridUnit
            } anchors.horizontalCenter: parent.horizontalCenter
            id: credit
            opacity: 0
            ///*
            Text {
                color: "#eff0f1"
                anchors.verticalCenter: parent.verticalCenter
                text: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "This is the first text the user sees while starting in the splash screen, should be translated as something short, is a form that can be seen on a product. Plasma is the project name so shouldn't be translated.", "Plasma made by KDE")
            }
            Image {
                asynchronous: true
                source: "images/kde.svgz"
                sourceSize.height: PlasmaCore.Units.gridUnit * 2
                sourceSize.width: PlasmaCore.Units.gridUnit * 2
            }
            //*/
        }
    }

    // Loading bar
    /*
    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height
        source: "images/rectangle.svg"
        Rectangle {
            y: 232
            radius: 0
            anchors.horizontalCenterOffset: 0
            color: "#ff7f7f"
            anchors {
                bottom: parent.bottom
                bottomMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            height: 2
            width: height*170
            Rectangle {
                id: topRectRectangle
                radius: 1
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 6) * (stage - 0.01)
                color: "#7f3fbf"
                Behavior on width {
                    PropertyAnimation {
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
    //*/

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: PlasmaCore.Units.veryLongDuration * 2
        easing.type: Easing.InOutQuad
    }

    Timer {
        id: pausa
        interval: 1500; running: false; repeat: false;
        onTriggered: root.viewLoadingText();
    }
}
