//
//  OTFMargin.swift
//  OTFDesignSystem
//
//  Created by Tomas Martins on 12/12/23.
//  Copyright © 2023  Hippocrates Technologies S.r.l.. All rights reserved.
//

import SwiftUI

/// Represents an information card view with an image, title, description, and associated actions.
///
/// The ``OTFInfoCard`` is a versatile SwiftUI view designed for presenting customizable information cards with an optional image, title, description, and actions. It is suitable for displaying various types of content in a visually appealing and interactive format.
///
/// ### Title and Description
/// The ``OTFInfoCard`` allows flexibility in setting the title and description by providing two initializers:
/// - **For String Titles and Descriptions:**
///   ```swift
///   public init(image: Image? = nil,
///               title: LocalizedStringKey,
///               description: LocalizedStringKey? = nil,
///               actions: [OTFInfoCardAction] = [])
///   ```
///   This initializer accepts string literals for both the title and description. For example:
///   ```swift
///   OTFInfoCard(title: "Card Title",
///               description: "A brief description of the card.")
///   ```
///
/// - **For Text Titles and Descriptions:**
///   ```swift
///   public init(image: Image? = nil,
///               title: Text,
///               description: Text? = nil,
///               actions: [OTFInfoCardAction] = [])
///   ```
///   This initializer accepts `Text` views for the title and description, providing greater flexibility for custom styling and localization. For example:
///   ```swift
///   OTFInfoCard(title: Text("Card Title"),
///               description: Text("A brief description of the card."))
///   ```
///
/// ### Actions
/// The ``OTFInfoCard`` supports an array of actions, defined by the ``OTFInfoCardAction`` structure. Actions represent interactive elements, such as buttons, that users can tap to perform specific actions. Each action includes a label, style (primary, secondary, or tertiary), and an optional closure to execute when the action is triggered.
///
/// To set up actions, you can use the ``OTFInfoCardAction`` initializer:
/// ```swift
/// public init(label: String, style: OTFInfoCardAction.Style, action: (() -> ())? = nil)
/// ```
/// For example:
/// ```swift
/// let primaryAction = OTFInfoCardAction(label: "Primary Action",
///                                       style: .primary,
///                                       action: {
///                                           // Perform primary action
///                                       })
///
/// let secondaryAction = OTFInfoCardAction(label: "Secondary Action",
///                                         style: .secondary,
///                                         action: {
///                                             // Perform secondary action
///                                         })
///
/// OTFInfoCard(title: "Card Title",
///             description: "A brief description of the card.",
///             actions: [primaryAction, secondaryAction])
/// ```
///
/// ### Note
/// - Customize the appearance of the card by adjusting properties such as `image`, `title`, and `description`.
/// - Ensure proper styling and layout of the card by providing suitable content for the `title` and `description`.
///
/// For more details on available customization options and best practices, refer to the individual property and method documentation within the ``OTFInfoCard`` structure.
@available(iOS 14.0, *)
public struct OTFInfoCard: View {
    /// The optional image to display in the information card.
    var image: Image?
    /// The title of the information card.
    var title: Text
    /// The optional description of the information card.
    var description: Text?
    /// The array of actions associated with the information card.
    var actions: [OTFInfoCardAction]
    
    @Environment(\.otfdsStyle) internal var style: OTFDesignStyler?
    
    let imageHeight: CGFloat = 150
    
    /// Creates an `OTFInfoCard` with the specified parameters.
        ///
        /// - Parameters:
        ///   - image: The optional image to display in the information card.
        ///   - title: The title of the information card.
        ///   - description: The optional description of the information card.
        ///   - ctaLabel: The optional label for a call-to-action button.
        ///   - actions: The array of actions associated with the information card.
    public init(image: Image? = nil,
                title: LocalizedStringKey,
                description: LocalizedStringKey? = nil,
                actions: [OTFInfoCardAction] = []) {
        self.image = image
        self.title = Text(title)
            .font(.title)
            .fontWeight(.bold)
        
        if let description {
            self.description = Text(description)
                .font(.body)
        }
        
        self.actions = actions
    }
    
    /// Creates an `OTFInfoCard` with the specified parameters.
    ///
    /// - Parameters:
    ///   - image: The optional image to display in the information card.
    ///   - title: The title of the information card.
    ///   - description: The optional description of the information card.
    ///   - actions: The array of actions associated with the information card.
    public init(image: Image? = nil,
                title: Text,
                description: Text? = nil,
                actions: [OTFInfoCardAction] = []) {
        self.image = image
        self.title = title
        self.description = description
        self.actions = actions
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            if let image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageHeight)
                    .accessibilityHidden(true)
            }
            
            VStack(alignment: .leading) {
                title
                    .foregroundColor(primaryTextColor)
                    .padding(.bottom, .otfMinSpacing)
                
                if let description = description {
                    description
                        .foregroundColor(secondaryTextColor)
                        .padding(.bottom, .otfMinSpacing)
                }
                
                ForEach(actions) { action in
                    Button {
                        action.action?()
                    } label: {
                        Text(action.label)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(for: action)
                    .padding(.bottom,
                             action == actions.last ? nil : .otfMinSpacing)
                }
            }
            .padding()
            .background(style?.color.customBackground)
        }.background(style?.color.customBackground)
    }
}

@available(iOS 14.0, *)
extension OTFInfoCard {
    var primaryTextColor: Color {
        if let label = style?.color.label {
            return label
        } else {
            return Color(UIColor.label)
        }
    }
    
    var secondaryTextColor: Color {
        if let secondaryLabel = style?.color.secondaryLabel {
            return secondaryLabel
        } else {
            return Color(UIColor.secondaryLabel)
        }
    }
}

fileprivate extension View {
    @ViewBuilder
    func buttonStyle(for action: OTFInfoCardAction) -> some View {
        switch action.style {
        case .primary:
            self.buttonStyle(.otfPrimary)
        case  .secondary:
            self.buttonStyle(.otfSecondary)
        case .tertiary:
            self.buttonStyle(.otfTertiary)
        }
    }
}

#Preview {
    OTFInfoCard(
        image: Image("your_image_name"),
        title: "Card Title",
        description: "Card Description. This is a sample description for the card.",
        actions: [
            .init(label: "Learn More", style: .primary),
            .init(label: "Maybe Later", style: .secondary)
        ]
    )
    .foregroundColor(.pink)
    .padding()
}
