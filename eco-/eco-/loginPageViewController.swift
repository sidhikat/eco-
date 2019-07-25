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
        if (usernameTextField.text != nil) && (passwordTextField.text != nil){
            func isEnabled() -> Bool{
                return true
            }
        }
        
        
    
        
    
    
  //  @IBAction func loginGoogleButton(_ sender: Any) {





   // @IBAction func loginFacebookButton(_ sender: Any) {


/*let userEmail = userEmailTextField.text
let userPassword = userPasswordTextField.text

let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail")
let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword")

if (userEmailStored == userEmail && userPasswordStored == userPassword) {
    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
    NSUserDefaults.standardUserDefaults().synchronize()
    self.dismissViewControllerAnimated(true, completion: nil)
}
    
else {
    var failAlert = UIAlertController(title: "Alert", message: "Your username or password is incorrect.", preferredStyle: UIAlertControllerStyle.Alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
    failAlert.addAction(okAction)
    self.presentViewController(failAlert, animated: true, completion: nil)
    
}*/

}
}
