//
//  MessagesViewController.swift
//  TouristChat
//
//  Created by Vadim on 24/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

let textMessageRecipients = ["keker"] // for pre-populating the recipients list (optional, depending on your needs)


class MessagesViewControllr: NSObject, MFMessageComposeViewControllerDelegate {
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    // Configures and returns a MFMessageComposeViewController instance
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self as! MFMessageComposeViewControllerDelegate  //  Make sure to set this property to self, so that the controller can be dismissed!
        messageComposeVC.recipients = textMessageRecipients
        messageComposeVC.body = "Hey friend - Just sending a text message in-app using Swift!"
        return messageComposeVC
    }
    
    // MFMessageComposeViewControllerDelegate callback - dismisses the view controller when the user is finished with it
    func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
