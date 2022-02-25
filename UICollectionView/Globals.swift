//
//  Globals.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import Foundation
import UIKit

    
let GBook = UIFont(name: "Graphie-Book", size: 16)
let GItalic = UIFont(name: "Graphie-SemiBoldItalic", size: 14)
let GBold = UIFont(name: "Graphie-Bold", size: 18)

let GBoldBig = UIFont(name: "Graphie-Bold", size: 30)
let GBookBig = UIFont(name: "Graphie-Book", size: 22)
let GItalicBig = UIFont(name: "Graphie-SemiBoldItalic", size: 20)
    


func showCustomAlert(title: String, message: String,  viewController : UIViewController){
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK.", style: UIAlertAction.Style.default, handler: nil))
    viewController.present(alert, animated: true, completion: nil)

}

func vibrate(style : UIImpactFeedbackGenerator.FeedbackStyle){
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
    
}






