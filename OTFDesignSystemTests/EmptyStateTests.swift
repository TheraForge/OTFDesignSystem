//
//  EmptyStateTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 06/10/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class EmptyStateTests: XCTestCase {
    let title: LocalizedStringKey = .init(stringLiteral: "No Items Found")
    let icon: String = "magnifyingglass"
    let message: LocalizedStringKey = .init(stringLiteral: "It looks like there’s nothing here yet. Start adding some items to get going!")
    let action = OTFEmptyStateAction(label: .init(stringLiteral: "Add New Item")) { }
    
    func testTitleOnlyEmptyState() {
        let emptyState = OTFEmptyState(title)
            .otfStyle(OTFTestStyle())
            .ignoresSafeArea()
        SnapshotHelper.test(swiftUIView: emptyState)
    }
    
    func testTitleAndIconEmptyState() {
        let emptyState = OTFEmptyState(title, systemName: icon)
            .otfStyle(OTFTestStyle())
            .ignoresSafeArea()
        SnapshotHelper.test(swiftUIView: emptyState)
    }
    
    func testTitleAndMessageEmptyState() {
        let emptyState = OTFEmptyState(title, message: message)
            .otfStyle(OTFTestStyle())
            .ignoresSafeArea()
        SnapshotHelper.test(swiftUIView: emptyState)
    }
    
    func testTitleIconAndMessageEmptyState() {
        let emptyState = OTFEmptyState(title, systemName: icon, message: message)
            .otfStyle(OTFTestStyle())
            .ignoresSafeArea()
        SnapshotHelper.test(swiftUIView: emptyState)
    }
    
    func testCompleteEmptyState() {
        let emptyState = OTFEmptyState(title, systemName: icon, message: message, action: action)
            .otfStyle(OTFTestStyle())
            .ignoresSafeArea()
        SnapshotHelper.test(swiftUIView: emptyState)
    }
}
