//
//  OTFInfoCardAction.swift
//  OTFDesignSystem
// 
//  Created by Tomas Martins on 18/12/23.
//  Copyright (c) 2024  Hippocrates Technologies Sagl. All rights reserved.
//

import Foundation

/// A structure representing an action for use with `OTFInfoCard`. Each action has a label, a style defining its appearance, and an optional closure to execute when triggered
public struct OTFInfoCardAction {
    /// Enum defining the style of the action.
    public enum Style {
        case primary
        case secondary
        case tertiary
    }
    
    /// The label describing the action.
    var label: String
    /// The style of the action.
    var style: Style
    /// The closure to be executed when the action is triggered.
    var action: (() -> ())?
    
    /// Creates an `OTFInfoCardAction` with a label, style, and optional action closure.
    public init(label: String, style: Style, action: ( () -> Void)? = nil) {
        self.label = label
        self.style = style
        self.action = action
    }
}

extension OTFInfoCardAction: Identifiable {
    public var id: String {
        return label
    }
}

extension OTFInfoCardAction: Equatable {
    public static func == (lhs: OTFInfoCardAction, rhs: OTFInfoCardAction) -> Bool {
        return lhs.id == rhs.id
    }
}
