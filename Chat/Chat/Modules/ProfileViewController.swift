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
    private let profileDataManager = ProfileDataManager()
    private let profileDataManagerOperation = ProfileDataManagerOperation()
  
    // MARK: UI
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        return imagePickerController
    }()
    
    // MARK: IB Outlets
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var editProfileImageButton: UIButton!
    @IBOutlet private var saveOperationsButton: UIButton!
    @IBOutlet private var saveGCDButton: UIButton!
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private var editButton: UIButton!
    
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var fullNameTextField: UITextField!
    @IBOutlet private var descriptionTextView: UITextView!
    
    @IBOutlet private var textViewPlaceholderLabel: UILabel!
    @IBOutlet private var initialsLabel: UILabel!
    
    // MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        imagePicker.delegate = self
        fullNameTextField.delegate = self
        descriptionTextView.delegate = self
        
        logger.logPrint(methodName: #function)
        print("frame from viewDidLoad: \(editButton.frame)")
        
        fullNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        if saveButtonDidTapedBefore {
        getUserInfoGCD()
        }
    }
    
//    func getprofileName() -> String {
//       return fullNameTextField.text
//    }
    
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
        super.viewDidAppear(animated)
        logger.logPrint(methodName: #function)
        print("frame from viewDidAppear: \(editButton.frame)")
        // Frame различается, т.к. метод viewDidload берет данные из storyboard (т.е. frame для iphone SE).
        // Auto Layout срабатывает уже после метода viewDidload и frame изменяется для экрана iphone X.
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
        profileImageView.backgroundColor = UIColor(red: 228 / 255, green: 232 / 255, blue: 43 / 255, alpha: 1)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        editButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 8
        saveGCDButton.layer.cornerRadius = 8
        saveOperationsButton.layer.cornerRadius = 8
        
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.isEditable = false
        
        editProfileImageButton.isEnabled = false
        cancelButton.isHidden = true
        saveGCDButton.isHidden = true
        saveOperationsButton.isEnabled = false
        saveGCDButton.isEnabled = false
        saveOperationsButton.isHidden = true
        fullNameTextField.isEnabled = false
        
        activityIndicator.isHidden = true
    }
    
    private func getUserInfoGCD() {
        profileDataManager.getValue(completion: { [weak self] (result: Result<Profile, FileManagerError>) in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let profile):
                    self.profileImageView.image = UIImage(data: profile.avatarImageData ?? Data())
                    self.fullNameTextField.text = profile.fullName
                    self.descriptionTextView.text = profile.description
                    self.setupInitials()
            
                case .failure(let error):
                    self.showNegativStorageManagerAlert(message: error.message)
                }
            }
        })
    }
    
    private func saveUserInfoGCD() {
        let profile = Profile(fullName: fullNameTextField.text,
                              description: descriptionTextView.text,
                              avatarImageData: profileImageView.image?.jpegData(compressionQuality: 0.5))

        profileDataManager.saveValue(profile) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let message):
                    self.showPositivStorageManagerAlert(message: message)
                case .failure(let error):
                    self.showNegativStorageManagerAlert(message: error.message)
                }
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func saveUserInfoOperation() {
        let profile = Profile(fullName: fullNameTextField.text,
                              description: descriptionTextView.text,
                              avatarImageData: profileImageView.image?.jpegData(compressionQuality: 0.5))

        profileDataManagerOperation.saveValue(profile) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let message):
                    self.showPositivStorageManagerAlert(message: message)
                case .failure(let error):
                    self.showNegativStorageManagerAlertOperation(message: error.message)
                }
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func setupInitials() {
        if self.profileImageView.image == nil {
            self.initialsLabel.text = self.takeInitials()
        } else {
            self.initialsLabel.text = ""
        }
    }
    
    private func showImagePickerAlert() {
        let alert = UIAlertController(title: "Profile photo", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Photo library", style: .default) { (_) in
            self.chooseImagePicker(source: .photoLibrary)
        }
        
        let actionCamera = UIAlertAction(title: "Take photo", style: .default) { (_) in
            self.chooseImagePicker(source: .camera)
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(actionCamera)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert.addAction(actionPhoto)
        }
        
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    
    private func showPositivStorageManagerAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showNegativStorageManagerAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let repeatAction = UIAlertAction(title: "Повторить", style: .default) { _ in self.saveUserInfoGCD()
        }
        alert.addAction(okAction)
        alert.addAction(repeatAction)
        present(alert, animated: true)
    }
    
    private func showNegativStorageManagerAlertOperation(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let repeatAction = UIAlertAction(title: "Повторить", style: .default) { _ in self.saveUserInfoOperation()
        }
        alert.addAction(okAction)
        alert.addAction(repeatAction)
        present(alert, animated: true)
    }
    
    private func takeInitials() -> String {
        let formatter = PersonNameComponentsFormatter()
        guard let components = formatter.personNameComponents(from: "\(fullNameTextField.text ?? "")") else { return ""}
        formatter.style = .abbreviated
        
        return formatter.string(from: components)
    }
    
    // MARK: IB Actions
    
    @IBAction func editProfileImageButtonPressed(_ sender: UIButton) {
        showImagePickerAlert()
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
        descriptionTextView.isEditable = true
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        cancelButton.isHidden = true
        saveGCDButton.isHidden = true
        saveOperationsButton.isHidden = true
        editProfileImageButton.isEnabled = false
        fullNameTextField.isEnabled = false
        editButton.isHidden = false
        
        getUserInfoGCD()
    }
    
    @IBAction func saveGCDButtonPressed(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        saveGCDButton.isEnabled = false
        saveOperationsButton.isEnabled = false

        saveUserInfoGCD()
        changeStateOfButton()
    }
    
    @IBAction func saveOperationsButtonPressed(_ sender: UIButton) {
        saveUserInfoOperation()
    }
    
    @IBAction func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    private var saveButtonDidTapedBefore: Bool {
        let userDefaults = UserDefaults.standard
        let key = "hasBeenLaunchdBeforeFlag"
        return userDefaults.bool(forKey: key) ? true : false
    }
    
    private func changeStateOfButton() {
        let userDefaults = UserDefaults.standard
        let key = "hasBeenLaunchdBeforeFlag"
        if !saveButtonDidTapedBefore {
            userDefaults.setValue(true, forKey: key)
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        profileImageView.image = info[.editedImage] as? UIImage
        initialsLabel.text = ""
        dismiss(animated: true)
    }
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
           
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = source
    
                present(imagePicker, animated: true)
            
        }
    
//    func chooseImagePicker(source: UIImagePickerController.SourceType) {
//        if UIImagePickerController.isSourceTypeAvailable(source) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.allowsEditing = true
//            imagePicker.sourceType = source
//
//            present(imagePicker, animated: true)
//        }
//    }
}

extension ProfileViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        saveGCDButton.isEnabled = true
        saveOperationsButton.isEnabled = true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return true
        }
}
