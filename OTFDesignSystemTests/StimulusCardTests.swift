//
//  StimulusCardTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 26/09/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class StimulusCardTests: XCTestCase {
    
    let title: LocalizedStringKey = "Rhythmic Cues"
    let cardDescription: LocalizedStringKey = "Audio beats to help regulate your walking"
    let symbol: String = "waveform"
    let tintColor: Color = .green
    
    func testStimuliCard() {
        let card = UIHostingController(
            rootView:
                List {
                    OTFStimulusCard(
                        title: title,
                        description: cardDescription,
                        systemImage: symbol,
                        tintColor: tintColor
                    )
                }.otfStyle(OTFTestStyle())
        )
        SnapshotHelper.test(viewController: card)
    }
}

