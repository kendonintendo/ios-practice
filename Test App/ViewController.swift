//
//  ViewController.swift
//  Test App
//
//  Created by Kendall Sanford on 7/30/18.
//  Copyright © 2018 Kendall Sanford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appMainBackground: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        Background.setToColor(obj: loginBtn, colorName: "black")
        Background.setToColor(obj: registerBtn, colorName: "black")
        Background.setToImage(obj: appMainBackground, imageName: "winter-lake")
        print(appMainBackground.center)
        animateView()
    }
    
    func animateView(){
     
        let duration = 30.0
        UIImageView.animate(withDuration: duration) {
            self.appMainBackground.center.x += 100
        }
    }
}

class Background{
    
    static func setToColor(obj: AnyObject, colorName: String){
        if let view = obj as? UIView{
            
            switch(colorName){
                case "black":
                view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
                break
                default:
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
   static func setToImage(obj: AnyObject, imageName: String){
        
        if let view = obj as? UIImageView{
            view.image = UIImage(named: imageName)
            
        }
    }
}
