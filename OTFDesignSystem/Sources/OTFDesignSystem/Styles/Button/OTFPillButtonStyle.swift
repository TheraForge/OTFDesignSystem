//
//  OTFPillButtonStyle.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 06/10/24.
//

import SwiftUI

/// A custom button style that creates a pill-shaped button.
///
/// The `OTFPillButtonStyle` is designed to provide a visually distinct button with rounded corners,
/// resembling a pill shape. This style is particularly useful for action buttons in empty states
/// or other scenarios where a compact, attention-grabbing button is desired.
///
/// ## Features
/// - Pill-shaped appearance with fully rounded corners
/// - Adapts to the app's design system colors
/// - Customizable padding and font weight
///
/// ## Usage
/// ```swift
/// Button("Take Action") {
///     // Handle button tap
/// }
/// .buttonStyle(.otfPill)
/// ```
///
/// The pill button style provides a modern and touch-friendly appearance for important actions.
public struct OTFPillButtonStyle: ButtonStyle {
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body.weight(.semibold))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(style?.color.primaryButton ?? .blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension ButtonStyle where Self == OTFPillButtonStyle {
    /// A pill-shaped button style with rounded corners and customizable colors.
    public static var otfPill: OTFPillButtonStyle {
        OTFPillButtonStyle()
    }
}

#Preview {
    Button {
        
    } label: {
        Label("Start Stimuli Sequence", systemImage: "play")
    }
    .buttonStyle(.otfPill)
    .otfStyle(OTFTestStyle())
}
