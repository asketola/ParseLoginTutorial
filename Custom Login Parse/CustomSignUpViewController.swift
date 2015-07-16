//
//  CustomSignUpViewController.swift
//  Custom Login Parse
//
//  Created by Annemarie Ketola on 7/15/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class CustomSignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 105)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: 
    
    @IBAction func signupAction(sender: AnyObject) {
        var email = self.emailField.text
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        if (count(username.utf16) < 4 || count(password.utf16) < 5) {
            
            var alert = UIAlertController(title: "Invalid", message: "Username must be greater than 4 and Password must be greater than 5.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                println("User pressed Ok")
            })
            
            alert.addAction(OKAction)
            self.presentViewController(alert, animated: true, completion: nil)
        
        
        } else if (count(email.utf16) < 8) {
        var alert = UIAlertController(title: "Invalid", message: "Please enter a valid email.", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
        println("User pressed Ok")
        })
        
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
        } else {
            self.actInd.startAnimating()
            var newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = email
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                self.actInd.stopAnimating()
                
                if((error) != nil) {
                    var alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                        println("User pressed Ok")
                    })
                    
                    alert.addAction(OKAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    var alert = UIAlertController(title: "Success", message: "Signed Up", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                        println("User pressed Ok")
                    })
                    
                    alert.addAction(OKAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } // closes else
            }) // closes newUser
        } // closes else
      } // closes the function
    
} // end of the file
