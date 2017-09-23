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
        requestMap["sex"] = "any"
        requestMap["age"] = [0, 200]
        requestMap["distance"] = "500m"
        interests.forEach { it in requestMap[it] = false }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? otherParams.count : interests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let currentCell = tableView.dequeueReusableCell(
            withIdentifier: "CourseInfo",
            for: indexPath
            ) as! CellCoursesList
        if (coursesList.count <= indexPath.row) {
            currentCell.clear()
            loadCellsBucket()
        } else {
            currentCell.name.text = coursesList[indexPath.row].name
            currentCell.summary.text = coursesList[indexPath.row].summary
            currentCell.cover.image = #imageLiteral(resourceName: "StepikLogo")
            DataLoader.loadImage(
                byUrl: coursesList[indexPath.row].coverPath,
                postAction: { [weak self](loadedImage) in
                    if let visibleCell = self?.tableView.cellForRow(at: indexPath) {
                        (visibleCell as! CellCoursesList).cover.image = loadedImage
                    }
                }
            )
            
        }*/
        if (indexPath.section == 0) {
            switch indexPath.row {
            case 0:
                return tableView.dequeueReusableCell(
                    withIdentifier: "DistanceCell",
                    for: indexPath
                ) as! DistanceCell
            case 1:
                return tableView.dequeueReusableCell(
                    withIdentifier: "SexCell",
                    for: indexPath
                ) as! SexCell
            default: // case 2
                return tableView.dequeueReusableCell(
                    withIdentifier: "AgeCell",
                    for: indexPath
                ) as! AgeCell
            }
        } else {
            let interestCell = tableView.dequeueReusableCell(
                withIdentifier: "InterestCell",
                for: indexPath
            ) as! InterestsCell
            interestCell.setInterest(
                newInterest: InterestsCell.variants[indexPath.row - otherParams.count]
            )
            return interestCell
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
}
