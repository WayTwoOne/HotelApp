//
//  BookingViewController.swift
//  HotelApp
//
//  Created by Vladimir on 28.12.2023.
//

import UIKit

class BookingViewController: UIViewController {

    var booking: Booking?
    private var cellsCounter = 0
    private var touristsCounter: [Int] = [1]
    private var isItHided = false
    private var passFromTourist = true

    @IBOutlet var bookingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(with: LinkForBooking.bookingApi.rawValue)
        
        bookingTableView.delegate = self
        bookingTableView.dataSource = self
        
        bookingTableView.register(InfoAboutHotelTableViewCell.nib(), forCellReuseIdentifier: InfoAboutHotelTableViewCell.identifier)
        bookingTableView.register(BookingInformationTableViewCell.nib(), forCellReuseIdentifier: BookingInformationTableViewCell.identifier)
        bookingTableView.register(InformationAboutByuerTableViewCell.nib(), forCellReuseIdentifier: InformationAboutByuerTableViewCell.identifier)
        bookingTableView.register(TouristTableViewCell.nib(), forCellReuseIdentifier: TouristTableViewCell.identifier)
        bookingTableView.register(AddTouristTableViewCell.nib(), forCellReuseIdentifier: AddTouristTableViewCell.identifier)
        bookingTableView.register(TheFinalPriceTableViewCell.nib(), forCellReuseIdentifier: TheFinalPriceTableViewCell.identifier)
    }
    
    
    @IBAction func moveToFinalVCButtonPressed() {
        bookingTableView.reloadData()
        if passFromTourist == false {
        } else {
            performSegue(withIdentifier: "toFinalViewController", sender: nil)
        }
    }
    
    private func fetchData(with url: String) {
        NetworkManager.shared.fetch(Booking.self, from: url) { [weak self] result in
            switch result {
            case .success(let booking):
                self?.booking = booking
                self?.bookingTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension BookingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return cellsCounter + 1
        } else if section == 3 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 150
                
            } else {
                return 280
            }
        } else if indexPath.section == 1 {
            return 250
            
        } else if indexPath.section == 2 {
            if isItHided {
                return 80
            } else {
                return 450
            }
            
        } else if indexPath.section == 3 {
            return 58
            
        } else if indexPath.section == 4{
            return 195
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: InfoAboutHotelTableViewCell.identifier, for: indexPath) as! InfoAboutHotelTableViewCell
                cell.configur(with: booking)
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: BookingInformationTableViewCell.identifier, for: indexPath) as! BookingInformationTableViewCell
                cell.configur(with: booking)
                
                return cell
            }
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationAboutByuerTableViewCell.identifier, for: indexPath) as! InformationAboutByuerTableViewCell
            return cell
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TouristTableViewCell.identifier, for: indexPath) as! TouristTableViewCell
            isItHided = cell.hideIt
            cell.configur(with: touristsCounter[indexPath.row])
            passFromTourist = cell.moveToPayOrNot()
            cell.color = .red
            
            cell.tryToHide = { [weak self] _ in
                self?.isItHided = cell.hideIt
                tableView.reloadData()
            }
            return cell
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddTouristTableViewCell.identifier, for: indexPath) as! AddTouristTableViewCell
            cell.counter = { [weak self] _ in
                self?.cellsCounter += 1
                self?.touristsCounter.append((self?.cellsCounter ?? 0) + 1 )
                tableView.reloadData()
            }
            return cell
            
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TheFinalPriceTableViewCell.identifier, for: indexPath) as! TheFinalPriceTableViewCell
            cell.configur(with: booking)
            return cell
            
        }
        
        return UITableViewCell()
    }
}
