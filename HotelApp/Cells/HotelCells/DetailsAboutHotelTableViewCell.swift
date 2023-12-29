//
//  DetailsAboutHotelTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 25.12.2023.
//

import UIKit

class DetailsAboutHotelTableViewCell: UITableViewCell {
    
    @IBOutlet var peculiarities: [UILabel]! {
        didSet {
            peculiarities.forEach { label in
                label.textColor = .gray
            }
        }
    }
    @IBOutlet weak var hotelDescription: UILabel!
    @IBOutlet var specificationButtons: [UIButton]! {
        didSet {
            specificationButtons.forEach { button in
                button.titleLabel?.textColor = .black
                button.subtitleLabel?.textColor = .gray
            }
        }
    }
    
    func configur(from aboutTheHotel: AboutTheHotel?) {
        hotelDescription.text = aboutTheHotel?.description
        
        for i in 0..<peculiarities.count  {
            for _ in 0..<(aboutTheHotel?.peculiarities.count ?? 1) {
                peculiarities[i].text = aboutTheHotel?.peculiarities[i]
            }
        }
    }
    
    
    static let identifier = "DetailsAboutHotelTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DetailsAboutHotelTableViewCell", bundle: nil)
    }
    
}
