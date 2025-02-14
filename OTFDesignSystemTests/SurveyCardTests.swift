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
    
    let title: LocalizedStringKey = "Mood Check"
    let cardDescription: LocalizedStringKey = "How are you feeling today?"
    let symbol: String = "face.smiling.inverse"
    let callToAction: LocalizedStringKey = "Get Started"
    
    func testUnsansweredSurveyCard() {
        let card = UIHostingController(
            rootView:
                List {
                    OTFSurveyCard(title: title,
                                  description: cardDescription,
                                  systemImage: symbol,
                                  callToAction: callToAction,
                                  hasBeenAnswered: false)
                }.otfStyle(OTFTestStyle())
        )
        SnapshotHelper.test(viewController: card)
    }
    
    func testAnsweredSurveyCard() {
        let card = UIHostingController(
            rootView:
                List {
                    OTFSurveyCard(title: title,
                                  description: cardDescription,
                                  systemImage: symbol,
                                  callToAction: callToAction,
                                  hasBeenAnswered: true)
                }.otfStyle(OTFTestStyle())
        )
        SnapshotHelper.test(viewController: card)
    }
}
