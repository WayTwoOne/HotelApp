//
//  HotelViewController.swift
//  HotelApp
//
//  Created by Vladimir on 25.12.2023.
//

import UIKit

class HotelViewController: UIViewController {
    
    private var hotel: Hotel?
    private var hotelNameFromHotelVC = String()
    
    @IBOutlet weak var hotelTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(with: LinkForHotel.hotelApi.rawValue)
        
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        
        hotelTableView.register(BasicDataAboutHotelTableViewCell.nib(), forCellReuseIdentifier: BasicDataAboutHotelTableViewCell.identifier)
        hotelTableView.register(DetailsAboutHotelTableViewCell.nib(), forCellReuseIdentifier: DetailsAboutHotelTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let roomsVC = segue.destination as? RoomsTableViewController else { return }
        roomsVC.hotelNameToRoomsVC = hotelNameFromHotelVC
    }

    private func fetchData(with url: String) {
        NetworkManager.shared.fetch(Hotel.self, from: url) { [weak self] result in
            switch result {
            case .success(let hotel):
                self?.hotel = hotel
                self?.hotelTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension HotelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 429
        } else if indexPath.section == 1 {
            return 350
        } else {
            return 50
        }
            
    }
    
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicDataAboutHotelTableViewCell.identifier, for: indexPath) as! BasicDataAboutHotelTableViewCell
            cell.hotel = hotel
            cell.configur(with: hotel)
            hotelNameFromHotelVC = cell.hotelNameLabel.text ?? ""
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailsAboutHotelTableViewCell.identifier, for: indexPath) as! DetailsAboutHotelTableViewCell
            cell.configur(from: hotel?.aboutTheHotel)
            cell.hotelDescription.text = hotel?.aboutTheHotel.description
            return cell
            
        }
    }
}
