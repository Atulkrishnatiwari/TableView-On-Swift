//
//  MyViewController.swift
//  TableViewProjectSwift
//
//  Created by Celestial on 28/11/23.
//

import UIKit

class MyViewController: UIViewController
{
    var delegate: MyProtocol?
    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
    }

    @IBAction func addUser(_ sender: UIButton) 
    {
        guard let name = userName.text, let address = userAddress.text, let phoneNo = phone.text, let email = emailId.text, let profile = profileName.text else
        {
            return
        }
        
        let user = User(name: name, address: address, phoneNo: phoneNo, emailAddress: email, profile: profile)
        delegate?.addUser(user)
        navigationController?.popViewController(animated: true)
    }
}

