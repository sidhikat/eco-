//
//  signUpScreen.swift
//  eco-
//
//  Created by Guilherme de Brito Hohenfeld on 7/24/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import CoreData
import UIKit

class signUpScreen: UIViewController {
    //Create the container
    var container:NSPersistentContainer!
    //Label outlets
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    
    
    
    
    //TextField outlets
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        // Do any additional setup after loading the view.
    }
        
}
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        //var userFirstName = firstNameTextField.text
        //Assign variable to the text content of the text field
        var userLastName = lastNameTextField.text
        var userEmailAddress = emailAddressTextField.text
        var userUsername = usernameTextField.text
        var userPassword = passwordTextField.text
        var userPasswordConfirmation = confirmPasswordTextField.text
        //Make sure to take the user's input and store it
        if let temp = firstNameTextField.text{
            var userFirstName = temp
            let userInformation = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: container.viewContext) as! UserInformation
            userInformation.firstName = userFirstName
            try! container.viewContext.save()
        }
        if let temp = lastNameTextField.text {
            var userLastName = temp
            let userInformation = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: container.viewContext) as! UserInformation
            userInformation.lastName = userLastName
            try! container.viewContext.save()
        }
        if let  temp = emailAddressTextField.text{
            var userEmailAddress = temp
            let userInformation = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: container.viewContext) as! UserInformation
            userInformation.emailAddress = userEmailAddress
            try! container.viewContext.save()
        }
        if let temp = usernameTextField.text{
            var userUsername = temp
            let userInformation = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: container.viewContext) as! UserInformation
            userInformation.username = userUsername
            try! container.viewContext.save()
        }
        if let temp = passwordTextField.text {
            var userUsername = temp
            let userInformation = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: container.viewContext) as! UserInformation
            userInformation.password = userPassword
            try! container.viewContext.save()
        }
        
    }
}
