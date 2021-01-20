//
//  PhotoModel.swift
//  FlickerAPI
//
//  Created by Роенко Денис on 20.01.2021.
//

import Foundation

struct PhotoModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let url: String
    let description: String
}
