//
//  ProfileViewController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var user: ServerApi.User? = nil

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var sex: UILabel!
    
    @IBOutlet weak var nameAndSurname: UILabel!
    
    @IBOutlet weak var interests: UITextView!
    
    let picker = UIImagePickerController()

    
    @IBAction func changePhoto(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        picker.delegate = self
        photo.image = user!.photo ?? #imageLiteral(resourceName: "parisImage")
        age.text = "\(user!.age) years old"
        sex.text = "\(user!.sex)"
        nameAndSurname.text = user!.name + " " + user!.secondName
        interests.text = user!.interests
    }
    
    @IBAction func changeInfo(_ sender: Any) {
    }
    
    @IBAction func save(_ sender: Any) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        photo.image = chosenImage //4
        user?.photo = chosenImage
        dismiss(animated:true, completion: nil) //5
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
