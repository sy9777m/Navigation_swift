//
//  ViewController.swift
//  Navigation
//
//  Created by Siyun Min on 2020/07/12.
//  Copyright © 2020 Siyun Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let imgOn = UIImage(named: "1.jpg")
    let imgOff = UIImage(named: "2.jpg")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use button"
            
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "seque: use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }

    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

