//
//  OTFTestStyle.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 26/09/24.
//


import SwiftUI

struct OTFTestStyle: OTFDesignStyler {
    struct TestColor: OTFDesignStylerColor {
        var primaryButton: Color = .blue
    }
    
    var color: OTFDesignStylerColor = TestColor()
}
