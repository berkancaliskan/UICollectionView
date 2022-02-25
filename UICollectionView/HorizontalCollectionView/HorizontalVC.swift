//
//  ViewController.swift
//  UICollectionViewHorizontal
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import UIKit

class HorizontalVC: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        createCollectionView()
        setGradientBackground()
        

        
    }
    
    func createCollectionView(){
        
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    collectionView.register(PlanetCell.self, forCellWithReuseIdentifier: PlanetCell.identifier)
    
    collectionView.backgroundColor = .clear
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.layer.borderWidth = 1
    collectionView.layer.borderColor = UIColor.lightGray.cgColor
//        collectionView.layer.cornerRadius = 40
    
    view.addSubview(collectionView)
//      CollectionView Constraint
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
    collectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true

    collectionView.dataSource = self
    
    }
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }


}

extension HorizontalVC: UICollectionViewDataSource{
    
    //   Cellerin kaç tane olacağını profile boyuna göre belirliyoruz.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    
        UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCell.identifier, for: indexPath) as! PlanetCell

            let planet = planets[indexPath.row]
            cell.setup(with: planet)
            cell.contentView.backgroundColor = UIColor(red: 0.76, green: 0.87, blue: 1.00, alpha: 1.00)
     
            return cell
            
        
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


