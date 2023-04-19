//
//  PhotosViewContriller.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 01.03.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let source: [PhotoGallery] = PhotoGallery.setupImage()
    
    private var selectedCell: UICollectionViewCell? = nil
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
    }()
        
    private let selectedPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.tintColor = .white
        button.addTarget(self, action: #selector(cancelAnimationButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        navigationItem.title = "Photos Gallery"
        setupCollectionView()
    }
        
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        }
    
    private func setupView() {
        view.addSubview(collectionView)
        view.addSubview(backgroundView)
        view.addSubview(closeButton)
        view.addSubview(selectedPicture)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        if UIScreen.main.bounds.height < UIScreen.main.bounds.width {
            print("LandScape View")
            NSLayoutConstraint.activate([
                selectedPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                selectedPicture.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                selectedPicture.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
                selectedPicture.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
                
                closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
                closeButton.widthAnchor.constraint(equalToConstant: 80),
                closeButton.heightAnchor.constraint(equalToConstant: 80),
            ])
        } else {
            print("Portrait View")
            NSLayoutConstraint.activate([
                selectedPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                selectedPicture.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                selectedPicture.widthAnchor.constraint(equalTo: view.widthAnchor),
                selectedPicture.heightAnchor.constraint(equalTo: selectedPicture.widthAnchor, multiplier: 1),
                
                closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
                closeButton.widthAnchor.constraint(equalToConstant: 80),
                closeButton.heightAnchor.constraint(equalToConstant: 80),
            ])
        }
        }
    }

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell()
        cell.imageView.image = UIImage(named: source[indexPath.item].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let image = UIImage(named: source[indexPath.row].image) else { return }
            selectedCell = collectionView.cellForItem(at: indexPath)
            selectPicture(photo: image)
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3}
    private var insetsCount: CGFloat { return elementCount + 1}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (collectionView.bounds.width - sideInset * insetsCount) / elementCount
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

extension PhotosViewController {
    
    func selectPicture(photo: UIImage) {
        self.selectedPicture.image = photo
        self.selectedPicture.isUserInteractionEnabled = true
        self.navigationController?.isNavigationBarHidden = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            
            self.backgroundView.layer.opacity = 0.8
            self.selectedPicture.layer.opacity = 1
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0) {
                self.closeButton.layer.opacity = 1
            }
        }
    }
    
    @objc func cancelAnimationButton() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.closeButton.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.backgroundView.layer.opacity = 0.0
                self.selectedPicture.layer.opacity = 0
                self.navigationController?.isNavigationBarHidden = false
                self.view.layoutIfNeeded()
            }
        }
    }
}
