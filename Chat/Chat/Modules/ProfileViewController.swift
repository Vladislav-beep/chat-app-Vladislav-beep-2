//
//  ViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Dependencies
    
    private let logger = Logger.shared
    let localStorageManager = LocalStorageManager()
    
    // MARK: UI
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        return imagePickerController
    }()
    
    // MARK: IB Outlets
    
    @IBOutlet var editProfileImageButton: UIButton!
    @IBOutlet var saveOperationsButton: UIButton!
    @IBOutlet var saveGCDButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    
    @IBOutlet var textViewPlaceholderLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    
    // MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        imagePicker.delegate = self
        descriptionTextView.delegate = self
        
        logger.logPrint(methodName: #function)
        print("frame from viewDidLoad: \(editButton.frame)")
        
        fullNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        fullNameTextField.text = localStorageManager.readFromLocalFile(from: "fullName")
        profileImageView.image = localStorageManager.downloadImageFromLocalFile()
        
        if profileImageView.image != nil {
            initialsLabel.isHidden = true
        }
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
        print("frame from viewDidAppear: \(editButton.frame)")
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
        // Фрейм не печатается, т.к. view и ее subview еще не загружены в память
    }
    
    // MARK: Private functions
    
    private func setupAppearance() {
        profileImageView.backgroundColor = UIColor(red: 228/255, green: 232/255, blue: 43/255, alpha: 1)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        editButton.layer.cornerRadius = 10
        
        cancelButton.layer.cornerRadius = 8
        saveGCDButton.layer.cornerRadius = 8
        saveOperationsButton.layer.cornerRadius = 8
        descriptionTextView.layer.cornerRadius = 8
        
        editProfileImageButton.isEnabled = false
        cancelButton.isHidden = true
        saveGCDButton.isHidden = true
        saveOperationsButton.isEnabled = false
        saveGCDButton.isEnabled = false
        saveOperationsButton.isHidden = true
        fullNameTextField.isEnabled = false
        
        
       // initialsLabel.text = takeInitials()
    }
    
   
    
    private func showAlert() {
        let alert = UIAlertController(title: "Profile photo", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Photo library", style: .default) { (alert) in
            self.chooseImagePicker(source: .photoLibrary)
        }
        
        let actionCamera = UIAlertAction(title: "Take photo", style: .default) { (alert) in
            self.chooseImagePicker(source: .camera)
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        
        present(alert, animated: true)
    }
    
//    private func takeInitials() -> String {
//        let formatter = PersonNameComponentsFormatter()
//        guard let components = formatter.personNameComponents(from: "\(fullNameLabel.text ?? "")") else { return ""}
//        formatter.style = .abbreviated
//
//        return formatter.string(from: components)
//    }
    
    // MARK: IB Actions
    
    @IBAction func editProfileImageButtonPressed(_ sender: UIButton) {
        showAlert()
        saveGCDButton.isEnabled = true
        saveOperationsButton.isEnabled = true
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        cancelButton.isHidden = false
        saveGCDButton.isHidden = false
        saveOperationsButton.isHidden = false
        editProfileImageButton.isEnabled = true
        fullNameTextField.isEnabled = true
        editButton.isHidden = true
        fullNameTextField.becomeFirstResponder()
    
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        cancelButton.isHidden = true
        saveGCDButton.isHidden = true
        saveOperationsButton.isHidden = true
        editProfileImageButton.isEnabled = false
        fullNameTextField.isEnabled = false
        editButton.isHidden = false
        
        fullNameTextField.text = localStorageManager.readFromLocalFile(from: "fullName")
        profileImageView.image = localStorageManager.downloadImageFromLocalFile()
        //подгрузка картинки и текста
    }
    
    
    @IBAction func saveGCDButtonPressed(_ sender: UIButton) {
        localStorageManager.writeToLocalFile(writeString: fullNameTextField.text ?? "", fileName: "fullName")
        localStorageManager.saveProfileImageToLocalFile(image: profileImageView.image ?? UIImage())
    }
    
    @IBAction func saveOperationsButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func closeButtonPressed() {
        dismiss(animated: true)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileImageView.image = info[.editedImage] as? UIImage
        initialsLabel.text = ""
        
        dismiss(animated: true)
    }
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            
            present(imagePicker, animated: true)
        }
    }
}

extension ProfileViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text.count != 0 {
//            textViewPlaceholderLabel.isHidden = true
//        }
//
//    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if textView.text.count != 0 {
//                   textViewPlaceholderLabel.isHidden = true
//               }
//        return true
//    }
}

extension ProfileViewController: UITextFieldDelegate {
    
    @objc private func textFieldChanged() {
        if fullNameTextField.text?.isEmpty == false {
            saveGCDButton.isEnabled = true
            saveOperationsButton.isEnabled = true
        } else {
            saveGCDButton.isEnabled = false
            saveOperationsButton.isEnabled = false
        }
    }
}
    



