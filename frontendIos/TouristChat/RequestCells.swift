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
    @IBOutlet weak var minAge: UITextField!
    
    @IBOutlet weak var maxAge: UITextField!
    
    override func getValue() -> Any {
        return [Int(minAge.text ?? minAge.placeholder!), Int(maxAge.text ?? minAge.placeholder!)]
    }
    
    override func getKey() -> String {
        return "age"
    }
    
    @IBAction func minAgeCange(_ sender: Any) {
        update()
    }
    
    @IBAction func maxAgeChange(_ sender: Any) {
        update()
    }
    
}

class DistanceCell : RequestCell {
    
    let minTime: Float = 5.0
    let maxTime: Float = 500.0
    var dist: Int = 5
    
    override func getValue() -> Any {
        return 60 * dist
    }
    
    override func getKey() -> String {
        return "distance"
    }
    
    @IBOutlet weak var switcher: UISegmentedControl!
    
    @IBOutlet weak var chosenTime: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    func getSliderDist() -> Int {
        return Int(minTime + slider.value * maxTime / slider.maximumValue)
    }
    
    @IBAction func `switch`(_ sender: Any) {
        switch switcher.selectedSegmentIndex {
        case 0:
            dist = 5
        case 1:
            dist = 20
        default:
            dist = getSliderDist()
        }
        chosenTime.text = "\(dist) min"
        update()
    }
    
    @IBAction func slide(_ sender: Any) {
        if (switcher.selectedSegmentIndex == 2) {
            dist = getSliderDist()
            chosenTime.text = "\(dist) min"
            update()
        }
    }
    
    
}

class SexCell : RequestCell {
    static let variants = ["any", "male", "female"]
    
    var index = 0
    
    override func getValue() -> Any {
        return SexCell.variants[index]
    }
    
    override func getKey() -> String {
        return "sex"
    }
    
    @IBOutlet weak var sexSwither: UISegmentedControl!
    
    @IBAction func sexSwitched(_ sender: Any) {
        index = sexSwither.selectedSegmentIndex
        update()
    }
    
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

class FindCell: RequestCell {
    
    @IBAction func find(_ sender: Any) {
        print(requestTableView?.requestMap)
        let searchVc = (requestTableView?.storyboard?.instantiateViewController(withIdentifier: "Results")) as! SearchResultsTable
        searchVc.users = ServerApi.searchRequest(map: (requestTableView?.requestMap)!)
        requestTableView?.navigationController?.pushViewController(searchVc, animated: true)
    }
    
}
