//
//  BookingInformationTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 27.12.2023.
//

import UIKit

class BookingInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var arravingCountry: UILabel!
    @IBOutlet weak var tourDates: UILabel!
    @IBOutlet weak var numberOfNights: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var nutrition: UILabel!
    
    static let identifier = "BookingInformationTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BookingInformationTableViewCell", bundle: nil)
    }

    func configur(with booking: Booking?) {
        departure.text = booking?.departure
        arravingCountry.text = booking?.arrivalCountry
        tourDates.text = "\(booking?.tourDateStart ?? "") - \(booking?.tourDateStop ?? "")"
        numberOfNights.text = "\(booking?.numberOfNights ?? 0)"
        room.text = booking?.room
        nutrition.text = booking?.nutrition
    }
    
}
