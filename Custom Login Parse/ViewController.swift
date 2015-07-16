//
//  ViewController.swift
//  Custom Login Parse
//
//  Created by Annemarie Ketola on 7/15/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var logInViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil) {
            self.logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.DismissButton
            
            var logInLogoTitle = UILabel()
            logInLogoTitle.text = "UpEarly Software"
            self.logInViewController.logInView!.logo = logInLogoTitle
            self.logInViewController.delegate = self
            
            var signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "UpEarly Software"
            self.signUpViewController.signUpView!.logo = signUpLogoTitle
            self.signUpViewController.delegate = self
            self.logInViewController.signUpController = self.signUpViewController
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Parse Login
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        // check to make sure the login isn't empty
        if (!username.isEmpty || !password.isEmpty) {
           return true
        } else {
         return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("Failed to Login")
    }
    
    // Mark: Parse Sign Up
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("Failed to sign up ")
    }

    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("USer dismissed sign up")
    }
    
    // MARK: Actions
    
    @IBAction func simpleAction(sender: AnyObject) {
        self.presentViewController(self.logInViewController, animated: true, completion: nil)
    }
    
    @IBAction func customAction(sender: AnyObject) {
        self.performSegueWithIdentifier("CUSTOM", sender: self)
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        PFUser.logOut()
    }
    
}

