//
//  OTFMusicArtwork.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 06/05/24.
//

import SwiftUI

/// Represents a music artwork view with an optional image and placeholder.
///
/// The ``OTFMusicArtwork`` is a SwiftUI component designed for displaying music artwork images with optional placeholders. It provides a structured layout for artwork presentation with rounded corners, aspect ratio preservation, and customizable placeholder content.
public struct OTFMusicArtwork: View {
    /// The optional image to display as artwork.
    var image: Image?
    
    public var body: some View {
        artwork
            .clipShape(RoundedRectangle(cornerRadius: .otfArtworkRadius))
            .aspectRatio(1.0, contentMode: .fit)
            .background(
                Color(UIColor.systemBackground)
                    .cornerRadius(.otfArtworkRadius)
                    .shadow(radius: 10)
            )
    }
   
    @ViewBuilder
    private var artwork: some View {
        if let image = image {
            image.resizable()
        } else {
            placeholder
        }
    }
    
    private var placeholder: some View {
        ZStack {
            Rectangle()
                .opacity(0.4)
            Image(systemName: "music.note")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.6)
        }
    }
}

#Preview {
    OTFMusicArtwork()
        .foregroundColor(.orange)
        .padding()
}
