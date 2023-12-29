//
//  ЕouristTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 28.12.2023.
//

import UIKit

class TouristTableViewCell: UITableViewCell {
    
    var hideIt = false
    var color = UIColor.white
    
    var tryToHide: ((TouristTableViewCell) -> Void)?
    
    @IBOutlet weak var touristLabel: UILabel!
    @IBOutlet weak var hiddenButton: UIButton!
    
    @IBOutlet weak var textFieldStackView: UIStackView!
    
    @IBOutlet weak var nameTF: UITextField! {
        didSet {
            nameTF.placeholder = "Имя"
        }
    }
    @IBOutlet weak var surnameTF: UITextField! {
        didSet {
            surnameTF.placeholder = "Фамилия"
        }
    }
    @IBOutlet weak var dateOfBirthTF: UITextField! {
        didSet {
            dateOfBirthTF.placeholder = "Дата рождения"
        }
    }
    @IBOutlet weak var citizenshipTF: UITextField! {
        didSet {
            citizenshipTF.placeholder = "Гражданство"
        }
    }
    @IBOutlet weak var passportNumberTF: UITextField! {
        didSet {
            passportNumberTF.placeholder = "Номер загранпаспорта"
        }
    }
    @IBOutlet weak var validityPeriodOfPassportTF: UITextField! {
        didSet {
            validityPeriodOfPassportTF.placeholder = "Срок действия загранпаспорта"
        }
    }
    
    static let identifier = "TouristTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TouristTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        hiddenButton.imageView?.image = UIImage(named: "revealed")
    }
    
    @IBAction func hiddenButtonPressed() {
        hideIt.toggle()
        tryToHide? (self)
        
        if hideIt == false {
            textFieldStackView.isHidden = false
            hiddenButton.setImage(UIImage(named: "revealed"), for: .normal)
        } else {
            textFieldStackView.isHidden = true
            hiddenButton.setImage(UIImage(named: "hidden"), for: .normal)
        }
    }
    
    
    
    func configur(with numberOfCell: Int) {
        touristLabel.text = "\(numberFormatter(with: numberOfCell)) турист"
        for textField in [nameTF, surnameTF, dateOfBirthTF, citizenshipTF, passportNumberTF, validityPeriodOfPassportTF] {
            textField?.backgroundColor = .white
        }
    }
    
    private func numberFormatter(with numer: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        let numberAsWord = numberFormatter.string(from: NSNumber(value: numer))
        let first = numberAsWord?.first?.uppercased() ?? ""
        let other = numberAsWord?.dropFirst() ?? ""
        
        return first + other
    }
    
    

    
     func moveToPayOrNot() -> Bool {
        var pass = true
        for textField in [nameTF, surnameTF, dateOfBirthTF, citizenshipTF, passportNumberTF, validityPeriodOfPassportTF] {
            if textField?.text?.isEmpty == true {
                textField?.backgroundColor = color
                 pass = false
            } else {
                textField?.backgroundColor = .white
                pass = true
            }
        }
        return pass
    }
}

extension TouristTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .green
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .brown
    }
}
