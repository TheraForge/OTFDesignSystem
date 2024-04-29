//
//  OTFDSProvider.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 08/01/24.
//  Copyright © 2024  Hippocrates Technologies S.r.l.. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
struct OTFDSProvider: LibraryContentProvider {
    @LibraryContentBuilder var views: [LibraryItem] {
        LibraryItem(
            OTFInfoCard(image: Image(systemName: "globe"),
                        title: "Hello, world!",
                        description: "This is the description of this card component",
                        actions: [
                            OTFInfoCardAction(label: "Primary Action", style: .primary, action: {
                                //
                            }),
                            OTFInfoCardAction(label: "Secondary Action", style: .secondary, action: {
                                //
                            }),
                            OTFInfoCardAction(label: "Tertiary Action", style: .tertiary, action: {
                                //
                            })
                        ]).foregroundColor(.blue),
            title: "Informational Card",
            category: .control
        )
        
        LibraryItem(
            Button("Press Me", action: {
                //
            })
            .buttonStyle(.otfPrimary)
            .foregroundColor(.blue),
            title: "Primary Button",
            category: .control
        )
        
        LibraryItem(
            Button("Press Me", action: {
                //
            })
            .buttonStyle(.otfSecondary)
            .foregroundColor(.blue),
            title: "Secondary Button",
            category: .control
        )
        
        LibraryItem(
            Button("Press Me", action: {
                //b
            })
            .buttonStyle(.otfTertiary)
            .foregroundColor(.blue),
            title: "Tertiary Button",
            category: .control
        )
    }
}
