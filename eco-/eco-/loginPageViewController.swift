//
//  loginPageViewController.swift
//  eco-
//
//  Created by Guilherme de Brito Hohenfeld on 7/22/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class loginPageViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//Add action to the buttons on the screen
    }
    @IBAction func loginButton(_ sender: UIButton) {
//Requires the user to fill in the username and password text fields
// Activity indicator and segue to homepage
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()

    }
    
    @IBAction func googleLoginButton(_ sender: Any) {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        

    }
//Activity indicator and segue to homepage
    @IBAction func facebookLoginButton(_ sender: Any) {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
//Activity indicator and segue to homepage
    }
}
