//
//  PageLink.swift
//  VisualRichLink
//
//  Created by Alfian Losari on 17/07/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import Foundation

enum LinkType: Int {
    case visualRichLink
    case url
}

struct PageLink {
    
    let name: String
    let website: String
    let urls: [URL]

}

extension PageLink {
    
    static var samplePages: [PageLink] {
        return [
            PageLink(name: "GO-JEK", website: "https://go-jek.com", urls: [
                URL(string: "https://www.go-jek.com/go-ride/")!,
                URL(string: "https://www.go-jek.com/go-food/")!,
                URL(string: "https://www.go-jek.com/go-pay/")!,
            ]),
            PageLink(name: "Apple", website: "https://apple.com", urls: [
                URL(string: "https://www.apple.com/ipad/")!,
                URL(string: "https://www.apple.com/mac/")!,
                URL(string: "https://www.apple.com/iphone/")!
            ]),
            PageLink(name: "YouTube", website: "https://youtube.com", urls: [
                URL(string: "https://www.youtube.com/watch?v=rf4dy3ayicU&t=201s")!,
                URL(string: "https://www.youtube.com/watch?v=FOp3L2OTG6g")!,
                URL(string: "https://www.youtube.com/watch?v=Z3xSGv3Hfio")!
            ]),
            PageLink(name: "Wikipedia", website: "https://wikipedia.org", urls: [
                URL(string: "https://en.wikipedia.org/wiki/Steve_Jobs")!,
                URL(string: "https://en.wikipedia.org/wiki/Jony_Ive")!,
                URL(string: "https://en.wikipedia.org/wiki/Dieter_Rams")!,
            ]),
            PageLink(name: "Twitter", website: "https://twitter.com", urls: [
                URL(string: "https://twitter.com/tim_cook/status/1151622979777748992")!,
                URL(string: "https://twitter.com/elonmusk/status/1149370463564357632")!,
                URL(string: "https://twitter.com/drfeifei/status/1105895019888537600")!,
            ]),
            PageLink(name: "Google Maps", website: "https://maps.google.com", urls: [
                URL(string: "https://www.google.com/maps/place/Pasaraya+Blok+M/@-6.2438909,106.8006669,17z/data=!3m1!4b1!4m5!3m4!1s0x2e69f16ed5d61511:0x4b1c6d654a7fbee5!8m2!3d-6.2438962!4d106.8028556")!,
                  URL(string: "https://www.google.com/maps/place/Pacific+Place/@-6.2247206,106.8076946,17z/data=!3m1!4b1!4m5!3m4!1s0x2e69f151104aee2b:0xc4a608b34b5f03cc!8m2!3d-6.2247259!4d106.8098833")!
            ])
        ]
    }
}
