//
//  Profile.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import Foundation


struct Profile {
    let name: String
    let location: String
    let imageName: String
    let profession: String
}



var profiles: [Profile] = []

func populateProfiles() {
    profiles = [
       Profile(name: "Tuna", location: "NeonApps", imageName: "tuna", profession: "Co-Founder"),
       Profile(name: "Destan", location: "NeonApps", imageName: "destan", profession: "Co-Founder"),
       Profile(name: "Bedri", location: "Development", imageName: "bedri", profession: "iOS Dev."),
       Profile(name: "Berkan", location: "Development", imageName: "berkan", profession: "iOS Dev."),
       Profile(name: "Emre", location: "Development", imageName: "emre", profession: "iOS Dev."),
       Profile(name: "Beytullah", location: "Development", imageName: "beytullah", profession: "iOS Dev."),
       Profile(name: "Ege", location: "Development", imageName: "ege", profession: "iOS Dev."),
       Profile(name: "Canan", location: "Sales", imageName: "canan", profession: "Head of Sales"),
       Profile(name: "Ayça", location: "Content", imageName: "ayca", profession: "Content Manager"),
       Profile(name: "Sevval", location: "Design", imageName: "sevval", profession: "UI/UX Designer"),
       Profile(name: "Okan", location: "Design", imageName: "okan", profession: "UI/UX Designer"),
       Profile(name: "Bahar", location: "Design", imageName: "bahar", profession: "UI/UX Designer"),
       Profile(name: "Ayşe", location: "Design", imageName: "ayse", profession: "UI/UX Designer")
   ]
}
