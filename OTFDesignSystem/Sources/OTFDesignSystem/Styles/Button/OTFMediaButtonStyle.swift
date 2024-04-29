//
//  OTFMediaButtonStyle.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 18/04/24.
//

import SwiftUI

public struct OTFMediaButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) internal var isEnabled: Bool
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    var disabledLabelColor: Color { .gray }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white.opacity(isEnabled ? 1.0 : 0.5))
            .padding()
            .background(background(isEnabled))
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .shadow(radius: configuration.isPressed ? 0 : 10)
    }
    
    @ViewBuilder
    func background(_ isEnabled: Bool) -> some View {
        if isEnabled {
            Circle()
                .fill(.pink)
        } else {
            Circle()
                .fill(style?.color.disabledButton ?? disabledLabelColor)
        }
    }
}

public extension ButtonStyle where Self == OTFMediaButtonStyle {
    static var otfMedia: OTFMediaButtonStyle {
        return .init()
    }
}

#Preview {
    VStack(spacing: 28) {
        HStack {
            Button { } label: {
                Image(systemName: "backward.fill")
            }
            
            Button { } label: {
                Image(systemName: "play.fill")
            }
            
            Button { } label: {
                Image(systemName: "forward.fill")
            }
        }.buttonStyle(.otfMedia)
        
        HStack {
            Button { } label: {
                Image(systemName: "backward.fill")
            }
            
            Button { } label: {
                Image(systemName: "play.fill")
            }
            
            Button { } label: {
                Image(systemName: "forward.fill")
            }
        }.disabled(true)
    }.buttonStyle(.otfMedia)
}
