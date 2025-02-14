//
//  OTFMargin.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 12/12/23.
//  Copyright (c) 2024  Hippocrates Technologies Sagl. All rights reserved.
//

import SwiftUI

/// A tertiary button style with a minimal appearance for actions with low emphasis.
///
/// The tertiary button features a label with a uniform foreground color, centered within
/// the button area. The button has no distinct background and a slight decrease in opacity
/// when pressed.
public struct OTFTertiaryButtonStyle: OTFButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    var disabledLabelColor: Color { .gray }
    
    public func makeBody(configuration: Configuration) -> some View {
        label(configuration.label, isEnabled: isEnabled)
            .foregroundColor(style?.color.tertiaryButton)
            .padding()
            .cornerRadius(cornerRadius)
            .overlay(overlay(false))
            .opacity(opacity(configuration.isPressed))
            .background(background(isEnabled))
        
    }
    
    @ViewBuilder
    func background(_ isEnabled: Bool) -> some View {
        Color.clear
    }
}

public extension ButtonStyle where Self == OTFTertiaryButtonStyle {
    /// A tertiary button style with a minimal appearance for actions with low emphasis.
    ///
    /// The tertiary button features a label with a uniform foreground color, centered within
    /// the button area. The button has no distinct background and a slight decrease in opacity
    /// when pressed.
    static var otfTertiary: OTFTertiaryButtonStyle {
        return .init()
    }
}

#Preview {
    VStack {
        Button("Hello") { }
            .buttonStyle(.otfTertiary)
            .foregroundColor(.red)
        
        Button("Hello") { }
            .buttonStyle(.otfTertiary)
            .foregroundColor(.blue)
            .disabled(true)
    }
}
