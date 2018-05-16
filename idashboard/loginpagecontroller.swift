//
//  loginpagecontroller.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 24/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit
import FirebaseAuth

class loginpagecontroller: UIViewController {

    @IBOutlet weak var loginbutton: UIButton!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        
       FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
        
        
        if(user != nil){
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let initialViewController2 = storyboard.instantiateViewController(withIdentifier: "dashboard") as! dashboardpage
            
            self.navigationController?.pushViewController(initialViewController2, animated: true)
            
            
        }
        }
      
      
    }
   
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      loginbutton.layer.cornerRadius = 10
        
    
       
    }

   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  

    @IBAction func loginaction(_ sender: Any) {
        let email : String = self.email.text!
        let password: String = self.password.text!
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            
            if(error == nil){
         
            if(user != nil){
                
                self.showToast(message: (user?.email!)!)
                
                FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
                    
                    
                    
                        
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let initialViewController2 = storyboard.instantiateViewController(withIdentifier: "dashboard") as! dashboardpage
                        
                        self.navigationController?.pushViewController(initialViewController2, animated: true)
                        
                        
                    
                }
                
            }
            }else{
                
                self.showToast(message: error.debugDescription)
            }
           
        }

        
    }
    
    
    @IBAction func resetpasswordaction(_ sender: Any) {
        
        let emailtoreset = email.text
        
        if(emailtoreset?.isEmpty)!{
            
            showToast(message: "Pls key in your valid email account")
            
        }else{
            FIRAuth.auth()?.sendPasswordReset(withEmail: emailtoreset!) { error in
                
                if(error == nil){
                    self.showToast(message: "An email to reset your password has been sent")}else{
                    self.showToast(message: error.debugDescription)
                }
        }
        }
    }
    
    
}
