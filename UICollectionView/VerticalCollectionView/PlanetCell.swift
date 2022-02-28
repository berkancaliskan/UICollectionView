//
//  ProfileCell.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 23.02.2022.
//

import UIKit

protocol ReusableView2: AnyObject {
    static var identifier: String { get }
}

 class PlanetCell: UICollectionViewCell {
    

        let planetImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = GBookBig
        label.textColor = .purple
        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = GBookBig
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 6
        contentView.backgroundColor = .clear

        contentView.addSubview(planetImageView)
        contentView.addSubview(name)
        contentView.addSubview(infoLabel)
    }

    private func setupLayouts() {
        
        // Programatik olarak verdiğimiz constraintlerin görünmesi için false olmalı.
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        

        // Contentview Constraintleri
        NSLayoutConstraint.activate([
            planetImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -100),
            planetImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 100),
            planetImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 220),
            planetImageView.heightAnchor.constraint(equalToConstant: 200),
            planetImageView.widthAnchor.constraint(equalToConstant: 200),
       
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            name.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 30),
            name.heightAnchor.constraint(equalToConstant: 25),
            name.widthAnchor.constraint(equalToConstant: 80),
            
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            infoLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            infoLabel.heightAnchor.constraint(equalToConstant: 250),
            infoLabel.widthAnchor.constraint(equalToConstant: 100),

        ])
        

        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with profile: Planets) {
        planetImageView.image = UIImage(named: profile.imageName)
        name.text = profile.name
        infoLabel.text = profile.info
    
    }
}


extension PlanetCell: ReusableView2 {
    static var identifier: String {
        return String(describing: self)
    }
}
