//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 20.02.2023.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    var viewsCount: Int? {
        didSet {
            viewsLabel.text = "Views: \(viewsCount ?? 0 )"
        }
    }

    var likesCount: Int? {
        didSet {
            likesLabel.text = "Likes: \(likesCount ?? 0 )"
        }
    }
    
    let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let postHeaderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let postPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let postTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Текст поста"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "Likes: 16"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Views: 24"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    func setupCell(data: PostModel) {
        postHeaderLabel.text = data.author
        postPicture.image = data.image
        postTextLabel.text = data.description
        likesLabel.text = "Likes: \(data.likes)"
        viewsLabel.text = "Views: \(data.views)"
        viewsCount = data.views
        likesCount = data.likes
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostTableViewCell {
    
    private func setupView() {
        
        backgroundColor = .white
        
        addSubview(contentWhiteView)
        contentWhiteView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentWhiteView.addSubview(postHeaderLabel)
        postHeaderLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.top.equalToSuperview().offset(16)
        }
        
        contentWhiteView.addSubview(postPicture)
        postPicture.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(postPicture.snp.width)
            make.top.equalTo(postHeaderLabel.snp.bottom).offset(12)
        }
        
        contentWhiteView.addSubview(postTextLabel)
        postTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.top.equalTo(postPicture.snp.bottom).offset(16)
            
        }
        
        contentWhiteView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.top.equalTo(postTextLabel.snp.bottom).offset(16)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        contentWhiteView.addSubview(viewsLabel)
        viewsLabel.snp.makeConstraints { make in
            make.top.equalTo(postTextLabel.snp.bottom).offset(16)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
}
