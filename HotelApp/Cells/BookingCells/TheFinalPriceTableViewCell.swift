//
//  TheFinalPriceTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 28.12.2023.
//

import UIKit

class TheFinalPriceTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tourPriceLabel: UILabel!
    @IBOutlet weak var fuelСhargeLabel: UILabel!
    @IBOutlet weak var serviceСhargeLabel: UILabel!
    @IBOutlet weak var finalPriceLabel: UILabel!
    
    
    
    static let identifier = "TheFinalPriceTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TheFinalPriceTableViewCell", bundle: nil)
    }
    
    func configur(with bookin: Booking?) {
        tourPriceLabel.text = String(bookin?.tourPrice ?? 0)
        fuelСhargeLabel.text = String(bookin?.fuelCharge ?? 0)
        serviceСhargeLabel.text = String(bookin?.serviceCharge ?? 0)
        finalPriceLabel.text = String(((bookin?.tourPrice ?? 0) + (bookin?.fuelCharge ?? 0) + (bookin?.serviceCharge ?? 0)))
    }
    
}
