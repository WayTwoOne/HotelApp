//
//  HotelTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 25.12.2023.
//

import UIKit

class BasicDataAboutHotelTableViewCell: UITableViewCell {
    
    static let identifier = "BasicDataAboutHotelTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BasicDataAboutHotelTableViewCell", bundle: nil)
    }
    
    var hotel: Hotel?
    
    
    @IBOutlet weak var picturesCollectionView: UICollectionView!

    @IBOutlet weak var labelAndImageStackView: UIStackView! {
        didSet {
            labelAndImageStackView.backgroundColor = UIColor(red: 255, green: 199, blue: 0, alpha: 0.2)
            labelAndImageStackView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var ratingAndNameLabel: UILabel! {
        didSet {
            ratingAndNameLabel.textColor = UIColor(red: 255, green: 168, blue: 0, alpha: 1.0)
        }
    }
    
    @IBOutlet weak var hotelNameLabel: UILabel!
    
    @IBOutlet weak var adressButton: UIButton! {
        didSet {
            adressButton.isEnabled = true
            adressButton.titleLabel?.textColor = .blue
        }
    }
    
    @IBOutlet weak var minimalPriceLabel: UILabel!
    @IBOutlet weak var priceForItLabel: UILabel! {
        didSet {
            priceForItLabel.textColor = .gray
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.picturesCollectionView.delegate = self
        self.picturesCollectionView.dataSource = self

        self.picturesCollectionView.register(PicturesCollectionViewCell.nib(), forCellWithReuseIdentifier: PicturesCollectionViewCell.identifier)
    }
    
    func configur(with data: Hotel?) {
        ratingAndNameLabel.text = "\(data?.rating ?? 0) Превосходно"
        adressButton.titleLabel?.text = data?.adress
        minimalPriceLabel.text = "от \( numberFormatter(with: data?.minimalPrice ?? 0)) ₽"
        priceForItLabel.text = data?.priceForIt
        
        picturesCollectionView.reloadData()
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

extension BasicDataAboutHotelTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 390, height: 257)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hotel?.imageUrls.count ?? 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PicturesCollectionViewCell.identifier, for: indexPath) as! PicturesCollectionViewCell
        cell.configur(with: hotel?.imageUrls[indexPath.item])

        return cell
    }
}
