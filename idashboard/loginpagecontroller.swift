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
        
        print(user?.email!)
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
           
            
        }

        
    }
    
    
    func gotodashboardpage(){
        
        
        
        
        
    }
    
}
