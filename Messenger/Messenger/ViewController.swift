//
//  ViewController.swift
//  Messenger
//
//  Created by  Aleksandr Afrikanov on 01.03.2020.
//  Copyright © 2020  Aleksandr Afrikanov. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var imageSelectButton: UIButton!
    
    let radius: CGFloat = 30
    
    @IBAction func editButtonClick(_ sender: UIButton) {
        // todo
    }
    
    @IBAction func imageSelectButtonClick(_ sender: Any) {
        print("Выбери изображение профиля")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Изображение", message: "Выберите изображение профиля", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Сделать фото", style: .default, handler: { (_) in
            if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Sorry, camera is not available")
            }
        }))

        actionSheet.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { (_) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))

        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (_) in
            print("Отмена")
        }))

        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    var tap: UITapGestureRecognizer?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tap = UITapGestureRecognizer(target: self, action: Selector(("handleTap:")))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tap = UITapGestureRecognizer(target: self, action: Selector(("handleTap:")))
        // print(editButton.frame)
        // There is an error appears because view components are created after this method
    }

    func UIColorFromHex(rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbValue & 0xFF) / 256.0
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(editButton.frame)
        editButton.layer.cornerRadius = 10
        editButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        editButton.layer.borderWidth = 3
        profileImage.layer.cornerRadius = radius
        imageSelectButton.backgroundColor = UIColorFromHex(rgbValue: 0x3F78F0)
        imageSelectButton.layer.cornerRadius = radius
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(editButton.frame)
        // Frames are different because viewDidLoad() calls for the device which shows in storyboard editor (iPhone 8), but viewDidAppear() calls for target device (iPhone 11) and the placement of button on devices are different. viewDidLoad() doesn't set geometry parameters.
    }
}
