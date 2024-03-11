//
//  ViewController2.swift
//  Newloginpage
//
//  Created by R92 on 12/02/24.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    
    var array = [userData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sqlitehelper.creatfile()
        sqlitehelper.GetData()
        array = sqlitehelper.array
        print(array)
    }
    
    @IBAction func loginbuttonaction(_ sender: Any) {
        var userFound = false
        for i in array {
            if emailtextfield.text == i.email && passwordtextfield.text == i.password{
                userFound = true
                break
            }
        }
        
        if userFound == true {
            navigate()
        }
        else {
            alert(title: "alert", message: "your email and password not found please ragister your account")
        }
    }
    
    func navigate() {
        let b = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(b, animated: true)
    }
    
    func alert (title:String,message:String)
    {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "ok", style: .cancel, handler:
                                    { _ in
            let c = self.storyboard?.instantiateViewController(identifier: "ViewController3") as! ViewController3
            
            self.navigationController?.pushViewController(c, animated: true)
            
        }))
        a.addAction(UIAlertAction(title: "cancle", style: .destructive))
        present(a,animated: true)
    }
    
    
    
    
    @IBAction func backbuttonaction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "Firstpage") as! Firstpage
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signupbuttonaction(_ sender: Any) {
        let a = storyboard?.instantiateViewController(identifier: "ViewController3") as! ViewController3
        
        navigationController?.pushViewController(a, animated: true)
        
    }
}




