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
        SnapshotHelper.test(viewController: primaryButton, interfaceStyle: .light)
        let secondaryButton = UIHostingController(rootView: button.buttonStyle(.otfSecondary))
        SnapshotHelper.test(viewController: secondaryButton, interfaceStyle: .light)
        let tertiaryButton = UIHostingController(rootView: button.buttonStyle(.otfTertiary))
        SnapshotHelper.test(viewController: tertiaryButton, interfaceStyle: .light)
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
        SnapshotHelper.test(viewController: card, interfaceStyle: .light)
    }
}
