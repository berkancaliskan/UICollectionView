//
//  MainVC.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
       
    }
    
    func createUI(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        
        view.backgroundColor = UIColor.white
      
        let holderTitle = UILabel()
        holderTitle.text = NSLocalizedString("UICollectionView", comment:"")
        holderTitle.textAlignment = .center
        holderTitle.textColor = .darkGray
        holderTitle.font = GBoldBig
        holderTitle.numberOfLines = 0
        holderTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.415 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(holderTitle)
        
        
        let holderSubTit = UILabel()
        holderSubTit.text = NSLocalizedString("Vertical & Horizontal", comment:"")
        holderSubTit.textAlignment = .center
        holderSubTit.textColor = .darkGray
        holderSubTit.numberOfLines = 0
        holderSubTit.font = GBookBig
        holderSubTit.frame = CGRect(x: 0.1 * screenWidth, y: 0.43 * screenHeight, width: 0.8 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(holderSubTit)
        
      
        
        let onboadingImg = UIImageView()
        onboadingImg.image = UIImage(named: "swift-logo")
//        onboadingImg.frame = CGRect(x: 0.28 * screenWidth, y: 0.2 * screenHeight, width: 0.44 * screenWidth, height: 0.21 * screenHeight)
        
        onboadingImg.translatesAutoresizingMaskIntoConstraints = false
        onboadingImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboadingImg)
        
        NSLayoutConstraint.activate([
            
            onboadingImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboadingImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120.0),
            onboadingImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120.0),
            onboadingImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 190 ),
            onboadingImg.heightAnchor.constraint(equalTo: onboadingImg.widthAnchor, multiplier: 1)
        ])

        
     
        
   
        let verticalButton = UIButton()
        verticalButton.backgroundColor = .systemOrange
        verticalButton.setTitle(NSLocalizedString("Vertical", comment: ""), for: UIControl.State.normal)
        verticalButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        verticalButton.layer.cornerRadius = 8
        verticalButton.titleLabel?.font = GBook
        verticalButton.frame = CGRect(x: 0.14 * screenWidth, y: 0.7 * screenHeight, width: 0.72 * screenWidth, height: 0.056 * screenHeight)
        view.addSubview(verticalButton)
        verticalButton.addTarget(self, action: #selector(verticalClicked), for: UIControl.Event.touchUpInside)
        
        
        let horizontalButton = UIButton()
        horizontalButton.backgroundColor = .systemOrange
        horizontalButton.setTitle(NSLocalizedString("Horizontal", comment: ""), for: UIControl.State.normal)
        horizontalButton.layer.cornerRadius = 8
        horizontalButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        horizontalButton.titleLabel?.font = GBook
        horizontalButton.frame = CGRect(x: 0.14 * screenWidth, y: 0.77 * screenHeight, width: 0.72 * screenWidth, height: 0.056 * screenHeight)
        view.addSubview(horizontalButton)
        horizontalButton.addTarget(self, action: #selector(horizontalClicked), for: UIControl.Event.touchUpInside)
                
                
    }
    
    @objc func verticalClicked() {
       
        let vc = VerticalVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
        
      }
    
    @objc func horizontalClicked() {
        
        let vc = HorizontalVC()
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        
      }
        
        
}

