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
        SnapshotHelper.test(viewController: primaryButton)
    }
    
    func testSecondaryStyle() {
        let secondaryButton = UIHostingController(
            rootView:
                Button("Get Started") {}
                .buttonStyle(.otfSecondary)
        )
        SnapshotHelper.test(viewController: secondaryButton)
    }
    
    func testTertiaryStyle() {
        let tertiaryButton = UIHostingController(
            rootView:
                Button("Get Started") {}
                .buttonStyle(.otfTertiary)
        )
        SnapshotHelper.test(viewController: tertiaryButton)
    }
    
    func testDisabledStyles() {
        let buttonStack = VStack {
            Button("Get Started") {}.buttonStyle(.otfPrimary)
            Button("Get Started") {}.buttonStyle(.otfSecondary)
            Button("Get Started") {}.buttonStyle(.otfTertiary)
        }.disabled(true)
        
        let buttons = UIHostingController(rootView: buttonStack)
        
        SnapshotHelper.test(viewController: buttons)
    }
}
