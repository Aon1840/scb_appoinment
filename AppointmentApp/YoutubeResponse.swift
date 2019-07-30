//
//  YoutubeResponse.swift
//  SCBAdvancediOS
//
//  Created by Attapon Peungsook on 15/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation
struct YoutubeResponse: Codable {
    let youtubes: [Youtube]
    let error: Bool
    let errorMsg: String

    enum CodingKeys: String, CodingKey {
        case youtubes, error
        case errorMsg = "error_msg"
    }
}

struct Youtube: Codable {
    let id, title, subtitle, avatarImage: String
    let youtubeImage: String

    enum CodingKeys: String, CodingKey {
        case id, title, subtitle
        case avatarImage = "avatar_image"
        case youtubeImage = "youtube_image"
    }
}

// MARK: Convenience initializers

extension YoutubeResponse {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(YoutubeResponse.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Youtube {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Youtube.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
