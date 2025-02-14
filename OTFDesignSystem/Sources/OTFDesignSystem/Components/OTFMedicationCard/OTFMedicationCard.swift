//
//  OTFMedicationCard.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 27/09/24.
//

import SwiftUI

/// A customizable SwiftUI view for displaying medication information in a card format.
///
/// The `OTFMedicationCard` is designed to present medication details including name, dosage, and schedule.
/// It also provides an interactive toggle for marking the medication as taken or not taken.
///
/// ## Features
/// - Displays medication name, dosage, and schedule
/// - Interactive toggle for marking medication status
/// - Customizable styling using the app's design system
/// - Animated checkmark for visual feedback
///
/// ## Usage
/// ```swift
/// OTFMedicationCard(
///     title: "Levodopa",
///     dosage: "100mg",
///     schedule: "Every 6 hours",
///     isCompleted: false
/// ) { newStatus in
///     // Handle status change
/// }
/// ```
///
/// The card provides a clear overview of medication details and allows users to easily track their medication intake.
public struct OTFMedicationCard: View {
    /// The name of the medication.
    var title: LocalizedStringKey
    
    /// The dosage of the medication.
    var dosage: String
    
    /// The schedule or frequency of the medication.
    var schedule: String
    
    /// Indicates whether the medication has been taken.
    @State var isCompleted: Bool
    
    /// A closure that is called when the medication status is toggled.
    var onToggle: ((Bool) -> ())?
    
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    /// Creates an `OTFMedicationCard` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The name of the medication.
    ///   - dosage: The dosage of the medication.
    ///   - schedule: The schedule or frequency of the medication.
    ///   - isCompleted: Indicates whether the medication has been taken.
    ///   - onToggle: A closure that is called when the medication status is toggled.
    public init(title: LocalizedStringKey, dosage: String, schedule: String, isCompleted: Bool, _ onToggle: ((Bool) -> Void)? = nil) {
        self.title = title
        self.dosage = dosage
        self.schedule = schedule
        self.isCompleted = isCompleted
        self.onToggle = onToggle
    }
    
    public var body: some View {
        Button {
            withAnimation {
                isCompleted.toggle()
                onToggle?(isCompleted)
            }
        } label: {
            HStack {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "pills.circle.fill")
                        .font(.title)
                        .foregroundColor(style?.color.primaryButton)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(style?.color.label)
                        Text("\(dosage) • \(schedule)")
                            .font(.subheadline)
                            .foregroundColor(style?.color.secondaryLabel)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                checkmark
            }
        }
    }
    
    @ViewBuilder
    var checkmark: some View {
        let icon = Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
            .foregroundColor(isCompleted ? style?.color.primaryButton : style?.color.separator)
            
        if #available(iOS 17.0, *) {
            icon
                .contentTransition(.symbolEffect(.replace))
        } else {
            icon
        }
    }
}

#Preview {
    List {
        OTFMedicationCard(title: "Levodopa",
                          dosage: "100mg",
                          schedule: "8:00 AM",
                          isCompleted: false) {
            print($0)
        }
        OTFMedicationCard(title: "Dopamine agonists",
                          dosage: "1 round",
                          schedule: "10:00 AM",
                          isCompleted: true) {
            print($0)
        }
    }.otfStyle(OTFTestStyle())
}
