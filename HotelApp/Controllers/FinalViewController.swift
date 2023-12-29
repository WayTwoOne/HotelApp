//
//  FinalViewController.swift
//  HotelApp
//
//  Created by Vladimir on 28.12.2023.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var aroundView: UIView!
    @IBOutlet weak var orderConfirmationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aroundView.layer.cornerRadius = 30
        aroundView.backgroundColor = UIColor(red: 246, green: 246, blue: 249, alpha: 1)
        
        orderConfirmationLabel.text = "Подтверждение заказа №\(Int.random(in: 10000...200000)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    }

    @IBAction func toStartButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}
