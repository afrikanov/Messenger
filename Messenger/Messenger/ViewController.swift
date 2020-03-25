//
//  ViewController.swift
//  Messenger
//
//  Created by  Aleksandr Afrikanov on 01.03.2020.
//  Copyright © 2020  Aleksandr Afrikanov. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var imageSelectButton: UIButton!
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbValue & 0xFF) / 256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    let radius: CGFloat = 39
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.layer.cornerRadius = 10
        editButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        editButton.layer.borderWidth = 3
        profileImage.layer.cornerRadius = radius
        imageSelectButton.backgroundColor = UIColorFromHex(rgbValue: 0x3F78F0)
        imageSelectButton.layer.cornerRadius = radius
    }
}
