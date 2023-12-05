//
//  SecondViewController.swift
//  TableViewProjectSwift
//
//  Created by Celestial on 29/11/23.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,MyProtocol
{
    func addUser(_ user: User)
    {
        receivedUserList.append(user)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelForEmpty: UILabel!
    @IBOutlet weak var viewToshow: UIView!
    var receivedUserList: [User] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(receivedUserList.count>0)
        {
            return receivedUserList.count
        }
        else
        {
            return 0
        }
    }
    
    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Save", for: indexPath) as? TableViewCell else
        {
            fatalError("Failed to dequeue the expected cell type.")
        }
        if(receivedUserList.count>0)
        {
            cell.labelForName.text = receivedUserList[indexPath.row].name
            let title = passStringAndReceiveTwoCharacter(names: receivedUserList[indexPath.row].name)
            cell.labelOfCharacter.text=title
            viewToshow.isHidden=true
            
            cell.buttonForDetails.tag = indexPath.row // Assign the row index as the tag
            cell.buttonForDetails.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
        else
        {
            viewToshow.isHidden=false
            labelForEmpty.text="User List is Empty!!!"
        }
        return cell
    }
    //MARK: -Button Action for Show Details
    @objc func buttonTapped(_ sender: UIButton)
    {
        let rowIndex = sender.tag
        let selectedUser = receivedUserList[rowIndex]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              if let vC = storyboard.instantiateViewController(withIdentifier: "VC") as? ViewController
              {
                  vC.person=selectedUser
                  navigationController?.pushViewController(vC, animated: true)
              }
        print("Button tapped for user: \(selectedUser.name)")
    }

    
    
    //MARK: -Button Action To Add user
    @IBAction func addUserView(_ sender: UIBarButtonItem)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mvc = storyboard.instantiateViewController(withIdentifier: "Mvc") as? MyViewController
        {
            mvc.delegate = self
            navigationController?.pushViewController(mvc, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    func passStringAndReceiveTwoCharacter( names: String) -> String?
    {
        if names.isEmpty 
        {
            return nil
        }
        let words = names.components(separatedBy: " ")
        if(words.count==1)
        {
            return String(words.first?.prefix(1) ?? "").uppercased()
        }
        else
        {
            let firstCharacter = String(words.first?.prefix(1) ?? "")
            let lastWord = words.last?.trimmingCharacters(in: .punctuationCharacters) ?? ""
            let lastWordFirstCharacter = String(lastWord.prefix(1))
            
            let resultString = firstCharacter + lastWordFirstCharacter
            return resultString.uppercased()
        }
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if(editingStyle == .delete)
        {
            print("Deleted")
            
            self.receivedUserList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            if(receivedUserList.isEmpty)
            {
                viewToshow.isHidden=false
                labelForEmpty.text="User List is Empty!!!"
            }
            else
            {
                viewToshow.isHidden=true
            }
        }
    }
}
