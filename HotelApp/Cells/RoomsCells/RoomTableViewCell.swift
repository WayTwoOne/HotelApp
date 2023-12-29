//
//  RoomTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 26.12.2023.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    var rooms: Room?
    var actionHandler: ((RoomTableViewCell) -> Void)?
    
    @IBOutlet weak var picturCollectionView: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet var peculiarities: [UILabel]!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var pricePer: UILabel!
    
    
    static let identifier = "RoomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RoomTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.picturCollectionView.delegate = self
        self.picturCollectionView.dataSource = self
        
        self.picturCollectionView.register(RoomImageCollectionViewCell.nib(), forCellWithReuseIdentifier: RoomImageCollectionViewCell.identifier)
    }

    @IBAction func pickRoom() {
        actionHandler? (self)
    }
    
    func configur(with room: Room?) {
        name.text = room?.name
        price.text = "\(numberFormatter(with: room?.price ?? 0)) ₽"
        pricePer.text = room?.pricePer
        
        for i in 0..<(room?.peculiarities.count ?? 1)  {
            for _ in 0..<peculiarities.count {
                peculiarities[i].text = room?.peculiarities[i]
            }
        }
        
        picturCollectionView.reloadData()
    }
    
    private func numberFormatter(with number: Int) -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.usesGroupingSeparator = true
        fmt.groupingSeparator = " "
        fmt.groupingSize = 3
        
        return fmt.string(for: number) ?? ""
    }
    
}

extension RoomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 390, height: 257)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rooms?.imageUrls.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomImageCollectionViewCell.identifier, for: indexPath) as! RoomImageCollectionViewCell
        cell.configur(with: rooms?.imageUrls[indexPath.item])

        return cell
    }
}
