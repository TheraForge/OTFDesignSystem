//
//  OTFMargin.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 12/12/23.
//  Copyright (c) 2024  Hippocrates Technologies Sagl. All rights reserved.
//

import SwiftUI

/// A primary button style with a distinctive appearance for important actions.
/// 
/// The primary button features a solid background with a rounded rectangle shape,
/// filled with the foreground color. The label is centered and has a uniform foreground color,
/// with a subtle decrease in opacity when pressed.
public struct OTFPrimaryButtonStyle: OTFButtonStyle {
    @Environment(\.isEnabled) internal var isEnabled: Bool
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    var disabledLabelColor: Color { Color(UIColor.systemBackground) }
    
    public func makeBody(configuration: Configuration) -> some View {
        label(configuration.label, isEnabled: isEnabled)
            .foregroundColor(Color(UIColor.systemBackground))
            .padding()
            .background(background(isEnabled))
            .opacity(opacity(configuration.isPressed))
    }
    
    @ViewBuilder
    func background(_ isEnabled: Bool) -> some View {
        if isEnabled {
            if let color = style?.color.primaryButton {
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
}

public extension ButtonStyle where Self == OTFPrimaryButtonStyle {
    /// A primary button style with a distinctive appearance for important actions.
    ///
    /// The primary button features a solid background with a rounded rectangle shape,
    /// filled with the foreground color. The label is centered and has a uniform foreground color,
    /// with a subtle decrease in opacity when pressed.
    static var otfPrimary: OTFPrimaryButtonStyle {
        return .init()
    }
}

#Preview {
    VStack {
        Button("Hello") { }
            .buttonStyle(.otfPrimary)
        
        Button("Hello") { }
            .buttonStyle(.otfPrimary)
            .disabled(true)
    }
}
