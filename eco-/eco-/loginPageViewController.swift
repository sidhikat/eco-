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
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        //create a container for CoreData
        container = appDelegate.persistentContainer
        guard container != nil else {
            fatalError("This view needs a persistent container.")
            // Do any additional setup after loading the view.
            //let appDelegate = UIApplication.shared.delegate as! AppDelegate
            //let context = appDelegate.persistentContainer.viewContext
        }
        loginBtn.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
//Add action to the buttons on the screen
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the SECOND view controller
        if  let secondViewController = segue.destination as? signUpScreen {
            // set a variable in the SECOND view controller with the String to pass
            secondViewController.container = self.container
        }
        if  let secondViewController = segue.destination as? WelcomePageViewController {
            // set a variable in the SECOND view controller with the String to pass
            secondViewController.container = self.container
        }
    }
    
    
    
  
    @IBAction func loginButton(_ sender: Any) {
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "UserInformation")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: itemsFetchRequest)
//        try! container.persistentStoreCoordinator.execute(deleteRequest , with: container.viewContext)
        let fetchedUser = try! container.viewContext.fetch(itemsFetchRequest) as! [UserInformation]
        print(fetchedUser.count)
        for i in fetchedUser {
            if (usernameTextField.text == i.username) && (passwordTextField.text == i.password) {
                //perform segue to welcome page when valid username and password is entered
                appDelegate.currentName = i.firstName!
                performSegue(withIdentifier: "welcomePageSegue", sender: self)
            }
        }
        
       let alert = UIAlertController(title: "Username and password don't match", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
                
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
   /*         if usernameTextField.text == i.username {
                if passwordTextField.text != i.password {
                    let alert = UIAlertController(title: "Username and password don't match", message: "Please, try again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                    }
                else {
                    let alert = UIAlertController(title: "Login succesfull", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
                }
            else {
                let alert = UIAlertController(title: "Username and password don't match", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }

        }*/
    
/*let alert = UIAlertController(title: "Login succesfull", message: "", preferredStyle: .alert)
alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
    NSLog("The \"OK\" alert occured.")
}))
self.present(alert, animated: true, completion: nil)*/

        
            
    //@IBAction func loginGoogleButton(_ sender: Any) {
    
    //@IBAction func loginFacebookButton(_ sender: Any) {

    
        
        
    
    




        }

}
