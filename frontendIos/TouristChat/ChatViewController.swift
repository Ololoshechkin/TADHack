//
//  ChatViewController.swift
//  TouristChat
//
//  Created by Vadim on 24/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UITableViewController {
    
    var (myToken, hisToken) = ("", "")
    var messages = [(isMine: Bool, text: String)]()
    var lastMessages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        tableView.allowsSelection = false
        /*let timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: perform(#selector(ChatViewController.updateMessages),
                              with: nil,
                              afterDelay: 0.3
            ),
            userInfo: nil,
            repeats: true
        )*/
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : section == 1 ? messages.count : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            return UITableViewCell()
        } else if (indexPath.section == 1) {
            let (isMine, text) = messages[indexPath.row]
            if (isMine) {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "MyMsg",
                    for: indexPath
                ) as! MyMessageCell
                cell.label.text = text
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "HisMsg",
                    for: indexPath
                    ) as! HisMessageCell
                cell.label.text = text
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "SendButtonCell",
                for: indexPath
            ) as! SendButtonCell
            cell.tableView = self
            return cell
        }
    }
    
    func addMyMessage(text: String) {
        messages.append((isMine: true, text: text))
        lastMessages.append(text)
        tableView.reloadData()
    }
    
    @objc func updateMessages() {
        ServerApi.addMyMessages(messages: lastMessages)
        lastMessages = [String]()
        ServerApi.getHisMessages(postAction: { hisMessages in
            hisMessages.forEach { text in
                self.messages.append((isMine: false, text: text))
            }
            if (hisMessages.count != 0) {
                self.tableView.reloadData()
            }
        })
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
        return CGFloat(indexPath.section == 0 ? 70 * max(0, 7 - messages.count) : indexPath.section == 1 ? 70 : 150)
    }
}
