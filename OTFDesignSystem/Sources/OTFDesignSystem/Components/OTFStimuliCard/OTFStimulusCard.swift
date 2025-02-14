//
//  OTFStimulusCard.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 26/09/24.
//

import SwiftUI

/// A customizable SwiftUI view for displaying stimulus information in a card format.
///
/// The `OTFStimulusCard` is designed to a stimulus option in a visually appealing manner.
///
/// ## Features
/// - Customizable icon using SF Symbols
/// - Title and description text
/// - Customizable tint color for the icon and title
/// - Compact and informative layout
///
/// ## Usage
/// ```swift
/// OTFStimulusCard(
///     title: "Rhythmic Cues",
///     description: "Audio beats to help regulate your walking",
///     systemImage: "waveform",
///     tintColor: .blue
/// )
/// ```
///
/// The card presents a visually distinct stimulus option, making it easy for users to identify and select
/// different types of interventions or stimuli.
public struct OTFStimulusCard: View {
    /// The main title of the stimulus card.
    var title: LocalizedStringKey
    
    /// A brief description of the stimulus or intervention.
    var description: LocalizedStringKey
    
    /// The name of the SF Symbol to use as the card's icon.
    var systemImage: String
    
    /// The color used for the icon and title text.
    var tintColor: Color
    
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    /// Creates an `OTFStimulusCard` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The main title of the stimulus card.
    ///   - description: A brief description of the stimulus or intervention.
    ///   - systemImage: The name of the SF Symbol to use as the card's icon.
    ///   - tintColor: The color used for the icon and title text.
    public init(title: LocalizedStringKey, description: LocalizedStringKey, systemImage: String, tintColor: Color) {
        self.title = title
        self.description = description
        self.systemImage = systemImage
        self.tintColor = tintColor
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: systemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .foregroundColor(tintColor)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(tintColor)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(style?.color.secondaryLabel)
            }
        }
    }
}

#Preview {
    NavigationView {
        List {
            Section(header: Text("Rhythmic Cues")) {
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Rhythmic Beat",
                        description: "Steady, adjustable beat to help regulate your steps",
                        systemImage: "metronome",
                        tintColor: .blue
                    )
                }
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Motivational Music",
                        description: "Play upbeat songs with optional dance move suggestions",
                        systemImage: "music.note",
                        tintColor: .blue
                    )
                }
            }
            
            Section(header: Text("Verbal Guidance")) {
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Voice Cues",
                        description: "Hear rhythmic vocal prompts to guide your movement",
                        systemImage: "mouth",
                        tintColor: .green
                    )
                }
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Direction Shift",
                        description: "Verbal cues to help you change your walking direction",
                        systemImage: "shoeprints.fill",
                        tintColor: .green
                    )
                }
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Custom Message",
                        description: "Play a personalized audio message for encouragement",
                        systemImage: "mic",
                        tintColor: .green
                    )
                }
            }
            
            Section(header: Text("Visual aids")) {
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Virtual Step Line",
                        description: "Visualize a line to step over using augmented reality",
                        systemImage: "trapezoid.and.line.vertical.fill",
                        tintColor: .orange
                    )
                }
                NavigationLink {
                    Text("test")
                } label: {
                    OTFStimulusCard(
                        title: "Rhythmic Pulse",
                        description: "Watch pulsing visual cues to coordinate your steps",
                        systemImage: "waveform",
                        tintColor: .orange
                    )
                }
            }
        }.otfStyle(OTFTestStyle())
    }
}
