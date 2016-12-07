//
//  ViewController.swift
//  assiment2
//
//  Created by macDevMachinVB on 06/12/2016.
//  Copyright © 2016 macDevMachinVB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, enterNameDelegate,likeIOSDelegate{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueDisplay: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var likeSwitch: UISwitch!

    var username:String?
    var dosLike:Bool = false
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        self.sliderValueDisplay.text = String(slider.value);
        
    }
    @IBAction func showEnterNamePage(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let enterNameController = storyboard.instantiateViewController(withIdentifier: "enterName") as! enterNameView
        
        enterNameController.sliderValue = String(self.slider.value)
        enterNameController.delegate = self
        self.present(enterNameController,animated: true, completion: nil)
        
        
    }
    @IBAction func showLikeIOS(_ sender: Any) {
        self.showLikeIOSScreen()
    }
    
    func showLikeIOSScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let likeIOSController = storyboard.instantiateViewController(withIdentifier: "likeIOS") as! likeIOSView
        
        likeIOSController.sliderValue = String(self.slider.value)
        likeIOSController.likeValue = self.dosLike
        likeIOSController.delegate = self
        self.present(likeIOSController,animated: true, completion: nil)
    }
    func onSave(username: String) {
        self.username = username
        if(self.username != nil){
            self.usernameText.text = self.username
        }
    }
    func onSaveLike(like: Bool) {
        print("on save like ")
        print(like)
            self.dosLike = like
            self.likeSwitch.isOn = dosLike
    }
    func nextScreen() {
        self.showLikeIOSScreen()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

