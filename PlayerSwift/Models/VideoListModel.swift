//
//  VideoListModel.swift
//  PlayerSwift
//
//  Created by João VIctir da Silva Almeida on 14/07/25.
//

struct PexelsVideoFile: Decodable {
    let link: String
    let quality: String
}

struct PexelsVideo: Decodable {
    let id: Int
    let user: PexelsUser
    let video_files: [PexelsVideoFile]
    let image: String
    let url: String
}

struct PexelsUser: Decodable {
    let name: String
}

struct PexelsResponse: Decodable {
    let videos: [PexelsVideo]
}

