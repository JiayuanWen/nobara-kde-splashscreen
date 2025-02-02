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

    // Stage variable, can be used to control elements mid-run (such as loading bar). 
    // Values: integer 1 to 6 (there are total of 6 stages), assigned automatically by Plasma during startup.
    // See "Sequence control" section for usage.
    property int stage

    // ------------------------
    // Variables
    // ------------------------

    property var indicatorBaseOpacity: 0.5 // Change this value to adjust progress indicator opacity

    // ------------------------
    // Components
    // ------------------------

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

    // Progress indicator at the bottom (id: indicator)
    Image {
        readonly property real size: Kirigami.Units.gridUnit * 12

        id: indicator
        source: "images/tem.gif"
        anchors.horizontalCenter: parent.horizontalCenter
        y: (parent.height - height) / 1.1
        sourceSize.width: size
        visible: true
        opacity: indicatorBaseOpacity
    }

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

    // Animation function for changing credit opacity
    OpacityAnimator {
        id: indicatorOpacity
        running: false
        target: indicator
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
            // Make logo show on start of stage 1
            logoOpacity.running = true;

            // Set loading indicator stage to 1
            indicator.source = "images/loading-1.png";

        } else if (stage == 2) {
            // Set loading indicator stage to 1
            indicator.source = "images/loading-1.png";

        } else if (stage == 3) {
            // Set loading indicator stage to 2
            indicator.source = "images/loading-2.png";

        } else if (stage == 4) {
            // Set loading indicator stage to 3
            indicator.source = "images/loading-3.png";

        } else if (stage == 5) {
            // Set loading indicator stage to 4
            indicator.source = "images/loading-4.png";

        } else if (stage == 6) {
            // Set loading indicator stage to 5
            indicator.source = "images/loading-5.png";


            // Hide indicator on last stage
            indicatorOpacity.duration = 1000;
            indicatorOpacity.from = indicatorBaseOpacity;
            indicatorOpacity.to = 0;
            indicatorOpacity.running = true;
            
        }
    }
}
