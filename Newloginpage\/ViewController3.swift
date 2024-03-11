//
//  ViewController3.swift
//  Newloginpage
//
//  Created by R92 on 12/02/24.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var usertextfiled: UITextField!
    
    @IBOutlet weak var emailtextfield: UITextField!
    
    @IBOutlet weak var mobiletextfield: UITextField!
    
    
    @IBOutlet weak var passwodtextfieldoutlet: UITextField!
    
    
    @IBOutlet weak var chekpasswordtextfieldoutlet: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sqlitehelper.creatfile()
        
    }
    
    
    @IBAction func deleteDataactionbutton(_ sender: Any) {
        sqlitehelper.DeleteData(Email: emailtextfield.text ?? "")
    }
    @IBAction func adddatabutonaction(_ sender: Any) {
        sqlitehelper.addData(Email: emailtextfield.text ?? "", password: passwodtextfieldoutlet.text ?? "" )
        if (emailtextfield.text == "" && passwodtextfieldoutlet.text == "")
        {
            alert(title: "alert", message: "please enter email and password")
        }
        
        else if (passwodtextfieldoutlet.text != chekpasswordtextfieldoutlet.text)
        {
            alert(title: "alert", message: "please enter write password")
        }
        else
        {
            alert(title: "signup successful", message: "your sign up done please login your account")
            naviget()
        }
    }
    func alert(title:String,message:String){
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "ok", style: .cancel,handler:
                                    { _ in
            let c = self.storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
            
            self.navigationController?.pushViewController(c, animated: true)
            
        }))
        
        
        a.addAction(UIAlertAction(title: "cancle", style: .destructive))
        
        present(a, animated: true)
    }
    
    
    func naviget(){
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    @IBAction func loginpagebuttonaction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    
    
    @IBAction func backbuttonaction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
}





