//
//  ProfileCell.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 23.02.2022.
//

import UIKit

//Celleri yeniden kullanabilmek için protokol ve extension kullandık.
protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class ProfileCell: UICollectionViewCell {


   let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = GBold
        label.textColor = .purple
        return label
    }()

    let locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = GBook
        label.textColor = .black
        return label
    }()

    let professionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = GItalic
        label.textColor = .systemIndigo
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 14
        contentView.backgroundColor = .clear

        contentView.addSubview(profileImageView)
        contentView.addSubview(name)
        contentView.addSubview(locationLabel)
        contentView.addSubview(professionLabel)
    }

    private func setupLayouts() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.translatesAutoresizingMaskIntoConstraints = false

        // ProfileImage Constraints
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 195.0)
        ])

        // Name Constraints
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -2)
            
        ])

        // Location Constraints
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            locationLabel.bottomAnchor.constraint(equalTo: name.bottomAnchor, constant: -10)
        ])

        // Profession Constraints
        NSLayoutConstraint.activate([
            professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            professionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            professionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            professionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with profile: Profile) {
        profileImageView.image = UIImage(named: profile.imageName)
        name.text = profile.name
        locationLabel.text = profile.location
        professionLabel.text = profile.profession
    }
}


extension ProfileCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
