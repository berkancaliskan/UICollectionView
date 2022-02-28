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
        createLabel()

    }

    func createLabel(){
        
        let title = UILabel()
        
        let screenH = view.frame.size.height
        let screenW = view.frame.size.width
        title.text = NSLocalizedString("🌍 Gezegenler 🪐", comment:"")
        title.textAlignment = .center
        title.textColor = UIColor.black
        title.font = GBookBig
        title.numberOfLines = 0
        title.frame = CGRect(x: 0.1 * screenW, y: 0.047 * screenH, width: 0.8 * screenW, height: 0.1 * screenH)
        view.addSubview(title)
    }
    
    func createCollectionView(){
        
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(PlanetCell.self, forCellWithReuseIdentifier: PlanetCell.identifier)
    collectionView.backgroundColor = .clear
    collectionView.layer.borderWidth = 1
    collectionView.layer.borderColor = UIColor.lightGray.cgColor

    
 
//      CollectionView Frame
        
        let screenH = view.frame.size.height
        let screenW = view.frame.size.width
        
        collectionView.frame = CGRect(x:      0.02 * screenW,
                                      y:      0.15 * screenH,
                                      width:  0.98 * screenW,
                                      height: 0.60 * screenH)

        collectionView.dataSource = self
        view.addSubview(collectionView)
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


