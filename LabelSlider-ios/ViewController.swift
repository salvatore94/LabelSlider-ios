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
    let valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    var touchInsideSliderView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lslider.center = view.center
        lslider.names = ["1/500", "1/250", "1/125", "1/100", "1/50", "1/25", "1/20", "1/15", "1/10", "1/5","1/3"]
        lslider.value = 0
        lslider.ticksDistance = lslider.bounds.width / CGFloat(lslider.tickCount)
        lslider.animationDuration = 0.1
        
        /*
         Per gestire gli eventi di touchedBegan e touchedMove da questa view (ViewController) è necessario disattivare la userInteractionForSubviews per lslider ed attivare la isUserInteractionEnabled per view. A questo punto basta
         sovrascrivere TouchedBegan e TouchedMoved di questa classe (VievController) in modo da richiamare automaticamente i metodi di LabelSlider (che si occupano di gestire i tocchi solo all'intero dei propri confini: in questo modo possiamo gestire le interazioni solamente interne a lslider ed allo stesso tempo possiamo gestire il cambiamento dei valori (selezionati dall'utente)
        */
        //lslider.userInteractionForSubviews = true
        view.isUserInteractionEnabled = true
        
        
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
        if (lslider.frame.contains(touches.first!.location(in: view)) || touchInsideSliderView == true) {
            touchInsideSliderView = true
            lslider.touchesBegan(touches, with: event)
            valueLabel.text = lslider.names[Int(lslider.value)]
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(touchInsideSliderView == true) {
            lslider.touchesMoved(touches, with: event)
            valueLabel.text = lslider.names[Int(lslider.value)]
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(touchInsideSliderView == true) {
            lslider.touchesEnded(touches, with: event)
            valueLabel.text = lslider.names[Int(lslider.value)]
            touchInsideSliderView = false
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touchInsideSliderView == true) {
            lslider.touchesCancelled(touches, with: event)
            valueLabel.text = lslider.names[Int(lslider.value)]
            touchInsideSliderView = false
        }
    }
}
