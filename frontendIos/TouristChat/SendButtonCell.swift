//
//  SendButtonCell.swift
//  TouristChat
//
//  Created by Vadim on 24/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class SendButtonCell : UITableViewCell {
    
    var tableView: ChatViewController? = nil
    
    @IBOutlet weak var textbox: UITextView!
    
    var first = true
    
    @IBAction func send(_ sender: Any) {
       // if (!first) {
        tableView!.addMyMessage(text: textbox.text)
        textbox.text = ""
        Timer.scheduledTimer(
            withTimeInterval: 2,
            repeats: false,
            block: { timer in self.tableView!.updateMessages()}
        )//} else {
        //first = false
        //}
    }
    
}
