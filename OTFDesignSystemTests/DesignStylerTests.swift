//
//  DesignStylerTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 11/03/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class DesignStylerTests: XCTestCase {
    
    class StyleUnderTesting: OTFDesignStyler {
        var color: OTFDesignStylerColor = TestColor()
        
        class TestColor: OTFDesignStylerColor {
            var primaryButton: Color { .red }
            var secondaryButton: Color { . orange }
            var tertiaryButton: Color { .green }
            
            var label: Color { .red }
            var secondaryLabel: Color { .gray }
        }
    }
    
    func testStyleOnButtonStyles() {
        let button = Button("Get Started") {}.otfStyle(StyleUnderTesting())
        
        let primaryButton = UIHostingController(rootView: button.buttonStyle(.otfPrimary))
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro))
        let secondaryButton = UIHostingController(rootView: button.buttonStyle(.otfSecondary))
        assertSnapshot(matching: secondaryButton, as: .image(on: .iPhone13Pro))
        let tertiaryButton = UIHostingController(rootView: button.buttonStyle(.otfTertiary))
        assertSnapshot(matching: tertiaryButton, as: .image(on: .iPhone13Pro))
    }
    
    func testStyleOnInfoCard() {
        let card = UIHostingController(
            rootView: OTFInfoCard(title: "Health Insights Dashboard",
                                  description: "Gain a comprehensive view of your health. Monitor vital signs, record sympoms and track medications all in one place.",
                                  actions: [
                                    .init(label: "Monitor Vital Signs", style: .primary),
                                    .init(label: "Record Symptomps", style: .secondary),
                                    .init(label: "Track Medications", style: .tertiary)
                                  ])
            .otfStyle(StyleUnderTesting())
        )
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro))
    }
}
