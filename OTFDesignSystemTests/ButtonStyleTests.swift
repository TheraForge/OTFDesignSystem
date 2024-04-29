//
//  ButtonStyleTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 10/03/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class ButtonStyleTests: XCTestCase {
    
    func testPrimaryStyle() {
        let primaryButton = UIHostingController(
            rootView:
                Button("Get Started") {}
                .buttonStyle(.otfPrimary)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testSecondaryStyle() {
        let primaryButton = UIHostingController(
            rootView:
                Button("Get Started") {}
                .buttonStyle(.otfSecondary)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testTertiaryStyle() {
        let primaryButton = UIHostingController(
            rootView:
                Button("Get Started") {}
                .buttonStyle(.otfTertiary)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: primaryButton, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testDisabledStyles() {
        let buttonStack = VStack {
            Button("Get Started") {}.buttonStyle(.otfPrimary)
            Button("Get Started") {}.buttonStyle(.otfSecondary)
            Button("Get Started") {}.buttonStyle(.otfTertiary)
        }.disabled(true)
        
        let buttons = UIHostingController(rootView: buttonStack)
        
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: buttons, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: buttons, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
}
