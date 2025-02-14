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
        SnapshotHelper.test(viewController: button)
    }
    
    func testDisabledButton() {
        let button = UIHostingController(
            rootView: Button {} label: {
                Image(systemName: "play.fill")
            }
                .buttonStyle(.otfMedia)
                .disabled(true)
        )
        SnapshotHelper.test(viewController: button)
    }
}
