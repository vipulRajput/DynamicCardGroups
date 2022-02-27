//
//  CardGroup.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import Foundation

// MARK: - Welcome
struct CardGroupData: Codable {
    let cardGroups: [CardGroup]

    enum CodingKeys: String, CodingKey {
        case cardGroups = "card_groups"
    }
}

// MARK: - CardGroup
struct CardGroup: Codable, Identifiable {
    let id: Int
    let name: String
    let designType: DesignType
    let cards: [Card]
    let isScrollable: Bool
    let height: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case designType = "design_type"
        case cards
        case isScrollable = "is_scrollable"
        case height
    }
}

// MARK: - Card
struct Card: Codable, Identifiable {
    
    let id = UUID()
    let name: String
    let title: String?
    let formattedTitle: FormattedTitle?
    let cardDescription: String?
    let formattedDescription: FormattedDescription?
    let icon: BgImage?
    let url: String
    let bgImage: BgImage?
    let bgColor: String?
    let cta: [Cta]?

    enum CodingKeys: String, CodingKey {
        case id
        case name, title
        case formattedTitle = "formatted_title"
        case cardDescription = "description"
        case formattedDescription = "formatted_description"
        case icon, url
        case bgImage = "bg_image"
        case bgColor = "bg_color"
        case cta
    }
}

// MARK: - BgImage
struct BgImage: Codable {
    let imageURL: String
    let aspectRatio: Double?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case aspectRatio = "aspect_ratio"
    }
}

// MARK: - Cta
struct Cta: Codable {
    let text, bgColor, textColor: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case text
        case bgColor = "bg_color"
        case textColor = "text_color"
        case url
    }
}

// MARK: - FormattedDescription
struct FormattedDescription: Codable {
    let text: String
    let entities: [Entity]
}

// MARK: - Entity
struct Entity: Codable {
    let text, color: String
}

// MARK: - FormattedTitle
struct FormattedTitle: Codable {
    let text: String
    let entities: [Entity]
    let align: String?
}

enum DesignType: String, Codable {
    case HC1, HC2, HC3, HC4, HC5, HC6, HC7, HC8, HC9
}
