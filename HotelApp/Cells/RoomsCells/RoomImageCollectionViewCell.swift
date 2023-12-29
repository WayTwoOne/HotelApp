//
//  RoomImageCollectionViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 27.12.2023.
//

import UIKit

class RoomImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roomImages: UIImageView! {
        didSet {
            roomImages.layer.cornerRadius = 50
        }
    }
    
    static let identifier = "RoomImageCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RoomImageCollectionViewCell", bundle: nil)
    }
    
    func configur(with url: String?) {
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let imageData):
                self.roomImages.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        
    }

}
