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
         
        let screenH = view.frame.size.height
        let screenW = view.frame.size.width
         
  
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = CGRect(x: 0 * screenW,
                                      y: 0.03 * screenH,
                                      width: 1 * screenW ,
                                      height: 1 * screenH)
    
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

// Collection view için görünümü özelleştirmek için extension kullandık.
extension VerticalVC: UICollectionViewDelegateFlowLayout {
    
//   Cellerin boyutlarını belirliyoruz.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: 16.0)

        return CGSize(width: width, height: 300)
    }

//    İtemlerin arasındaki boşluğu ve itemlerin width'i belirten fonksiyon.
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }
//    İtemlerin view içindeki görünümü yani alttan üstten ve yanlardan uzaklığını veren fonksiyon.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16.0,
                            left: 16.0,
                            bottom: 76,
                            right: 16.0)
    }

// Arkaplanı Gradient yapmak için kullandığım fonsiyon.
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
