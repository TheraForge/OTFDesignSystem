//
//  OTFMargin.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 12/12/23.
//  Copyright (c) 2024  Hippocrates Technologies Sagl. All rights reserved.
//

import SwiftUI

/// A secondary button style with a subtle appearance for less prominent actions.
///
/// The secondary button features a solid background with a rounded rectangle shape.
/// The label is centered and has a uniform foreground color, with a decrease in opacity
/// for both the background and overlay when pressed.
public struct OTFSecondaryButtonStyle: OTFButtonStyle {
    @Environment(\.isEnabled) internal var isEnabled: Bool
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    var disabledLabelColor: Color { .gray }
    
    public func makeBody(configuration: Configuration) -> some View {
        label(configuration.label, isEnabled: isEnabled)
            .padding()
            .background(
                background(isEnabled)
                    .opacity(backgroundOpacity)
            )
            .overlay(overlay(isEnabled))
            .opacity(opacity(configuration.isPressed))
        
    }
    
    var backgroundOpacity: CGFloat {
        if isEnabled {
            return 0.2
        } else {
            return 0.15
        }
    }
    
    @ViewBuilder
    func background(_ isEnabled: Bool) -> some View {
        if isEnabled {
            if let color = style?.color.secondaryButton {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.accentColor)
            }
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(style?.color.disabledButton ?? Color(UIColor.tertiarySystemFill))
        }
    }
    
    @ViewBuilder
    func label(_ configuration: ButtonStyleConfiguration.Label ,isEnabled: Bool) -> some View {
        if isEnabled {
            if let color = style?.color.secondaryButton {
                configuration
                    .frame(maxWidth: .infinity)
                    .foregroundColor(color)
            } else {
                configuration
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.accentColor)
            }
        } else {
            configuration
                .frame(maxWidth: .infinity)
                .foregroundColor(disabledLabelColor)
        }
    }
    
    @ViewBuilder
    func overlay(_ isEnabled: Bool) -> some View {
        if isEnabled {
            if let color = style?.color.secondaryButton {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.accentColor)
            }
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.gray)
        }
    }
}

public extension ButtonStyle where Self == OTFSecondaryButtonStyle {
    /// A secondary button style with a subtle appearance for less prominent actions.
    ///
    /// The secondary button features a solid background with a rounded rectangle shape.
    /// The label is centered and has a uniform foreground color, with a decrease in opacity
    /// for both the background and overlay when pressed.
    static var otfSecondary: OTFSecondaryButtonStyle {
        return .init()
    }
}

#Preview {
    VStack {
        Button("Hello") { }
            .buttonStyle(.otfSecondary)
        
        Button("Hello") { }
            .buttonStyle(.otfSecondary)
            .disabled(true)
    }
}
