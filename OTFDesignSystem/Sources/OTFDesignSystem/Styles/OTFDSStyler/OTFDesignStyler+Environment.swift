//
//  OTFDesignStyler+Environment.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 22/01/24.
//

import Foundation
import SwiftUI

private struct OTFDSStyleEnvironmentKey: EnvironmentKey {
    static var defaultValue: OTFDesignStyler? = nil
}

public extension EnvironmentValues {
    var otfdsStyle: OTFDesignStyler? {
        get { self[OTFDSStyleEnvironmentKey.self] }
        set { self[OTFDSStyleEnvironmentKey.self] = newValue }
    }
}

public extension View {
    func otfStyle(_ style: OTFDesignStyler) -> some View {
        return self.environment(\.otfdsStyle, style)
    }
}
