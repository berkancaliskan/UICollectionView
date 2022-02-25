//
//  ProfileCell.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 23.02.2022.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class ProfileCell: UICollectionViewCell {

    private enum Constants {
        // MARK: contentView layout constants
        static let contentViewCornerRadius: CGFloat = 14.0

        // MARK: profileImageView layout constants
        static let imageHeight: CGFloat = 195.0

        // MARK: Generic layout constants
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
    }

    private let profileImageView: UIImageView = {
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
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
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
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])

        // Name Constraints
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -2)
            
        ])

        // Location Constraints
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            locationLabel.bottomAnchor.constraint(equalTo: name.bottomAnchor, constant: -10)
        ])

        // Profession Constraints
        NSLayoutConstraint.activate([
            professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            professionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
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
