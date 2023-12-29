//
//  TryOneTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 27.12.2023.
//

import UIKit

class InfoAboutHotelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAndRating: UIStackView! {
        didSet {
            imageAndRating.backgroundColor = UIColor(red: 255, green: 199, blue: 0, alpha: 0.2)
        }
    }
    @IBOutlet weak var ratingLabel: UILabel! {
        didSet {
            ratingLabel.textColor = UIColor(red: 255, green: 168, blue: 0, alpha: 1.0)
        }
    }
    @IBOutlet weak var adressLabel: UIButton!
    
    
    static let identifier = "InfoAboutHotelTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "InfoAboutHotelTableViewCell", bundle: nil)
    }

    func configur(with booking: Booking?) {
        ratingLabel.text = "\(booking?.horating ?? 0) \(booking?.ratingName ?? "")"
        adressLabel.titleLabel?.text = booking?.hotelAdress
    }
    
}
