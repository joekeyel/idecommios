//
//  ragistrationctrl.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 25/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit
import FirebaseAuth

class ragistrationctrl: UIViewController {
    
    
    @IBOutlet weak var emailinput: UITextField!
    
    @IBOutlet weak var passwordinput: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func actionbutton(_ sender: Any) {
        
        let email : String = self.emailinput.text!
        let password: String = self.passwordinput.text!
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            
            if(error != nil){
            print(error.debugDescription)
            }
            else{
                print(user?.email)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
}
