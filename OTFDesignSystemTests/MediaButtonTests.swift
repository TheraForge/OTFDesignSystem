//
//  MediaButtonTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 18/04/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class MediaButtonTests: XCTestCase {

    func testEnabledButton() {
        let button = UIHostingController(
            rootView: Button {} label: {
                Image(systemName: "play.fill")
            }.buttonStyle(.otfMedia)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: button, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: button, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testDisabledButton() {
        let button = UIHostingController(
            rootView: Button {} label: {
                Image(systemName: "play.fill")
            }
                .buttonStyle(.otfMedia)
                .disabled(true)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: button, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: button, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
}
