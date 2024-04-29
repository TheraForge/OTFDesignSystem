//
//  OTFDesignStylerColor.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 22/01/24.
//

import Foundation
import SwiftUI

public protocol OTFDesignStylerColor {
    var label: Color { get }
    var secondaryLabel: Color { get }
    var tertiaryLabel: Color { get }
    var separator: Color { get }

    var customFill: Color { get }
    var secondaryCustomFill: Color { get }
    var tertiaryCustomFill: Color { get }
    var quaternaryCustomFill: Color { get }

    var customBlue: Color { get }

    var customGray: Color { get }
    var customGray2: Color { get }
    var customGray3: Color { get }
    var customGray4: Color { get }
    var customGray5: Color { get }
    
    var primaryButton: Color { get }
    var secondaryButton: Color { get }
    var tertiaryButton: Color { get }
    var disabledButton: Color { get }
    
    var customBackground: Color { get }
    var secondaryCustomBackground: Color { get }

    var customGroupedBackground: Color { get }
    var secondaryCustomGroupedBackground: Color { get }
    var tertiaryCustomGroupedBackground: Color { get }
}

public extension OTFDesignStylerColor {
    var label: Color { Color(UIColor.label) }
    var secondaryLabel: Color { Color(UIColor.secondaryLabel) }
    var tertiaryLabel: Color { Color(UIColor.tertiaryLabel) }
    
    var separator: Color { Color(UIColor.separator) }
    
    var customFill: Color { Color(UIColor.tertiarySystemFill) }
    var secondaryCustomFill: Color { Color(UIColor.secondarySystemFill) }
    var tertiaryCustomFill: Color { Color(UIColor.tertiarySystemFill) }
    var quaternaryCustomFill: Color { Color(UIColor.quaternarySystemFill) }
    
    var customBlue: Color { Color(UIColor.systemBlue) }
    
    var customGray: Color { Color(UIColor.systemGray) }
    var customGray2: Color { Color(UIColor.systemGray2) }
    var customGray3: Color { Color(UIColor.systemGray3) }
    var customGray4: Color { Color(UIColor.systemGray4) }
    var customGray5: Color { Color(UIColor.systemGray5) }
    
    var secondaryButton: Color { primaryButton }
    var tertiaryButton: Color { primaryButton }
    var disabledButton: Color { self.tertiaryCustomFill }
    
    var customBackground: Color { Color(UIColor.systemBackground) }
    var secondaryCustomBackground: Color { Color(UIColor.secondarySystemBackground) }
    
    var customGroupedBackground: Color { Color(UIColor.systemGroupedBackground) }
    var secondaryCustomGroupedBackground: Color { Color(UIColor.secondarySystemGroupedBackground) }
    var tertiaryCustomGroupedBackground: Color { Color(UIColor.tertiarySystemGroupedBackground) }
}
