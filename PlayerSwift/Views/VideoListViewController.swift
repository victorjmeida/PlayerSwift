//
//  VideoListViewController.swift
//  PlayerSwift
//
//  Created by João VIctir da Silva Almeida on 14/07/25.
//

import UIKit

class VideoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel = VideoListViewModel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LearnStream"
        view.backgroundColor = .systemBackground
        setupTableView()
        setupLayout()

        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.loadVideos()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let video = viewModel.videos[indexPath.row]
        cell.textLabel?.text = video.user.name + " - \(video.id)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let video = viewModel.videos[indexPath.row]
        // Navegar para player (você vai criar o player)
        let playerVC = VideoPlayerViewController(video: video)
        navigationController?.pushViewController(playerVC, animated: true)
    }
}

