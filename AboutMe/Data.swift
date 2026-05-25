//
//  Data.swift
//  AboutMe
//
//  Created by user on 5/24/26.
//

/*
See the License.txt file for this sample’s licensing information.
*/

import Foundation
import SwiftUI

struct Info {
    let title: String
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

let information = Info(
    title: "iOS Dev",
    image: "ChatGPT03",
    name: "Jose Marquez",
    story: "Ever since I found a dusty beige tower humming under a CRT in the late 90s, I've been fascinated by how bits become experiences. I learned to defrag hard drives, set jumpers, and survive the screech of dial-up. I installed shareware from CD-ROMs, typed commands into MS-DOS, and watched pixels bloom on 256-color screens.\n\nThen I met Slackware Linux. Floppy installs, kernel configs, and a window manager that felt like the future: Enlightenment. I learned what a runlevel was, compiled my first kernel, and tweaked themes until every shadow and bevel felt just right. X started up with that satisfying flicker, and suddenly the desktop was mine to shape.\n\nI spent nights exploring FTP mirrors and dialing into BBSs with a US Robotics 56k modem—the handshake chorus still lives in my head. I traded tips, scripts, and shareware, and watched download bars crawl while reading readme files like novels.\n\nAt school and labs I discovered SGI workstations running IRIX. Indigo and Octane boxes glowed like artifacts from another timeline. On them, I saw Alias|Wavefront Maya and StudioTools in motion—splines, NURBS, and render passes that made my jaw drop. The marriage of art and math felt like magic, and I chased that feeling into every tool I could find.\n\nIn the 2000s I built my first PC from parts: an ATX case, a rattling 80mm fan, and a GPU that needed a Molex adapter. I broke things, flashed BIOSes, and learned to read schematics at 2 a.m. Open-source communities taught me to ask better questions and give back better answers.\n\nToday I tinker with single-board computers, containers, and on-device ML. I care about privacy, performance, and the craft of making software that respects users. I still love the smell of warm solder and the thrill of a clean boot after a risky change.\n\nWhen I'm not debugging, I'm exploring retro hardware and preserving the stories behind it—because the future makes more sense when you can feel the weight of a clicky keyboard and hear a floppy spin up.\n\n ",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["🥐", "🌮", "🍣"],
    colors: [Color.blue, Color.purple, Color.pink],
    funFacts: [
        "The femur is the longest and largest bone in the human body.",
        "The moon is 238,900 miles away.",
        "Prince’s last name was Nelson.",
        "503 new species were discovered in 2020.",
        "Ice is 9 percent less dense than liquid water.",
        "You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐",
        "A collection of hippos is called a bloat.",
        "White sand beaches are made of parrotfish poop.",
    ]
)

