//
//  VideoListViewModel.swift
//  PlayerSwift
//
//  Created by João VIctir da Silva Almeida on 14/07/25.
//

import Foundation

class VideoListViewModel {
    private let service = VideoListService()
    var videos: [PexelsVideo] = []
    var onUpdate: (() -> Void)?

    func loadVideos() {
        service.fetchVideos { [weak self] videos in
            DispatchQueue.main.async {
                self?.videos = videos
                self?.onUpdate?()
            }
        }
    }
}
