//
//  OTFMargin.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 12/12/23.
//  Copyright © 2023  Hippocrates Technologies S.r.l.. All rights reserved.
//

import SwiftUI

protocol OTFButtonStyle: ButtonStyle {
    var isEnabled: Bool { get }
    var style: OTFDesignStyler? { get }
    var disabledLabelColor: Color { get }
    
    associatedtype Background: View
    func background(_ isEnabled: Bool) -> Background
}

extension OTFButtonStyle {
    var cornerRadius: CGFloat { 12.0 }
    
    func opacity(_ isPressed: Bool) -> CGFloat {
        if isPressed {
            return 0.7
        } else {
            return 1.0
        }
    }
}

extension OTFButtonStyle {
    @ViewBuilder
    func label(_ configuration: ButtonStyleConfiguration.Label ,isEnabled: Bool) -> some View {
        if isEnabled {
            configuration
                .frame(maxWidth: .infinity)
        } else {
            configuration
                .frame(maxWidth: .infinity)
                .foregroundColor(disabledLabelColor)
        }
    }
    
    @ViewBuilder
    func overlay(_ isEnabled: Bool) -> some View {
        if isEnabled {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.foreground)
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.gray)
        }
    }
}

#Preview {
    VStack {
        Button("Start") {}
            .buttonStyle(.otfPrimary)
            .foregroundColor(.blue)
        Button("Start") {}
            .buttonStyle(.otfSecondary)
        Button("Start") {}
            .buttonStyle(.otfTertiary)
    }
    .foregroundColor(.red)
    .padding()
    .disabled(false)
}
