//
//  ViewController.swift
//  Newloginpage\
//
//  Created by R92 on 12/02/24.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var imageoutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func backbuttonaction(_ sender: Any) {
        
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController3") as! ViewController3
        
        navigationController?.popViewController(animated: true)
        
    }
}

