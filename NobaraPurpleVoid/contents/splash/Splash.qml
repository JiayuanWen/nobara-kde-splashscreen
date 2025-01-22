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
            opacity: 0 // Make it invisible since it is to be seen at end of splash, not beginning
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
            opacity: 1
            paused: false
            smooth: true
            visible: true
    }

    // Tribute (Distro author tribute at bottom, id: subtitle)
    Image {
        readonly property real size: Kirigami.Units.gridUnit * 12

        id: tribute
        source: "images/tribute.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: (parent.height - height) / 1.1
        opacity: 0 // Make it invisible for it is to be seen at end of splash
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

    // Function for changing opacity (transparency) on the fly
    OpacityAnimator {
        id: fadeAnimation
        running: false
        target: null_
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }

    // ------------------------
    // Sequence control
    // ------------------------

    // For changing properties on loading stage change
    onStageChanged: {
        if (stage == 1) {
            // Make main logo show on start of stage 1
            logo.opacity = 1;
            fadeAnimation.target = logo;
            fadeAnimation.from = 0;
            fadeAnimation.to = 1;
            fadeAnimation.running = true;

        } else if (stage == 5) {

            // Make main logo hide
            fadeAnimation.target = logo;
            fadeAnimation.duration = 300;
            fadeAnimation.from = 1;
            fadeAnimation.to = 0;
            fadeAnimation.running = true;

            // Make the end version of logo show
            logoEnd.opacity = 1;
            // A hacky way to restart the gif animation sequence (set source to something else then switch back to actual source)
            logoEnd.source = "images/tem.gif"
            logoEnd.source = "images/logo-end.gif"
            fadeAnimation.target = logoEnd;
            fadeAnimation.duration = 100;
            fadeAnimation.from = 0;
            fadeAnimation.to = 1;
            fadeAnimation.running = true;

            // Make tribute show as well
            tribute.opacity = 0.30;
            fadeAnimation.target = tribute;
            fadeAnimation.duration = 500;
            fadeAnimation.from = 0;
            fadeAnimation.to = 1;
            fadeAnimation.running = true;
        }
    }
}
