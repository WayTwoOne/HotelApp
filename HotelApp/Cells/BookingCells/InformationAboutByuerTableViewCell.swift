//
//  InformationAboutByuerTableViewCell.swift
//  HotelApp
//
//  Created by Vladimir on 27.12.2023.
//

import UIKit

class InformationAboutByuerTableViewCell: UITableViewCell {
    
    private let maxNumberCount = 11
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
    var yesOrNo = Bool()
    
    
    @IBOutlet weak var phoneTextField: UITextField! {
        didSet {
            phoneTextField.placeholder = "Номер телефона"
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.placeholder = "Почта"
        }
    }

    static let identifier = "InformationAboutByuerTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "InformationAboutByuerTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        phoneTextField.delegate = self
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if validateEmail(enteredEmail: emailTextField.text ?? "") == false || emailTextField.text?.isEmpty == true {
            emailTextField.backgroundColor = .red
            emailTextField.endEditing(true)
        } else {
            emailTextField.backgroundColor = .white
            emailTextField.endEditing(true)
        }
    }
}

extension InformationAboutByuerTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneTextField.text = "+7 (XXX) XXX-XXXX"
        
        textField.backgroundColor = .white
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
            if textField.text?.count != 18 {
                textField.backgroundColor = .red
            } else {
                textField.backgroundColor = .white
            }
        }
    
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XX-XX", phone: newString, shouldRemoveLastDigit: range.length == 1, phoneNumber: textField.text ?? "")
        return false
    }
    
    func format(with mask: String, phone: String, shouldRemoveLastDigit: Bool, phoneNumber: String) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+7" }
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
                
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
