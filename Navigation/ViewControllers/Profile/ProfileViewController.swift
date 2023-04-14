//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    private var model:[[Any]] = [["Images"], Posts.postArray]
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileTableView)
        setupView()
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc private func galleryButtonPressed() {
        let vc = PhotosViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.goToGalleryButton.addTarget(self, action: #selector(galleryButtonPressed), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        default:
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(data: Posts.postArray[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if var localModel: PostModel = model[indexPath.section][indexPath.row] as? PostModel {
//            let detailVC = DetailViewController()
//            localModel.views += 1
//            detailVC.viewsLabel.text = "Views: \(localModel.views)"
//            detailVC.likesLabel.text = "Likes: \(localModel.likes)"
//            detailVC.detailImageView.image = localModel.image
//            detailVC.descriptionLabel.text = localModel.description
//            detailVC.titleLabel.text = localModel.author
//            navigationController?.pushViewController(detailVC, animated: true)
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let post = model[indexPath.section][indexPath.row] as? PostModel else { return }
        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        let detailVС = DetailViewController(post: post) { count in
            cell.viewsCount! += count
        }
        present(detailVС, animated: true)
    }
    
}

extension ProfileViewController {
    
    private func setupView() {
        
        profileTableView.tableHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 220))
        profileTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
