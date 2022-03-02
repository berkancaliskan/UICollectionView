//
//  ViewController.swift
//  UICollectionViewHorizontal
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import UIKit

class HorizontalVC: UIViewController, UICollectionViewDataSource {
    
    //   Cellerin kaç tane olacağını profile boyuna göre belirliyoruz.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    //   Cellere içeriğinde ne olacağını yazıyoruz.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCell.identifier, for: indexPath) as! PlanetCell
        
        let planet = planets[indexPath.row]
        cell.setup(with: planet)
        cell.contentView.backgroundColor = UIColor(red: 0.76, green: 0.87, blue: 1.00, alpha: 1.00)
        return cell
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createCollectionView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.95, alpha: 1.00)
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


    




