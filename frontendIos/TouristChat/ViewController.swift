//
//  ViewController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import UIKit
import SwiftMatrixSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startPress(_ sender: Any) {
        let mxRestClient = MXRestClient(homeServer: URL(string: "http://matrix.org")!,
                                        unrecognizedCertificateHandler: nil)
        mxRestClient.publicRooms(onServer: "http://matrix.org", limit: 100) { response in
            switch response {
                case .success(let rooms):
                    print("The public rooms are: \(rooms)")
                case .failure: break
            }
        }
    }
// rooms is an array of MXPublicRoom objects containing information like room id
}

