import UIKit
////
////  PhotosTableViewCell.swift
////  Navigation
////
////  Created by Vladimir Beliakov on 01.03.2023.
////
//
//import UIKit
//import SnapKit
//
//final class PhotosTableViewCell: UITableViewCell {
//
//    private let photosTextLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Photos"
//        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        label.textColor = .black
//        return label
//    }()
//
//    var goToGalleryButton: UIButton = {
//        var button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
//        return button
//    }()
//
//    private let imageView1: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 6
//        imageView.image = UIImage(named: "gallery01")
//        return imageView
//    }()
//
//    private let imageView2: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 6
//        imageView.image = UIImage(named: "gallery02")
//        return imageView
//    }()
//
//    private let imageView3: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 6
//        imageView.image = UIImage(named: "gallery03")
//        return imageView
//    }()
//
//    private let imageView4: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 6
//        imageView.image = UIImage(named: "gallery04")
//        return imageView
//    }()
//
//    func goButtonAddTarget(target: Any?, action: Selector) {
//        goToGalleryButton.addTarget(target, action: action, for: .touchUpInside)
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func layout() {
//
//        [photosTextLabel, goToGalleryButton, imageView1, imageView2, imageView3, imageView4].forEach { contentView.addSubview($0) }
//        contentView.layer.borderWidth = 0
//        let inset: CGFloat = 12
//        let insetImage: CGFloat = 8
//        let screenWidth = UIScreen.main.bounds.width
//        let imageWidth = (screenWidth - 48) / 4
//        let imageHeight = imageWidth / 4 * 3
//
//        NSLayoutConstraint.activate([
//            photosTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
//            photosTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
//            photosTextLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
//
//            goToGalleryButton.centerYAnchor.constraint(equalTo: photosTextLabel.centerYAnchor),
//            goToGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
//
//            imageView1.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
//            imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
//            imageView1.widthAnchor.constraint(equalToConstant: imageWidth),
//            imageView1.heightAnchor.constraint(equalToConstant: imageHeight),
//            imageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
//
//            imageView2.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
//            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: insetImage),
//            imageView2.widthAnchor.constraint(equalToConstant: imageWidth),
//            imageView2.heightAnchor.constraint(equalToConstant: imageHeight),
//            imageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
//
//            imageView3.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
//            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: insetImage),
//            imageView3.widthAnchor.constraint(equalToConstant: imageWidth),
//            imageView3.heightAnchor.constraint(equalToConstant: imageHeight),
//            imageView3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
//
//            imageView4.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
//            imageView4.widthAnchor.constraint(equalToConstant: imageWidth),
//            imageView4.heightAnchor.constraint(equalToConstant: imageHeight),
//            imageView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
//            imageView4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
//        ])
//    }
//}

final class PhotosTableViewCell: UITableViewCell {

    private let photoGallery = PhotoGallery.setupImage()

    // MARK: - CollectionView Horizontal
    private lazy var collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero ,collectionViewLayout: layoutCollection)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCellTableView.self, forCellWithReuseIdentifier: CollectionViewCellTableView.identifier)
        return collectionView
    }()

    //MARK: - Add PhotosLabel
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Add ArrowButton
        var goToGalleryButton: UIButton = {
            var button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
            return button
        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - GalleryButtonAction
        func goButtonAddTarget(target: Any?, action: Selector) {
            goToGalleryButton.addTarget(target, action: action, for: .touchUpInside)
        }


    //MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {

        contentView.addSubview(collectionView)
        contentView.addSubview(photosLabel)
        contentView.addSubview(goToGalleryButton)

        NSLayoutConstraint.activate([

            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            goToGalleryButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            goToGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            goToGalleryButton.widthAnchor.constraint(equalToConstant: 50),
            goToGalleryButton.heightAnchor.constraint(equalToConstant: 50),

            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12 - 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12 + 8),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
}

// MARK: - Extension UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellTableView.identifier, for: indexPath) as? CollectionViewCellTableView else { return CollectionViewCellTableView() }
        let photoGallery = photoGallery[indexPath.item]
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        cell.setupImageModel(photoGallery)
        return cell
    }
}

// MARK: - Extension UICollectionViewDelegateFlowLayout
extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - sideInset * 3) / 4
        return CGSize(width: height, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: sideInset, bottom: 1, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
}
