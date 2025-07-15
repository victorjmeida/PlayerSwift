//
//  VideoPlayerViewController.swift
//  PlayerSwift
//
//  Created by João VIctir da Silva Almeida on 14/07/25.
//

import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {
    private let video: PexelsVideo

    init(video: PexelsVideo) {
        self.video = video
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Player"

        guard let link = video.video_files.first?.link, let url = URL(string: link) else { return }

        let player = AVPlayer(url: url)
        let playerVC = AVPlayerViewController()
        playerVC.player = player

        playerVC.view.frame = view.bounds
        playerVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addChild(playerVC)
        view.addSubview(playerVC.view)
        playerVC.didMove(toParent: self)

        player.play()
    }
}

