//
//  OTFEmptyStateAction.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 06/10/24.
//

import Foundation
import SwiftUI

final public class OTFEmptyStateAction {
    public var label: LocalizedStringKey
    public var action: (() -> Void)
    
    public init(label: LocalizedStringKey, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
}
