//
//  ViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        return imagePickerController
    }()
  
    // MARK: IB Outlets
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    
    // MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        imagePicker.delegate = self
        
        print("frame from viewDidLoad: \(saveButton.frame)")
    }
   
     
    override func viewDidAppear(_ animated: Bool) {
        print("frame from viewDidAppear: \(saveButton.frame)")
        // Frame различается, т.к. метод viewDidload берет данные из storyboard (т.е. frame для iphone SE). Auto Layout срабатывает уже после метода viewDidload и frame изменяется для экрана iphone X.
    }
    
    // MARK: Private functions
    
    private func setupAppearance() {
        profileImageView.backgroundColor = UIColor(red: 228/255, green: 232/255, blue: 43/255, alpha: 1)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        saveButton.layer.cornerRadius = 10
        initialsLabel.text = takeInitials()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Profile photo", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Photo library", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true)
        }
        
        let actionCamera = UIAlertAction(title: "Take photo", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true)
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        
        present(alert, animated: true)
    }
    
    private func takeInitials() -> String {
        let initials = "\(fullNameLabel.text ?? ""))".components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first ?? "a")") + "\($1.first ?? "a")" }
        
        return initials
    }
    
    // MARK: IB Actions
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        showAlert()
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            initialsLabel.text = ""
            profileImageView.image = pickedImage
        }
        dismiss(animated: true)
    }
}



