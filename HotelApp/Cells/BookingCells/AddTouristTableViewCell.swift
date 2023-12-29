//
//  AddTouristTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 28.12.2023.
//

import UIKit

class AddTouristTableViewCell: UITableViewCell {
    
    var counter: ((AddTouristTableViewCell) -> Void)?
    
    static let identifier = "AddTouristTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AddTouristTableViewCell", bundle: nil)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addTouristButtonPressed() {
        counter? (self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
