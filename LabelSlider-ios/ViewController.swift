//
//  ViewController.swift
//  LabelSlider-ios
//
//  Created by Salvatore  Polito on 28/06/17.
//  Copyright © 2017 Salvatore  Polito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let lslider = LabelSlider(frame: CGRect(x: 0, y: 0, width: 360, height: 20))
    let valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isUserInteractionEnabled = true
        lslider.center = view.center
        lslider.names = ["1/500", "1/250", "1/125", "1/100", "1/50", "1/25", "1/20", "1/15", "1/10", "1/5","1/3"]
        lslider.value = 0
        lslider.ticksDistance = lslider.bounds.width / CGFloat(lslider.tickCount)
        //lslider.userInteractionForSubviews = true
        
        //too many names for portrait orientation
        lslider.rotationAngle = CGFloat.pi / 2
        
        // Graphic tuning
        lslider.emphasisLayout = 4
        lslider.upFontSize = 15
        lslider.downFontSize = 13
        lslider.downFontColor = UIColor.gray
        lslider.upFontColor = UIColor.yellow
        
        
        view.addSubview(lslider)
        
        
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textLabel.center = CGPoint(x: view.center.x, y: view.center.y + 120)
        textLabel.textAlignment = .center
        textLabel.textColor = .white
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.text = "Valore selezionato"
        view.addSubview(textLabel)
        
        
        valueLabel.center = CGPoint(x: view.center.x, y: view.center.y + 160)
        valueLabel.textAlignment = .center
        valueLabel.textColor = .yellow
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.text = lslider.names[Int(lslider.value)]
        
        view.addSubview(valueLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lslider.touchesBegan(touches, with: event)
        valueLabel.text = lslider.names[Int(lslider.value)]
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lslider.touchesMoved(touches, with: event)
        valueLabel.text = lslider.names[Int(lslider.value)]
    }
}

