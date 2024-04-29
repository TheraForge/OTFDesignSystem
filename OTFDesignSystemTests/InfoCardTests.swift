//
//  InfoCardTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 11/03/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class InfoCardTests: XCTestCase {
    
    let title: LocalizedStringKey = "Medication Tracker"
    let subtitle: LocalizedStringKey = "Manage medications effortlessly. Set reminders and track doses for better adherence."
    
    let primaryAction = "Track Doses"
    let secondaryAction = "Set Reminders"
    
    func testCardWithTitleAndDescription() {
        let card = UIHostingController(
            rootView:
                OTFInfoCard(title: title,
                            description: subtitle)
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testCardWithActions() {
        let card = UIHostingController(
            rootView:
                OTFInfoCard(title: title,
                            description: subtitle, actions: [
                    .init(label: primaryAction, style: .primary),
                    .init(label: secondaryAction, style: .secondary)
                ])
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testCardWithCustomLabels() {
        let card = UIHostingController(
            rootView:
                OTFInfoCard(
                    title: Text(title).font(.title).fontWeight(.black),
                    description: Text(subtitle).fontWeight(.semibold),
                    actions: [
                        .init(label: primaryAction, style: .primary),
                        .init(label: secondaryAction, style: .secondary)
                    ])
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
    
    func testCardWithImage() {
        let bundle = Bundle(for: InfoCardTests.self)
        guard let path = bundle.path(forResource: "info-card-header", ofType: "jpg"),
              let image = UIImage(contentsOfFile: path) else {
            return XCTFail("Could not find image for test")
        }
        
        let card = UIHostingController(
            rootView:
                OTFInfoCard(
                    image: Image(uiImage: image),
                    title: Text(title).font(.title).fontWeight(.black),
                    description: Text(subtitle).fontWeight(.semibold),
                    actions: [
                        .init(label: primaryAction, style: .primary),
                        .init(label: secondaryAction, style: .secondary)
                    ])
        )
        let lightMode = UITraitCollection(userInterfaceStyle: .light)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: lightMode))
        let darkMode = UITraitCollection(userInterfaceStyle: .dark)
        assertSnapshot(matching: card, as: .image(on: .iPhone13Pro, traits: darkMode))
    }
}
