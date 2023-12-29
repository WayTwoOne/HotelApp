//
//  PicturesCollectionViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 25.12.2023.
//

import UIKit

class PicturesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var picturesImageView: UIImageView! {
        didSet {
            picturesImageView.layer.cornerRadius = 45
        }
    }
    
    static let identifier = "PicturesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PicturesCollectionViewCell", bundle: nil)
    }
    
    func configur(with url: String?) {
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let imageData):
                self.picturesImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

