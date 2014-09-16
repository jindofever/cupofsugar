//
//  LocalityView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/14/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

class LocalityView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let termsList = ["cup of sugar", "bar of chocolate", "stick of butter", "gallon of milk", "clove of garlic", "stick of cinnamon", "bottle of wine"]
        
        let termLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        termLabel.font = UIFont(name: "GeosansLight", size: 50)
        termLabel.text = termsList[0]
        termLabel.textColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        termLabel.sizeToFit()
        termLabel.center.x = self.center.x
        termLabel.textAlignment = .Center
        
        var i = 0
        
        UIView.animateWithDuration(5, delay: 0, options: .Autoreverse | .Repeat, animations: { () -> Void in
            termLabel.alpha = 0.0
            }, completion: {(completed: Bool) -> Void in
                i = (i + 1) % termsList.count
                termLabel.text = termsList[i]
        })
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


