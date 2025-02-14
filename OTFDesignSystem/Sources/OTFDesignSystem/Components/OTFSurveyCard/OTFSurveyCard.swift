//
//  OTFSurveyCard.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 15/04/24.
//

import SwiftUI


/// A customizable SwiftUI view for presenting survey-related information in a card format.
///
/// The `OTFSurveyCard` is designed to display survey or questionnaire items in a visually appealing manner.
///
/// ## Features
/// - Customizable icon using SF Symbols
/// - Title and description text
/// - Action button or completion status indicator
///
/// ## Usage
/// ```swift
/// OTFSurveyCard(
///     title: "Mood Check",
///     description: "How are you feeling today?",
///     systemImage: "face.smiling.inverse",
///     callToAction: "Get Started",
///     hasBeenAnswered: false
/// ) {
///     // Action to perform when tapped
/// }
/// ```
///
/// The card adapts its appearance based on the `hasBeenAnswered` state, showing either an action button or a completion indicator.
public struct OTFSurveyCard: View {
    /// The main headline of the card.
    var title: LocalizedStringKey
    
    /// A brief explanation of the survey or task.
    var description: LocalizedStringKey
    
    /// The name of the SF Symbol to use as the card's icon.
    var icon: String
    
    /// Text for the action button.
    var callToAction: LocalizedStringKey
    
    /// Indicates whether the survey has been completed.
    var hasBeenAnswered: Bool
    
    /// The action to perform when the button is tapped.
    var action: (() -> ())?
    
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    /// Creates an `OTFSurveyCard` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The main headline of the card.
    ///   - description: A brief explanation of the survey or task.
    ///   - icon: The name of the SF Symbol to use as the card's icon.
    ///   - callToAction: Text for the action button.
    ///   - hasBeenAnswered: Indicates whether the survey has been completed.
    ///   - action: The action to perform when the button is tapped.
    public init(title: LocalizedStringKey, description: LocalizedStringKey, systemImage: String, callToAction: LocalizedStringKey, hasBeenAnswered: Bool, action: (() -> Void)? = nil) {
        self.title = title
        self.description = description
        self.icon = systemImage
        self.callToAction = callToAction
        self.hasBeenAnswered = hasBeenAnswered
        self.action = action
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(style?.color.primaryButton)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(style?.color.label)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(style?.color.secondaryLabel)
                
                if hasBeenAnswered {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .accessibilityHidden(true)
                        Text("Completed")
                    }
                    .font(.subheadline)
                    .foregroundColor(style?.color.primaryButton)
                    .padding(.top, 4)
                } else {
                    Button {
                        action?()
                    } label: {
                        Text(callToAction)
                            .font(.subheadline)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 10)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .foregroundColor(style?.color.primaryButton)
                            )
                    }
                    .padding(.top, 4)
                }
            }.padding(.bottom, 8)
        }
        .background(style?.color.secondaryCustomGroupedBackground)
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color(UIColor.systemGroupedBackground)
            .ignoresSafeArea(edges: .all)
        
        List {
            Section(header: Text("Daily Checkup")) {
                OTFSurveyCard(
                    title: "Mood Check",
                    description: "How are you feeling today?",
                    systemImage: "face.smiling.inverse",
                    callToAction: "Get Started",
                    hasBeenAnswered: false
                )
                OTFSurveyCard(
                    title: "FoG Episode Log",
                    description: "Record any Freezing of Gait episodes you experienced today",
                    systemImage: "figure.walk.circle.fill",
                    callToAction: "Report",
                    hasBeenAnswered: true
                )
            }
        }
    }.otfStyle(OTFTestStyle())
}
