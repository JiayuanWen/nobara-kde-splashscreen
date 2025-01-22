/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 3,
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

import QtQuick 2.5
import QtQuick.Window 2.2
import org.kde.kirigami 2 as Kirigami

Rectangle {
    id: root
    color: "#000000"

    property int stage

    // ------------------------
    // Components
    // ------------------------

    // Center logo end version ("Nobara" that appears at the end of loading, id: logoEnd)
    AnimatedImage {
            readonly property real size: Kirigami.Units.gridUnit * 8

            id: logoEnd
            source: "images/logo-end.gif"
            sourceSize.height: size
            //sourceSize.width: size
            anchors.centerIn: parent
            paused: false
            smooth: true
            visible: true
    }
    // Center logo (id: logo)
    AnimatedImage {
            readonly property real size: Kirigami.Units.gridUnit * 8

            id: logo
            source: "images/logo.gif"
            sourceSize.height: size
            sourceSize.width: size
            anchors.centerIn: parent
            paused: false
            smooth: true
            visible: true
    }

    // Credit (Distro author credit at bottom, id: subtitle)
    Image {
        readonly property real size: Kirigami.Units.gridUnit * 12

        id: credit
        source: "images/credit.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: (parent.height - height) / 1.1
        sourceSize.width: size
        visible: true
    }

    // Item {
    //     id: content
    //     anchors.fill: parent
    //     opacity: 1
    //
    // }

    // ------------------------
    // Functions
    // ------------------------

    // Animation function for changing logo opacity
    OpacityAnimator {
        id: logoOpacity
        running: false
        target: logo
        from: 0
        to: 1
        duration: 300
        easing.type: Easing.InOutQuad
    }

    // Animation function for changing logo (end version) opacity
    OpacityAnimator {
        id: logoEndOpacity
        running: false
        target: logoEnd
        from: 0
        to: 1
        duration: 300
        easing.type: Easing.InOutQuad
    }

    // Animation function for changing credit opacity
    OpacityAnimator {
        id: creditOpacity
        running: false
        target: credit
        from: 0
        to: 1
        duration: 300
        easing.type: Easing.InOutQuad
    }

    // ------------------------
    // Sequence control
    // ------------------------

    // For changing properties on loading stage change
    onStageChanged: {
        if (stage == 1) {
            // Make main logo show on start of stage 1
            logoOpacity.running = true;

            // Hide end version of logo and credit on start since they are ment for the last stage
            logoEndOpacity.from = 0;
            logoEndOpacity.to = 0;
            logoEndOpacity.duration = 1;
            logoEndOpacity.running = true;

            creditOpacity.from = 0;
            creditOpacity.to = 0;
            creditOpacity.duration = 1;
            creditOpacity.running = true;

        } else if (stage == 5) {

            // Make main logo hide
            logoOpacity.from = 1;
            logoOpacity.to = 0;
            logoOpacity.running = true;

            // Make end version logo show
            logoEndOpacity.duration = 100;
            logoEndOpacity.from = 0;
            logoEndOpacity.to = 1;
            // A hacky way to restart the gif animation sequence (set source to something else then switch back to actual source)
            logoEnd.source = "images/tem.gif"
            logoEnd.source = "images/logo-end.gif"
            logoEndOpacity.running = true;

            // Make credit show as well
            creditOpacity.duration = 500;
            creditOpacity.from = 0;
            creditOpacity.to = 0;
            creditOpacity.running = true;
        }
    }
}
