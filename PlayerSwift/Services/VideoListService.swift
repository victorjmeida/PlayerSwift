//
//  VideoListService.swift
//  PlayerSwift
//
//  Created by João VIctir da Silva Almeida on 14/07/25.
//

import Foundation

class VideoListService {
    private let apiKey = "Y5KSIzox38NdblvDG8kH7ZSb66x7r8s3qknj0K75wjSIveeeRGhXEU98"

    func fetchVideos(completion: @escaping ([PexelsVideo]) -> Void) {
        guard let url = URL(string: "https://api.pexels.com/videos/search?query=education&per_page=10") else {
            completion([])
            return
        }
        
        //Cria requisicao HTTP
        var request = URLRequest(url: url)
        //Header
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        //Tarefe assíncrona com singleton
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PexelsResponse.self, from: data)
                completion(response.videos)
            } catch {
                completion([])
            }
        }.resume()
    }
}
