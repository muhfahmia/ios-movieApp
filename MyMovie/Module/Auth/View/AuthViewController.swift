//
//  AuthViewController.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import UIKit
import SVProgressHUD

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    private let viewModel: AuthViewModel
    
    init(vm: AuthViewModel) {
        self.viewModel = vm
        super.init(nibName: String(describing: AuthViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        signInBtn.addTarget(self, action: #selector(signInSubmit), for: .touchUpInside)
        usernameTxtField.delegate = self
        passwordTxtField.delegate = self
    }
    
    @objc func signInSubmit() {
        signInBtn.isEnabled = false
        progressView(flag: true)
        viewModel.userParam.username = usernameTxtField.text
        viewModel.userParam.password = passwordTxtField.text
        viewModel.submitAuth { [weak self] result in
            guard let self = self else { return }
            if result {
                self.progressView(flag: false)
                (UIApplication.shared.delegate as? AppDelegate)?.routeToHome()
            } else {
                self.progressView(flag: false)
                showAlert(title: "Authentication Failed", message: viewModel.message)
                print("message: \(viewModel.message)")
            }
            DispatchQueue.main.async {
                self.signInBtn.isEnabled = true
            }
            
        }
    }
    
    private func progressView(flag: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if flag == true {
                self.usernameTxtField.isEnabled = false
                self.passwordTxtField.isEnabled = false
                SVProgressHUD.show()
            } else {
                self.usernameTxtField.isEnabled = true
                self.passwordTxtField.isEnabled = true
                SVProgressHUD.dismiss()
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "OK", style: .default) { _ in
            alertController.dismiss(animated: true)
        }
        alertController.show(animated: true, vibrate: true)
        alertController.addAction(closeAction)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when return key is pressed
        textField.resignFirstResponder()
        return true
    }
    
}
