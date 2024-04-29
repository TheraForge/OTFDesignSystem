//
//  SurveyCardTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 18/04/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class SurveyCardTests: XCTestCase {
    
    let title: LocalizedStringKey = "Have you taken all your medications for today?"
    let callToAction: LocalizedStringKey = "Log Medications"
    
    func testUnsansweredSurveyCard() {
        let card = UIHostingController(
            rootView:
                OTFSurveyCard(title: title,
                              callToAction: callToAction,
                              hasBeenAnswered: false)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testAnsweredSurveyCard() {
        let card = UIHostingController(
            rootView:
                OTFSurveyCard(title: title,
                              callToAction: callToAction,
                              hasBeenAnswered: true)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testCustomLabelSurveyCard() {
        let card = UIHostingController(
            rootView:
                OTFSurveyCard(title: Text(title).font(.largeTitle.italic()),
                              callToAction: callToAction,
                              hasBeenAnswered: false)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
}
