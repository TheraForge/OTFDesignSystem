//
//  MedicationCardTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 27/09/24.
//

import Foundation

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class MedicationCardTests: XCTestCase {
    
    let title: LocalizedStringKey = "Levodopa"
    let dosage: String = "100mg"
    let schedule: String = "08:00 AM"
    
    func testIncompleteMedicationCard() {
        let card = UIHostingController(
            rootView:
                List {
                    OTFMedicationCard(title: title, dosage: dosage, schedule: schedule, isCompleted: false)
                }.otfStyle(OTFTestStyle())
        )
        SnapshotHelper.test(viewController: card)
    }
    
    func testCompleteMedicationCard() {
        let card = UIHostingController(
            rootView:
                List {
                    OTFMedicationCard(title: title, dosage: dosage, schedule: schedule, isCompleted: true)
                }.otfStyle(OTFTestStyle())
        )
        SnapshotHelper.test(viewController: card)
    }
}
