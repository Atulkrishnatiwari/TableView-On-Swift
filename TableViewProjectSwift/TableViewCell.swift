//
//  TableViewCell.swift
//  TableViewProjectSwift
//
//  Created by Celestial on 28/11/23.
//

import UIKit

class TableViewCell: UITableViewCell 
{

    @IBOutlet weak var buttonForDetails: UIButton!
    @IBOutlet weak var labelForName: UILabel!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var labelOfCharacter: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        baseView.layer.cornerRadius = baseView.frame.size.width / 2
        baseView.clipsToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
