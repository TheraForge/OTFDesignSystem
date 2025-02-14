//
//  SnapshotHelper.swift
//  OTFDesignSystemTests
//
//  Created by Tomas Martins on 29/07/24.
//

import SwiftUI
import SnapshotTesting

/**
 A helper class for snapshot testing views. This class provides two methods to test views, one for SwiftUI views and another for UIViewControllers. The methods take several parameters to configure the testing, including the layout configuration, interface style and precision.
 
 > Warning: Users should not change the default values of the file, testName, and line parameters of each method, as these are used to store the reference snapshot in the test's directory. Changing these could result in your test to behave incorrectly.

Example usage:
```swift
func testMyView() {
    SnapshotHelper.test(swiftUIView: MySwiftUIView())
}
 ```
*/

class SnapshotHelper {
    
    /**
    An enumeration of interface styles for snapshot testing. This can be set to ``InterfaceStyle.light``, ``InterfaceStyle.dark``, or ``InterfaceStyle.lightAndDark``.
    */
    enum InterfaceStyle {
        case light
        case dark
        case lightAndDark
    }
    
    /**
     Test a SwiftUI view for snapshot testing.
     
     - Parameters:
        - swiftUIView: A closure returning the SwiftUI view to be tested.
        - layout: The layout configuration to use for testing. Default is `.device(config: .iPhone13Pro)`.
        - interfaceStyle: The interface style to use for testing. Default is `.lightAndDark`.
        - precision: The precision of the testing. Default is `0.995`.
        - file: The file information to use for testing. Default is the current file.
        - testName: The test name to use for testing. Default is the current function name.
        - line: The line information to use for testing. Default is the current line number.
     */
    static func test<Value: SwiftUI.View>(
        swiftUIView: @autoclosure () throws -> Value,
        layout: SwiftUISnapshotLayout = .device(config: .iPhone13Pro),
        interfaceStyle: InterfaceStyle = .lightAndDark,
        precision: Float = 0.995,
        perceptualPrecision: Float = 0.98,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let lightImage: Snapshotting<Value, UIImage> = .image(precision: precision,
                                                              perceptualPrecision: perceptualPrecision,
                                                              layout: layout,
                                                              traits: .init(userInterfaceStyle: .light))
        let darkImage: Snapshotting<Value, UIImage> = .image(precision: precision,
                                                             layout: layout,
                                                             traits: .init(userInterfaceStyle: .dark))
        
        switch interfaceStyle {
        case .light:
            assertSnapshot(of: try swiftUIView(), as: lightImage,
                           file: file, testName: testName, line: line)
        case .dark:
            assertSnapshot(of: try swiftUIView(), as: darkImage,
                           file: file, testName: testName, line: line)
        case .lightAndDark:
            assertSnapshot(of: try swiftUIView(), as: lightImage,
                           file: file, testName: testName, line: line)
            assertSnapshot(of: try swiftUIView(), as: darkImage,
                           file: file, testName: testName, line: line)
        }
    }
    
    /**
     Test a UIKit view for snapshot testing.
     
     - Parameters:
        - viewController: A closure returning the UIViewController view to be tested.
        - layout: The device configuration to use for testing. Default is `.iPhone13Pro`.
        - interfaceStyle: The interface style to use for testing. Default is `.lightAndDark`.
        - precision: The precision of the testing. Default is `0.995`.
        - file: The file information to use for testing. Default is the current file.
        - testName: The test name to use for testing. Default is the current function name.
        - line: The line information to use for testing. Default is the current line number.
     */
    static func test(
        viewController: @autoclosure () throws -> UIViewController,
        device: ViewImageConfig = .iPhone13Pro,
        interfaceStyle: InterfaceStyle = .lightAndDark,
        precision: Float = 0.995,
        perceptualPrecision: Float = 0.98,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let lightImage: Snapshotting<UIViewController, UIImage> = .image(
            on: .iPhone13Pro,
            precision: precision,
            perceptualPrecision: perceptualPrecision,
            traits: .init(
                userInterfaceStyle: .light
            )
        )
        let darkImage: Snapshotting<UIViewController, UIImage> = .image(
            on: .iPhone13Pro,
            precision: precision,
            perceptualPrecision: perceptualPrecision,
            traits: .init(
                userInterfaceStyle: .dark
            )
        )
        
        switch interfaceStyle {
        case .light:
            assertSnapshot(of: try viewController(), as: lightImage,
                           file: file, testName: testName, line: line)
        case .dark:
            assertSnapshot(of: try viewController(), as: darkImage,
                           file: file, testName: testName, line: line)
        case .lightAndDark:
            assertSnapshot(of: try viewController(), as: lightImage,
                           file: file, testName: testName, line: line)
            assertSnapshot(of: try viewController(), as: darkImage,
                           file: file, testName: testName, line: line)
        }
    }
}
