//
//  LoginViewController.swift
//  Parsetagram
//
//  Created by Yunior Sanchez on 10/14/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground:username, password:password) {
          (user, error) in
          if user != nil {
            // Do stuff after successful login.
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else {
            // The login failed. Check error to see why.
              print("Error: \(error?.localizedDescription)")
          }
        }
    }
    
    @IBAction func onSingUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
//          user.email = "email@example.com"
//          // other fields can be set just like with PFObject
//          user["phone"] = "415-392-0202"
        user.signUpInBackground { (success, error)in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
