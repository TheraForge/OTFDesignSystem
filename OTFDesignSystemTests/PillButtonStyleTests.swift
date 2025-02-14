//
//  PillButtonStyleTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 06/10/24.
//

import Foundation

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class PillButtonStyleTests: XCTestCase {
    
    let button: some View = Button {} label: {
        Label("Add New Item", systemImage: "plus")
    }
        .buttonStyle(.otfPill)
        .otfStyle(OTFTestStyle())

    func testEnabledButton() {
        SnapshotHelper.test(swiftUIView: button)
    }
    
    func testDisabledButton() {
        SnapshotHelper.test(swiftUIView: button.disabled(true))
    }
}
