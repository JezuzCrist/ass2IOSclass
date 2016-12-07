//
//  enterNameView.swift
//  assiment2
//
//  Created by macDevMachinVB on 06/12/2016.
//  Copyright © 2016 macDevMachinVB. All rights reserved.
//

import UIKit

protocol enterNameDelegate {
    func onSave(username:String)->Void
    func nextScreen()->Void
}

class enterNameView: UIViewController {
    var delegate:enterNameDelegate?
    
    @IBOutlet weak var slidetText: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var sliderValue:String?{
        didSet{
            if(self.slidetText != nil){
                self.slidetText.text = self.sliderValue
                
            }
        }
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextPressed(_ sender: Any) {
        if(self.delegate != nil){
            self.delegate?.nextScreen()
            self.dismiss(animated: true, completion: self.delegate?.nextScreen)
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if(self.delegate != nil){
            self.delegate?.onSave(username:self.usernameTextField.text!)
        }
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        if(sliderValue != nil){
            self.slidetText.text = sliderValue
        }
    }
    
}
