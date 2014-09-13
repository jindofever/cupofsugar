//
//  LoginView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func login()
    func logout()
}

class LoginView: UIView {

    var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(image: UIImage(named: "background"))
        backgroundImage.frame = self.bounds
        
        let nameFirst = UILabel(frame: CGRect(x: 62, y: 30, width: 10, height: 10))
        nameFirst.font = UIFont(name: "BebasNeueLight", size: 100)
        nameFirst.text = "CUP OF"
        nameFirst.textColor = UIColor.blackColor()
        nameFirst.sizeToFit()
        nameFirst.center.x = self.center.x
        nameFirst.textAlignment = .Center
        
        let nameSecond = UILabel(frame: CGRect(x: 62, y: 110, width: 10, height: 10))
        nameSecond.font = UIFont(name: "BebasNeueBold", size: 100)
        nameSecond.text = "SUGAR"
        nameSecond.textColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        nameSecond.sizeToFit()
        nameSecond.center.x = self.center.x
        nameSecond.textAlignment = .Center
        
        let usernameFieldImage = UIImage(named: "username-field")
        let usernameFieldBackground = UIImageView(image: usernameFieldImage)
        usernameFieldBackground.frame = CGRect(x: 0, y: 200, width: usernameFieldImage.size.width/2, height: usernameFieldImage.size.height/2)
        
        let usernameField = UITextField(frame: CGRect(x: 82.5, y: 207, width: 250, height: 55))
        usernameField.backgroundColor = UIColor.clearColor()
        usernameField.font = UIFont(name: "GeosansLight", size: 35)
        usernameField.textColor = UIColor.blackColor()
        usernameField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSFontAttributeName: UIFont(name: "GeosansLight", size: 35), NSForegroundColorAttributeName : UIColor(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1.0)])
        
        let passwordFieldImage = UIImage(named: "password-field")
        let passwordFieldBackground = UIImageView(image: passwordFieldImage)
        passwordFieldBackground.frame = CGRect(x: 0, y: 265, width: passwordFieldImage.size.width/2, height: passwordFieldImage.size.height/2)
        
        let passwordField = UITextField(frame: CGRect(x: 82.5, y: 272, width: 250, height: 55))
        passwordField.secureTextEntry = true
        passwordField.font = UIFont(name: "GeosansLight", size: 35)
        passwordField.textColor = UIColor.blackColor()
        passwordField.backgroundColor = UIColor.clearColor()
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSFontAttributeName: UIFont(name: "GeosansLight", size: 35), NSForegroundColorAttributeName : UIColor(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1.0)])
        
        let loginButton = UIButton()
        loginButton.setTitle("Log in", forState: .Normal)
        loginButton.frame = CGRect(x: 225, y: 410, width: 10, height: 10)
        loginButton.titleLabel!.textAlignment = .Center
        loginButton.setTitleColor(UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0), forState: .Normal)
        loginButton.setTitleColor(UIColor(red: 250/255.0, green: 197/255.0, blue: 100/255.0, alpha: 1.0), forState: .Highlighted)
        loginButton.titleLabel!.font = UIFont(name: "GeosansLight", size: 50)
        loginButton.sizeToFit()
        loginButton.center.x = self.center.x
        loginButton.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(backgroundImage)
        self.addSubview(nameFirst)
        self.addSubview(nameSecond)
        
        self.addSubview(usernameFieldBackground)
        self.addSubview(usernameField)
        
        self.addSubview(passwordFieldBackground)
        self.addSubview(passwordField)
        
        self.addSubview(loginButton)
    }

    func login() {
        self.delegate?.login()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
