//
//  OTFEmptyState.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 06/10/24.
//

import SwiftUI

/// A customizable SwiftUI view for displaying empty state information.
///
/// The `OTFEmptyState` is designed to present a visually appealing and informative view when there's no content to display.
/// It can include an icon, title, message, and an optional action button.
///
/// ## Features
/// - Customizable icon using SF Symbols
/// - Title and optional message text
/// - Optional action button
/// - Adapts to the app's design system colors
///
/// ## Usage
/// ```swift
/// OTFEmptyState("No Messages",
///               systemImageName: "envelope",
///               message: "Your inbox is empty",
///               action: .init(label: "Compose", action: {
///                   // Handle compose action
///               }))
/// ```
///
/// The empty state view provides a clear and engaging way to inform users about the lack of content
/// while offering an action to remedy the situation if applicable.
public struct OTFEmptyState: View {
    /// The main title of the empty state view.
    var title: LocalizedStringKey
    
    /// The name of the SF Symbol to use as the icon (optional).
    var systemImageName: String?
    
    /// An optional message providing more context about the empty state.
    var message: LocalizedStringKey?
    
    /// An optional action that can be triggered from the empty state view.
    var action: OTFEmptyStateAction?
    
    /// The design styler used for customizing colors.
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    /// Creates an `OTFEmptyState` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The main title of the empty state view.
    ///   - systemImageName: The name of the SF Symbol to use as the icon (optional).
    ///   - message: An optional message providing more context about the empty state.
    ///   - action: An optional action that can be triggered from the empty state view.
    public init(_ title: LocalizedStringKey,
                systemName: String? = nil,
                message: LocalizedStringKey? = nil,
                action: OTFEmptyStateAction? = nil) {
        self.title = title
        self.systemImageName = systemName
        self.message = message
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            if let systemImageName {
                Image(systemName: systemImageName)
                    .font(.largeTitle)
                    .foregroundColor(style?.color.secondaryLabel)
            }
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            if let message {
                Text(message)
                    .foregroundColor(style?.color.secondaryLabel)
                
            }
            if let action = action {
                Button(action.label) {
                    action.action()
                }
                .buttonStyle(.otfPill)
                .padding(.vertical, 6)
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(style?.color.customGroupedBackground)
    }
}

#Preview {
    OTFEmptyState("No Stimuli Added",
                  systemName: "sparkles",
                  message: "Add your first stimulus to get started",
                  action: .init(label: "Add Stimulus", action: {
        print("Pressed Add Stimulus")
    }))
    .otfStyle(OTFTestStyle())
    .ignoresSafeArea()
}
