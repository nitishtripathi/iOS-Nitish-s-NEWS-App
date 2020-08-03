//
//  ModelType.swift
//  pleaserun
//
//  Created by Nitish Tripathi on 03/08/20.
//  Copyright © 2020 Nitish Tripathi. All rights reserved.
//

import Foundation

//RootClass
struct RootClass: Codable {
    let copyright : String?
    let lastUpdated : String?
    let numResults : Int?
    let results : [Results]
    let section : String?
    let status : String?

    enum CodingKeys: String, CodingKey {
            case copyright = "copyright"
            case lastUpdated = "last_updated"
            case numResults = "num_results"
            case results = "results"
            case section = "section"
            case status = "status"
    }
}
//ResultClass
struct Results: Codable {
    let abstractField : String?
    let byline : String?
    let createdDate : String?
    let itemType : String?
    let kicker : String?
    let materialTypeFacet : String?
    let multimedia : [MultiMedia]
    let publishedDate : String?
    let section : String?
    let shortUrl : String?
    let subsection : String?
    let title : String?
    let updatedDate : String?
    let uri : String?
    let url : String

    enum CodingKeys: String, CodingKey {
            case abstractField = "abstract"
            case byline = "byline"
            case createdDate = "created_date"
            case itemType = "item_type"
            case kicker = "kicker"
            case materialTypeFacet = "material_type_facet"
            case multimedia = "multimedia"
            case publishedDate = "published_date"
            case section = "section"
            case shortUrl = "short_url"
            case subsection = "subsection"
            case title = "title"
            case updatedDate = "updated_date"
            case uri = "uri"
            case url = "url"
    }
}

//MultiMedia
struct MultiMedia: Codable {
    let caption : String?
    let copyright : String?
    let format : String?
    let height : Int?
    let subtype : String?
    let type : String?
    let url : String?
    let width : Int?

    enum CodingKeys: String, CodingKey {
            case caption = "caption"
            case copyright = "copyright"
            case format = "format"
            case height = "height"
            case subtype = "subtype"
            case type = "type"
            case url = "url"
            case width = "width"
    }
}
