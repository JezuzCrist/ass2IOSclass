//
//  likeIOSView.swift
//  assiment2
//
//  Created by macDevMachinVB on 06/12/2016.
//  Copyright © 2016 macDevMachinVB. All rights reserved.
//

import UIKit


protocol likeIOSDelegate {
    func onSaveLike(like:Bool)->Void
}

class likeIOSView: UIViewController {
    @IBOutlet weak var likeSwitch: UISwitch!
    @IBOutlet weak var sliderText: UILabel!
    
    var delegate:likeIOSDelegate?
    
    
    var likeValue:Bool = false {
        didSet{
            if(self.likeSwitch != nil){
                self.likeSwitch.isOn = likeValue
            }
        }
    }
    
    var sliderValue:String?{
        didSet{
            if(self.sliderText != nil){
                self.sliderText.text = self.sliderValue
                
            }
        }
    }
    
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func savePressed(_ sender: UIButton) {
        if(self.delegate != nil){
            print("insde like page")
            self.delegate?.onSaveLike(like: self.likeValue)
        }
    }
    
    @IBAction func switchToggeled(_ sender: Any) {
        self.likeValue = likeSwitch.isOn
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        if(sliderValue != nil){
            self.sliderText.text = sliderValue
        }
        if(likeSwitch != nil){
            self.likeSwitch.isOn = self.likeValue
        }
    }
    
}
