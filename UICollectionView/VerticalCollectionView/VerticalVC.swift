//
//  ViewController.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 22.02.2022.
//

import UIKit

class VerticalVC: UIViewController {


        let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        populateProfiles()
        collectionView.reloadData()
        setGradientBackground()
    }

   func setupViews() {
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
    }

     func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // CollectionView Constraint
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

     

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
//   Cellerin kaç tane olacağını profile boyuna göre belirliyoruz.

extension VerticalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
//   Cellere tıkladığımda ne olacağını yazıyoruz.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        vibrate(style: .heavy)
        
        print("User tapped on item \(indexPath.row)")
        
        showCustomAlert(title: "Merhaba!" , message: "Seçilen item \(indexPath.row)", viewController: self)
    
    }
//   Cellere içeriğinde ne olacağını yazıyoruz.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell

        let profile = profiles[indexPath.row]
        cell.setup(with: profile)
        cell.contentView.backgroundColor = UIColor(red: 0.76, green: 0.87, blue: 1.00, alpha: 1.00)
        return cell
    }
}

extension VerticalVC: UICollectionViewDelegateFlowLayout {
    
//   Cellerin boyutlarını belirliyoruz.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.78, green: 0.47, blue: 0.98, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.64, green: 0.82, blue: 0.99, alpha: 1.00).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
