//
//  SearchViewController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UITableViewController {
    
    let interests = InterestsCell.variants
    
    let otherParams = ["sex", "age", "distance"]
    
    var requestMap: [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        self.parent?.navigationItem.title = "Search parameters"
        requestMap["sex"] = "any"
        requestMap["age"] = [0, 200]
        requestMap["distance"] = 5
        interests.forEach { it in requestMap[it] = false }
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? otherParams.count : (section == 1 ? interests.count : 1)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "DistanceCell",
                    for: indexPath
                ) as! DistanceCell
                cell.requestTableView = self
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "SexCell",
                    for: indexPath
                ) as! SexCell
                cell.requestTableView = self
                return cell
            default: // case 2
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "AgeCell",
                    for: indexPath
                ) as! AgeCell
                cell.requestTableView = self
                return cell
            }
        } else if (indexPath.section == 1) {
            let interestCell = tableView.dequeueReusableCell(
                withIdentifier: "InterestCell",
                for: indexPath
            ) as! InterestsCell
            interestCell.setInterest(newInterest: InterestsCell.variants[indexPath.row])
            interestCell.requestTableView = self
            return interestCell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "RequestCell",
                for: indexPath
            ) as! FindCell
            cell.requestTableView = self
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 && indexPath.row == 0 ? 150 : 50
    }
    
}
