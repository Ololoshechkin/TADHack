//
//  RequestSell.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class RequestCell : UITableViewCell {
    var requestTableView: SearchViewController? = nil
    public func getKey() -> String {
        return ""
    }
    public func getValue() -> Any {
        return ""
    }
    
    func update() {
        requestTableView?.requestMap[getKey()] = getValue()
    }
}

class AgeCell : RequestCell {
    
}

class DistanceCell : RequestCell {
    
}

class SexCell : RequestCell {
    static let variants = ["male", "female", "any"]
    
    
}

class InterestsCell : RequestCell {
    static let variants = ["visiting showplaces", "sport", "walking", "bike", "museums", "theaters", "cinema", "music", "pubs"]
    
    private var interest: String? = nil
    
    func setInterest(newInterest: String) {
        interest = newInterest
        interestLabel.text = newInterest
    }
    
    override func getValue() -> Any {
        return checkBox.isOn
    }
    
    override func getKey() -> String {
        return interest!
    }
    
    @IBOutlet weak var checkBox: UISwitch!
    
    @IBOutlet weak var interestLabel: UILabel!
    
    @IBAction func checkBoxPress(_ sender: Any) {
        update()
    }
    
}

