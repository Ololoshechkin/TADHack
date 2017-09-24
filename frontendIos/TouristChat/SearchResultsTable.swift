//
//  SearchResultsTable.swift
//  TouristChat
//
//  Created by Vadim on 24/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class SearchResultsTable: UITableViewController {
    
    var users = [ServerApi.UserSmall]()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        self.navigationItem.title = "Search results"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "UserCell",
            for: indexPath
        ) as! SearchResultCell
        let user = users[indexPath.row]
        cell.photo.image = user.photo ?? #imageLiteral(resourceName: "parisImage")
        cell.nameSurname.text = user.name + " " + user.secondName
        cell.age.text = "\(user.age) years old"
        cell.sex.text = user.sex
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messageComposer = MessagesViewControllr()
        if (messageComposer.canSendText()) {
            let messageComposeVC = messageComposer.configuredMessageComposeViewController()
            present(messageComposeVC, animated: true, completion: nil)
        } else {
            let errorAlert = UIAlertView(title: "Cannot Send Text Message", message: "Your device is not able to send text messages.", delegate: self, cancelButtonTitle: "OK")
            errorAlert.show()
        }
    }
    
}
