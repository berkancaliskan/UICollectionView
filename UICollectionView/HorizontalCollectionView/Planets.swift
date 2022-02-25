//
//  Profile.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import Foundation


struct Planets {
    let name: String
    let imageName: String
    let info: String
}


var planets: [Planets] = []

func planetInfo() {
    
    planets = [
       Planets(name: "Merkür",
               imageName: "mercur",
               info: "Güneş sistemimizdeki en küçük ve Güneş'e en yakın gezegen, Dünya'nın Ay'ından sadece biraz daha büyüktür. Merkür, her 88 Dünya gününde bir Güneş'in etrafında dönen en hızlı gezegendir."),
       
       Planets(name: "Venüs",
               imageName: "venus",
               info: "Çoğu gezegenden ters yönde yavaşça döner. Kalın bir atmosfer, ısıyı kaçak bir sera etkisinde hapseder ve onu güneş sistemimizdeki en sıcak gezegen yapar."),
       
       Planets(name: "Dünya",
               imageName: "dunya",
               info: "Ana gezegenimiz, şu ana kadar canlıların yaşadığı bildiğimiz tek yerdir. Aynı zamanda güneş sistemimizde yüzeyinde sıvı su bulunan tek gezegendir."),
       
       Planets(name: "Mars",
               imageName: "mars",
               info: "Mars, çok ince bir atmosfere sahip tozlu, soğuk, çöl bir dünyadır. Mars'ın - milyarlarca yıl önce - daha kalın bir atmosfere sahip daha ıslak ve daha sıcak olduğuna dair güçlü kanıtlar var.."),
       
       Planets(name: "Jupiter",
               imageName: "jupiter",
               info: "Jüpiter, güneş sistemimizin diğer gezegenlerinin toplamından iki kat daha büyüktür. Dev gezegenin Büyük Kırmızı lekesi, Dünya'dan daha büyük, asırlık bir fırtınadır."),
       
       Planets(name: "Satürn",
               imageName: "saturn",
               info: "Göz kamaştırıcı, karmaşık bir buz halkaları sistemi ile süslenmiş Satürn, güneş sistemimizde benzersizdir. Diğer dev gezegenlerin halkaları vardır, ancak hiçbiri Satürn'ünki kadar muhteşem değildir."),
       
       Planets(name: "Uranüs",
               imageName: "uranus",
               info: "Güneş'ten yedinci gezegen olan Uranüs, yörünge düzleminden yaklaşık 90 derecelik bir açıyla döner. Bu benzersiz eğim, Uranüs'ün kendi tarafında dönüyormuş gibi görünmesini sağlar."),
       
       Planets(name: "Neptün",
               imageName: "neptun",
               info: "Güneşimizin etrafında dönen sekizinci ve en uzak ana gezegen olan Neptün karanlık, soğuk ve süpersonik rüzgarlarla savruluyor. Matematiksel hesaplamalarla bulunan ilk gezegendi.")
      
   ]
}
