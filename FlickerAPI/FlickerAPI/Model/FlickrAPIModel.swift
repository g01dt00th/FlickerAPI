//
//  FlickrAPIModel.swift
//  FlickerAPI
//
//  Created by Роенко Денис on 19.01.2021.
//

import Foundation

// MARK: - Welcome
struct FlickrAPIModel: Codable {
    let photos: Photos
    let extra: Extra
    let stat: String

    enum CodingKeys: String, CodingKey {
        case photos = "photos"
        case extra = "extra"
        case stat = "stat"
    }
}

// MARK: - Extra
struct Extra: Codable {
    let exploreDate: String
    let nextPreludeInterval: Int

    enum CodingKeys: String, CodingKey {
        case exploreDate = "explore_date"
        case nextPreludeInterval = "next_prelude_interval"
    }
}

// MARK: - Photos
struct Photos: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [Photo]

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case pages = "pages"
        case perpage = "perpage"
        case total = "total"
        case photo = "photo"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case owner = "owner"
        case secret = "secret"
        case server = "server"
        case farm = "farm"
        case title = "title"
        case ispublic = "ispublic"
        case isfriend = "isfriend"
        case isfamily = "isfamily"
    }
}
