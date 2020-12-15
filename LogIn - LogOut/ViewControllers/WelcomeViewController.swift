//
//  WelcomeViewController.swift
//  LogIn - LogOut
//
//  Created by Владимир Панасенков on 15.12.2020.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
