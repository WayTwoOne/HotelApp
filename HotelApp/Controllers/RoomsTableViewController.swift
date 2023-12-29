//
//  RoomsTableViewController.swift
//  HotelApp
//
//  Created by Vladimir on 26.12.2023.
//

import UIKit

class RoomsTableViewController: UITableViewController {
    
    
    var hotelRooms: HotelRooms?
    var hotelNameToRoomsVC = String()
    
    
    @IBOutlet weak var backToHotelButton: UIBarButtonItem!
    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var hotelNameNavigationTitle: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(with: LinkForRooms.roomApi.rawValue)
        hotelNameNavigationTitle.title = hotelNameToRoomsVC
        
        roomTableView.delegate = self
        roomTableView.dataSource = self
        
        roomTableView.register(RoomTableViewCell.nib(), forCellReuseIdentifier: RoomTableViewCell.identifier)
    }

   
    @IBAction func backToHotelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hotelRooms?.rooms.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        580
    }
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomTableViewCell.identifier, for: indexPath) as! RoomTableViewCell
        cell.rooms = hotelRooms?.rooms[indexPath.row]
        cell.configur(with: hotelRooms?.rooms[indexPath.row])
        cell.actionHandler = { [weak self] _ in
            self?.performSegue(withIdentifier: "toBooking", sender: nil)
        }
        return cell
    }
    
    private func fetchData(with url: String) {
        NetworkManager.shared.fetch(HotelRooms.self, from: url) { [weak self] result in
            switch result {
            case .success(let rooms):
                self?.hotelRooms = rooms
                print(rooms)
                self?.roomTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
