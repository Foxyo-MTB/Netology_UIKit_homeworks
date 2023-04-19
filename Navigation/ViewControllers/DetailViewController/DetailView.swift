//
//  DetailView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 14.04.2023.
//

import UIKit

final class DetailView: UIView {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let imagePost: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let authorLabel: UILabel = {
        let author = UILabel()
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        author.numberOfLines = 0
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        description.textColor = .black
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    init(post: PostModel) {
        super.init(frame: .zero)
        setupPostData(model: post)
        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPostData(model: PostModel) {
        authorLabel.text = model.author
        imagePost.image = model.image
        descriptionLabel.text = model.description
    }

    private func setupViews() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imagePost)
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
    }

    private func setConstraints() {
        let inset: CGFloat = 16
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            imagePost.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: inset),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0.5),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.5),
            imagePost.heightAnchor.constraint(equalToConstant: 300),

            descriptionLabel.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}

