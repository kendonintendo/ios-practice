//
//  ViewController.swift
//  Test App
//
//  Created by Kendall Sanford on 7/30/18.
//  Copyright © 2018 Kendall Sanford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createLabel();
        //buildTriangle();
    }
    
    func createLabel(){
        _ = UIView();
        let labelRect = CGRect(x: 20, y: 20, width: 100, height: 100)
        let label = UILabel(frame: labelRect)
        label.text = "Kendall is the best at writting code and you know it! lol this is some more code."
        label.font = UIFont(name: "Helvetica", size: 12.0)
        label.textAlignment = .center
        view.addSubview(label)
        label.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        label.numberOfLines = 5
    }
    
    func buildTriangle(){
        
        let path =  UIBezierPath();
        path.move(to: CGPoint(x: 80, y: 50))
        path.addLine(to: CGPoint(x: 140,y:150))
        path.addLine(to: CGPoint(x: 10, y: 150))
        path.close()
        
        UIColor.green.setFill()
        UIColor.black.setStroke()
        path.fill()
        path.stroke()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

