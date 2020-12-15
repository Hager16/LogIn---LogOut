//
//  ViewController.swift
//  LogIn - LogOut
//
//  Created by Владимир Панасенков on 11.12.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        
        welcomeVC.user = user
        aboutUserVC.user = user
    }
    @IBAction func logInPressed() {
        guard
            userNameTextField.text == user.login,
            passwordTextField.text == user.password
            else {
            showAllert(title: "Invalid login or password", message: "Please enter correct login and password", textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotUserNamePressed() {
        showAllert(title: "Oops!", message: "Your user name is \(user.login)")
    }
    @IBAction func forgotPasswordPressed() {
        showAllert(title: "Oops!", message: "Your password is \(user.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
}
// MARK: - Allert Controller
extension LoginViewController {
    private func showAllert(title: String, message: String, textField: UITextField? = nil) {
        let allert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = nil}
        allert.addAction(okAction)
        present(allert, animated: true)
    }
}
// MARK: - Text Fields Delegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        }else{
            logInPressed()
        }
        return true
    }
}
