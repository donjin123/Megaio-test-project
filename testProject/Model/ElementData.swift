//
//  ElementData.swift
//  testProject
//
//  Created by Krunal Chaudhari on 08/06/24.
//

import Foundation

// MARK: - WelcomeElement
struct ElementData: Codable {
    let date, explanation: String
    let hdurl: String?
    let mediaType: MediaType
    let serviceVersion: ServiceVersion
    let title: String
    let url: String
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url, copyright
    }
}

enum MediaType: String, Codable {
    case image = "image"
    case video = "video"
}

enum ServiceVersion: String, Codable {
    case v1 = "v1"
}

typealias Elements = [ElementData]
