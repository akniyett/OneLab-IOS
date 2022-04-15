//
//  CustomCellTableViewCell.swift
//  TableViewController
//
//  Created by Akniyet Turdybay on 29.03.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var studentName: UILabel!
    
    @IBOutlet weak var studentPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
