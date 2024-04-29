//
//  OTFSurveyCard.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 15/04/24.
//

import SwiftUI

/// Represents a survey card view with a title, call to action, and optional action button.
///
/// The ``OTFSurveyCard`` is a SwiftUI component designed for presenting survey-related information with an optional action button. It provides a structured layout for displaying survey titles, status indicators, and call-to-action buttons, enhancing user engagement and interaction.
///
/// ### Title and Call to Action
/// The ``OTFSurveyCard`` allows customization of the title and call to action text. It provides two initializers for setting up the card:
/// - **For Localized Strings:**
///   ```swift
///   public init(title: LocalizedStringKey, callToAction: LocalizedStringKey, hasBeenAnswered: Bool, action: (() -> Void)? = nil)
///   ```
///   This initializer accepts localized string keys for the title and call to action text. For example:
///   ```swift
///   OTFSurveyCard(title: "Survey Title", callToAction: "Take Survey", hasBeenAnswered: false)
///   ```
///
/// - **For Text Views:**
///   ```swift
///   public init(title: Text, callToAction: LocalizedStringKey, hasBeenAnswered: Bool, action: (() -> Void)? = nil)
///   ```
///   This initializer accepts a `Text` view for the title, providing flexibility for custom styling and localization. For example:
///   ```swift
///   OTFSurveyCard(title: Text("Survey Title"), callToAction: "Take Survey", hasBeenAnswered: false)
///   ```
public struct OTFSurveyCard: View {
    /// The title of the survey card.
    var title: Text
    /// The call to action text displayed on the action button.
    var callToAction: LocalizedStringKey
    /// A Boolean value indicating whether the survey has been answered.
    var hasBeenAnswered: Bool
    /// The action closure associated with the action button.
    var action: (() -> ())?
    
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    /// Creates an `OTFSurveyCard` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The title of the survey card.
    ///   - callToAction: The call to action text displayed on the action button.
    ///   - hasBeenAnswered: A Boolean value indicating whether the survey has been answered.
    ///   - action: The action closure associated with the action button.
    public init(title: LocalizedStringKey, callToAction: LocalizedStringKey, hasBeenAnswered: Bool, action: (() -> Void)? = nil) {
        self.title = Text(title)
        self.callToAction = callToAction
        self.hasBeenAnswered = hasBeenAnswered
        self.action = action
    }
    
    /// Creates an `OTFSurveyCard` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The title of the survey card.
    ///   - callToAction: The call to action text displayed on the action button.
    ///   - hasBeenAnswered: A Boolean value indicating whether the survey has been answered.
    ///   - action: The action closure associated with the action button.
    public init(title: Text, callToAction: LocalizedStringKey, hasBeenAnswered: Bool, action: (() -> Void)? = nil) {
        self.title = title
        self.callToAction = callToAction
        self.hasBeenAnswered = hasBeenAnswered
        self.action = action
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            title
                .fontWeight(.medium)
                .foregroundColor(style?.color.label)
            
            Divider()
                .overlay(style?.color.separator)
                .padding(.vertical)
            
            if hasBeenAnswered {
                Label("Complete", systemImage: "checkmark.circle")
                    .font(.body.weight(.medium))
                    .foregroundColor(style?.color.primaryButton)
                    .frame(maxWidth: .infinity)
            } else {
                Button {
                    action?()
                } label: {
                    Text(callToAction)
                        .fontWeight(.medium)
                }
                .buttonStyle(.otfPrimary)
            }
        }
        .padding()
        .background(cardBackground)
        .cornerRadius(12)
    }
    
    private var cardBackground: Color {
        if let background = style?.color.customBackground {
            return background
        } else {
            return Color(UIColor.systemBackground)
        }
    }
}

#Preview {
    ZStack {
        Color(UIColor.secondarySystemBackground)
            .ignoresSafeArea(edges: .all)
        
        OTFSurveyCard(
            title: "Are you feeling better after today's medications?",
            callToAction: "Report",
            hasBeenAnswered: false
        ).padding()
    }
}
