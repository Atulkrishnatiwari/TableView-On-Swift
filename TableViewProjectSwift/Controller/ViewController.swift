//
//  ViewController.swift
//  TableViewProjectSwift
//
//  Created by Celestial on 28/11/23.
//

import UIKit

class ViewController: UIViewController 
{
    @IBOutlet weak var profileview: UILabel!
    @IBOutlet weak var phoneView: UILabel!
    @IBOutlet weak var emailView: UILabel!
    @IBOutlet weak var adressView: UILabel!
    @IBOutlet weak var nameView: UILabel!
    
    var person:User?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let person = person
        {
            self.navigationItem.title = person.name.uppercased()
        }
        detailsOfUser()
    }
    func detailsOfUser()
    {
            if let person = person 
        {
                nameView.text = person.name
                adressView.text = person.address
                emailView.text = person.emailAddress
                phoneView.text = person.phoneNo
                profileview.text=person.profile
        }
    }
}

