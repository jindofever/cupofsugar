//
//  LoginViewController.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginView = LoginView(frame: self.view.bounds)
        loginView.delegate = self
        self.view.addSubview(loginView)
        
    }
    
    func login() {
        println("logging in!")
        
        self.presentViewController(ItemSearchViewController(), animated: true, completion: nil)
    }
    
    func logout() {
        
    }

}
