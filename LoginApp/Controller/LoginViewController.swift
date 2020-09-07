//
//  ViewController.swift
//  LoginApp
//
//  Created by sindija.dzintare on 07/09/2020.
//  Copyright © 2020 sindija.dzintare. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    private let userName = "a"
    private let id = "12"
    private let identifier = "WelcomeViewController"
    
    let userDefaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        if userDefaults.string(forKey: "userName") != nil{
            
        }
    }
    
    @objc func keyboardWillShow(notification: Notification){
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= 150
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y += 150
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        handleLogin()
    }
    
    func handleLogin(){
        guard userNameTextField.text == userName, passwordTextField.text == id else{
            warningPopUP(withTitle: "Invalid username or password", withMessage: "Please enter correct login information")
            return
        }
        
        userDefaults.set(userName, forKey: "userName")
        userDefaults.set(id, forKey: "id")
        
        
        goToWelcomeVC()
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func goToWelcomeVC(){
        let initController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as! WelcomeViewController
        
      //  initController.userName = userNameTextField.text
        view.endEditing(true)
        present(initController, animated: true)
    }
    
    
    @IBAction func forgotUserButtonTapped(_ sender: Any) {
        warningPopUP(withTitle: "Ooops!", withMessage: "Your username is: \(userName)")
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        warningPopUP(withTitle: "Ooops!", withMessage: "Reset your password")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
            passwordTextField.becomeFirstResponder()
        }else{
            handleLogin()
        }
        return true
    }
}
