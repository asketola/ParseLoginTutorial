//
//  CustomLoginViewController.swift
//  Custom Login Parse
//
//  Created by Annemarie Ketola on 7/15/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class CustomLoginViewController: UIViewController {

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

    @IBAction func loginAction(sender: AnyObject) {
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        if (count(username.utf16) < 4 || count(password.utf16) < 5) {
            
            var alert = UIAlertController(title: "Invalid", message: "Username must be greater than 4 and Password must be greater than 5.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(OKAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            self.actInd.startAnimating()
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
            self.actInd.stopAnimating()
                    if ((user) != nil) {
//                    var alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .Alert)
//                    let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
//                    alert.addAction(OKAction)
//                    CustomLoginViewController.presentViewController(alert, animated: true, completion: nil)
                        self.performSegueWithIdentifier("GET_IN_APP", sender: self)
                        
            } else {
//                        self.alertFail()
                    var alertFail = UIAlertController(title: "Login Error", message: "\(error)", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertFail.addAction(OKAction)
                    self.presentViewController(alertFail, animated: true, completion: nil)
                   } // close else
          })
    }
}



    @IBAction func signupAction(sender: AnyObject) {
        self.performSegueWithIdentifier("SIGNUP", sender: self)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "SHOW_LOGIN_PAGE" {
//            let bikesForSaleVC = segue.destinationViewController as! InTheAppViewController
//        }
//    }
    
    
//    func alertFail() {
//        var alertFail = UIAlertController(title: "Login Error", message: "Either the password or username is incorrect", preferredStyle: .Alert)
//        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
//        alertFail.addAction(OKAction)
//        self.presentViewController(alertFail, animated: true, completion: nil)
//    }
    
    
    
    
    
    
}
