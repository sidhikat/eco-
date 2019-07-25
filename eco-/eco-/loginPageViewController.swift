//
//  loginPageViewController.swift
//  eco-
//
//  Created by Guilherme de Brito Hohenfeld on 7/22/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData


class loginPageViewController: UIViewController {
    var container: NSPersistentContainer!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
            // Do any additional setup after loading the view.
        }
        // Do any additional setup after loading the view.

//Add action to the buttons on the screen
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the SECOND view controller
        if  let secondViewController = segue.destination as? signUpScreen {
            // set a variable in the SECOND view controller with the String to pass
            secondViewController.container = self.container
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
//Requires the user to fill in the username and password text fields
// Activity indicator and segue to homepage
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        
        
    }
    
    @IBAction func googleLoginButton(_ sender: Any) {
        
        
        

    }
//Activity indicator and segue to homepage
    @IBAction func facebookLoginButton(_ sender: Any) {
        
//Activity indicator and segue to homepage
    }
}
