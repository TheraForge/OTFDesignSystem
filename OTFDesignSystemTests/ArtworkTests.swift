//
//  ArtworkTests.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 06/05/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import OTFDesignSystem

final class ArtworkTests: XCTestCase {
    func testWithImage() {
        let bundle = Bundle(for: InfoCardTests.self)
        guard let path = bundle.path(forResource: "info-card-header", ofType: "jpg"),
              let image = UIImage(contentsOfFile: path) else {
            return XCTFail("Could not find image for test")
        }
        
        let artwork = OTFMusicArtwork(image: Image(uiImage: image)).padding()
        SnapshotHelper.test(
            swiftUIView: artwork,
            layout: .fixed(
                width: 200,
                height: 200
            ),
            interfaceStyle: .light
        )
    }
    
    func testWithPlaceholder() {
        let artwork = OTFMusicArtwork()
            .foregroundColor(.orange)
            .padding()
        SnapshotHelper.test(
            swiftUIView: artwork,
            layout: .fixed(
                width: 200,
                height: 200
            ),
            interfaceStyle: .light
        )
    }
}
