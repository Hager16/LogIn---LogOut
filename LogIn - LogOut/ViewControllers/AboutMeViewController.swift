//
//  AboutMeViewController.swift
//  LogIn - LogOut
//
//  Created by Владимир Панасенков on 16.12.2020.
//

import UIKit

class AboutMeViewController: UIViewController {
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
}
