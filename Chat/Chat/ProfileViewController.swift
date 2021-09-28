//
//  ViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let logger = Logger.shared
    
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
        
        logger.logPrint(methodName: #function)
        print("frame from viewDidLoad: \(saveButton.frame)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          logger.logPrint(methodName: #function)
      }
      
      override func viewWillLayoutSubviews() {
          logger.logPrint(methodName: #function)
      }
      
      override func viewDidLayoutSubviews() {
          logger.logPrint(methodName: #function)
      }
   
    override func viewDidAppear(_ animated: Bool) {
        logger.logPrint(methodName: #function)
        print("frame from viewDidAppear: \(saveButton.frame)")
        // Frame различается, т.к. метод viewDidload берет данные из storyboard (т.е. frame для iphone SE). Auto Layout срабатывает уже после метода viewDidload и frame изменяется для экрана iphone X.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           logger.logPrint(methodName: #function)
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           logger.logPrint(methodName: #function)
       }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
      //  print("frame from init: \(saveButton.frame)")
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
        let formatter = PersonNameComponentsFormatter()
        guard let components = formatter.personNameComponents(from: "\(fullNameLabel.text ?? "")") else { return ""}
            formatter.style = .abbreviated
        
        return formatter.string(from: components)
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



