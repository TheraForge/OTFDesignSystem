//
//  OTFDSProvider.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 08/01/24.
//  Copyright (c) 2024  Hippocrates Technologies Sagl. All rights reserved.
//

import Foundation
import SwiftUI

struct OTFDSProvider: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        // MARK: - Informational Card
        LibraryItem(
            OTFInfoCard(
                image: Image(systemName: "info.circle"),
                title: "Information Card",
                description: "This is a sample information card with customizable content and actions.",
                actions: [OTFInfoCardAction(label: "Primary Action", style: .primary, action: { print("Tapped Primary Action") }),
                          OTFInfoCardAction(label: "Secondary Action", style: .secondary, action: { print("Tapped Secondary Action") })]
            ),
            title: "Information Card",
            category: .control,
            matchingSignature: "infocard"
        )
        
        // MARK: - Survey Card
        LibraryItem(
            OTFSurveyCard(
                title: "Survey Question",
                description: "Survey Question",
                systemImage: "questionmark.circle.fill",
                callToAction: "Take Survey",
                hasBeenAnswered: false,
                action: { print("Survey action tapped") }
            ),
            title: "Survey Card",
            category: .control,
            matchingSignature: "surveycard"
        )
        
        // MARK: - Music Artwork
        LibraryItem(
            OTFMusicArtwork(image: Image(systemName: "music.note")),
            title: "Music Artwork",
            category: .control,
            matchingSignature: "musicartwork"
        )
        
        // MARK: - Button Styles
        LibraryItem(
            Button("Primary Button") { print("Primary button tapped") }
                .buttonStyle(.otfPrimary),
            title: "Primary Button",
            category: .control,
            matchingSignature: "primarybutton"
        )
        
        LibraryItem(
            Button("Secondary Button") { print("Secondary button tapped") }
                .buttonStyle(.otfSecondary),
            title: "Secondary Button",
            category: .control,
            matchingSignature: "secondarybutton"
        )
        
        LibraryItem(
            Button("Tertiary Button") { print("Tertiary button tapped") }
                .buttonStyle(.otfTertiary),
            title: "Tertiary Button",
            category: .control,
            matchingSignature: "tertiarybutton"
        )
        
        LibraryItem(
            Button(action: { print("Media button tapped") }) {
                Image(systemName: "play.fill")
            }
                .buttonStyle(.otfMedia),
            title: "Media Button",
            category: .control,
            matchingSignature: "mediabutton"
        )
        
        // MARK: - Pill Button
        LibraryItem(
            Button("Pill Button") { print("Tapped Pill Button") }
                .buttonStyle(.otfPill)
                .foregroundColor(.blue),
            title: "Pill Button",
            category: .control,
            matchingSignature: "pillbutton"
        )
        
        // MARK: - Medication Card
        LibraryItem(
            OTFMedicationCard(
                title: "Levodopa",
                dosage: "100mg",
                schedule: "Every 6 hours",
                isCompleted: false
            ) { newStatus in
                print("Medication status changed to: \(newStatus)")
            },
            title: "Medication Card",
            category: .control,
            matchingSignature: "medicationcard"
        )
        
        // MARK: - Empty State
        LibraryItem(
            OTFEmptyState(
                "No Items",
                systemName: "tray.fill",
                message: "Add your first item to get started",
                action: .init(label: "Add Item", action: {
                    print("Add Item tapped")
                })
            ),
            title: "Empty State",
            category: .control,
            matchingSignature: "emptystate"
        )
    }
}

// Mock OTFDesignStyler for preview purposes
private struct MockOTFDesignStyler: OTFDesignStyler {
    struct MockColor: OTFDesignStylerColor {
        var primaryButton: Color = .blue
        // Implement other required properties...
    }
    
    var color: OTFDesignStylerColor = MockColor()
}
