//
//  File.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 15/02/22.
//

import UIKit

public var __maxLengths = [UITextField: Int]()

public var __mask = [UITextField: Mask]()

extension UITextField {
    public var xmask: Mask {
        get {
            return __mask[self] ?? Mask.custom("")
        }

        set {
            __mask[self] = newValue
            maxLength = newValue.rawValue.count
            addTarget(self, action: #selector(applyMask(textField:)), for: .editingChanged)
        }
    }

    @objc func applyMask(textField: UITextField) {
        guard let t = textField.text else { return }

        textField.text = t.applyPatternOnNumbers(pattern: xmask.rawValue)
    }
    
    var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.prefix(maxLength).description
    }
    
    public func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    public func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

public enum Mask {
    case custom(String)
    case unMask
    case zipCode
    case phone
    case cpf
    case cnpj
    case year
    case date
    case routingNumber
    case bankBranchNumber
    case debitCreditCardNumber
    case expirationDate
    case smsCode

    public var rawValue: String {
        switch self {
        case .custom(let customMask):
            return customMask
        case .unMask:
            return "/-.*()[]{}_+= "
        case .zipCode:
            return "#####"
        case .phone:
            return "(##)#####-####"
        case .cpf:
            return "###.###.###-##"
        case .cnpj:
            return "##.###.###/####-##"
        case .year:
            return "####"
        case .date:
            return "##/##/####"
        case .routingNumber:
            return "#########"
        case .bankBranchNumber:
            return "####"
        case .debitCreditCardNumber:
            return "#### #### #### ####"
        case .expirationDate:
            return "##/####"
        case .smsCode:
            return "### ###"
        }
    }
}

public enum AlertMessages {
    case empty(String)
    case emptyDate
    case emptyFullName
    case emptyPhone
    case emptyEmail
    case emptyFirstLetterCaps
    case emptyPSW
    case emptyCpfCnpj
    case emptyYear
    case emptyZipCode
    case emptyRoutingNumber
    case emptyDebitCreditCardNumber
    case emptyExpirationDate

    case invalid(String)
    case inValidEmail
    case invalidFirstLetterCaps
    case inValidPhone
    case inValidPSW
    case invalidFullName
    case invalidCpfCnpj
    case invalidDate
    case invalidYear
    case invalidZipCode
    case invalidRoutingNumber
    case invalidDebitCreditCardNumber
    case invalidExpirationDate
    case passwordsNotMatch

    public var rawValue: String {
        switch self {

        // MARK: EMPTY
        case .emptyDate:
            return NSLocalizedString("Empty date", comment: "")
        case .emptyFullName:
            return NSLocalizedString("Empty Full Name", comment: "")
        case .emptyPhone:
            return NSLocalizedString("Empty Phone", comment: "")
        case .emptyEmail:
            return NSLocalizedString("Empty Email", comment: "")
        case .emptyFirstLetterCaps:
            return NSLocalizedString("Empty Name", comment: "")
        case .emptyPSW:
            return NSLocalizedString("Empty Password", comment: "")
        case .emptyCpfCnpj:
            return NSLocalizedString("Empty CPF/CNPJ", comment: "")
        case .emptyYear:
            return NSLocalizedString("Empty Year", comment: "")
        case .emptyZipCode:
            return NSLocalizedString("Empty Zip Code", comment: "")
        case .emptyRoutingNumber:
            return NSLocalizedString("Empty Routing Number", comment: "")
        case .empty(let message):
            return NSLocalizedString("Empty " + message, comment: "")
        case.emptyDebitCreditCardNumber:
            return NSLocalizedString("Empty card number", comment: "")
        case .emptyExpirationDate:
            return NSLocalizedString("Empty expiration date", comment: "")

        // MARK: INVALID
        case .inValidEmail:
            return NSLocalizedString("Invalid Email", comment: "")
        case .invalidFirstLetterCaps:
            return NSLocalizedString("First Letter should be capital", comment: "")
        case .inValidPhone:
            return NSLocalizedString("Invalid Phone", comment: "")
        case .inValidPSW:
            return NSLocalizedString("Invalid Password", comment: "")
        case .invalidFullName:
            return NSLocalizedString("Invalid Full Name", comment: "")
        case .invalidCpfCnpj:
            return NSLocalizedString("Invalid CPF/CNPJ", comment: "")
        case .invalidDate:
            return NSLocalizedString("Invalid Date", comment: "")
        case .invalidYear:
            return NSLocalizedString("Invalid Year", comment: "")
        case .invalidZipCode:
            return NSLocalizedString("Invalid Zip Code", comment: "")
        case .invalidRoutingNumber:
            return NSLocalizedString("Invalid Routing Number", comment: "")
        case .invalid(let message):
            return NSLocalizedString("Invalid " + message, comment: "")
        case .invalidDebitCreditCardNumber:
            return NSLocalizedString("Invalid card number", comment: "")
        case .invalidExpirationDate:
            return NSLocalizedString("Invalid expiration date", comment: "")
        case .passwordsNotMatch:
            return NSLocalizedString("Passwords do not match", comment: "")
        }
    }

    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

public enum Alert {        // for failure and success results
    case success
    case failure
    case error
}
// for success or failure of validation with alert message
public enum Valid {
    case success
    case failure(Alert, AlertMessages)
}

public enum ValidationType {
    case email
    case stringWithFirstLetterCaps
    case phoneNo(Int)
    case alphabeticStringWithSpace(String)
    case password
    case fullName
    case cpfCnpj
    case number(String)
    case zipCode
    case alphabeticString(String)
    case date
    case year
    case routingNumber
    case debitCreditCardNumber
    case recognizedDebitCreditCardNumber
    case expirationDate
    case any(String)
    case passwordMatch(String, String)
    case smsCode
}
public enum RegEx {
    case email
    case fullName
    case password
    case alphabeticString
    case alphabeticStringFirstLetterCaps
    case number
    case routingNumber
    case zipCode
    case phoneNo(Int)
    case cpfCnpj
    case birthDate
    case year
    case anyCharacter
    case debitCreditCardNumber
    case recognizedDebitCreditCardNumber
    case expirationDate
    case smsCode
    
    var value: String {
        switch self {
        case .email: // Email
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        case .fullName:
            return "^[a-zA-ZãáàéíóúüÁÃÉÊÍÓÚÜ]{2,}(?: [a-zA-ZãáàéêíóúüÁÃÉÊÍÓÚÜ ]+){1,10}$"
        case .password: // Password length 6-15
            return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        case .alphabeticString:
            return "^[a-zA-ZãáàéíóúüÁÃÉÍÓÚÜ ]*$"
        case .alphabeticStringFirstLetterCaps: // SandsHell
            return "^[A-Z]+[a-zA-Z]*$"
        case .number:
            return "^[0-9]*$"
        case .routingNumber:
            return "^[0-9]{9}"
        case .zipCode:
            return "^[0-9]{5}"
        case .phoneNo(let digits):  // PhoneNo 10-14 Digits        //Change RegEx according to your Requirement
            return "[0-9()-]{\(digits)}$"
        case .cpfCnpj:
            return "([0-9]{2}[.]?[0-9]{3}[.]?[0-9]{3}[/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})"
        case .birthDate:
            return "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$"
        case .year:
            return "(19[0-9]\\d|20[012]\\d)"
        case .anyCharacter:
            return ".*"
        case .debitCreditCardNumber:
            return "^[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}"
        case .recognizedDebitCreditCardNumber:
            return "^[0-9]{16}"
        case .expirationDate:
            return "^(0[1-9]|1[0-2])\\/?([0-9]{4})$"
        case .smsCode:
            return "^[0-9]{3}+\\s[0-9]{3}"
        }
    }
}

public class Validation: NSObject {

    public static let shared = Validation()

    public func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email, .emptyEmail, .inValidEmail)) {
                    return tempValue
                }
            case .stringWithFirstLetterCaps:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringFirstLetterCaps, .emptyFirstLetterCaps, .invalidFirstLetterCaps)) {
                    return tempValue
                }
            case .phoneNo(let digits):
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNo(digits), .emptyPhone, .inValidPhone)) {
                    return tempValue
                }
            case .alphabeticStringWithSpace(let message), .alphabeticString(let message):
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticString, .empty(message), .invalid(message))) {
                    return tempValue
                }
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password, .emptyPSW, .inValidPSW)) {
                    return tempValue
                }
            case .fullName:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .fullName, .emptyFullName, .invalidFullName)) {
                    return tempValue
                }
            case .cpfCnpj:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .cpfCnpj, .emptyCpfCnpj, .invalidCpfCnpj)) {
                    return tempValue
                }
            case .number(let message):
                if let tempValue = isValidString((valueToBeChecked.inputValue, .number, .empty(message), .invalid(message))) {
                    return tempValue
                }
            case .any(let message):
                if let tempValue = isValidString((valueToBeChecked.inputValue, .anyCharacter, .empty(message), .invalid(message))) {
                    return tempValue
                }
            case .date:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .birthDate, .emptyDate, .invalidDate)) {
                    return tempValue
                }
            case .year:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .year, .emptyYear, .invalidYear)) {
                    return tempValue
                }
            case .zipCode:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .zipCode, .emptyZipCode, .invalidZipCode)) {
                    return tempValue
                }
            case .routingNumber:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .routingNumber, .emptyRoutingNumber, .invalidRoutingNumber)) {
                    return tempValue
                }
            case .debitCreditCardNumber:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .debitCreditCardNumber, .emptyDebitCreditCardNumber, .invalidDebitCreditCardNumber)) {
                    return tempValue
                }
            case .recognizedDebitCreditCardNumber:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .recognizedDebitCreditCardNumber, .emptyDebitCreditCardNumber, .invalidDebitCreditCardNumber)) {
                    return tempValue
                }
            case .expirationDate:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .expirationDate, .emptyExpirationDate, .invalidExpirationDate)) {
                    return tempValue
                }
            case .passwordMatch(let password, let confirmPassword):
                if let tempValue = isPasswordsMatch(password: password, confirmPassowrd: confirmPassword) {
                    return tempValue
                }
            case .smsCode:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .smsCode, .empty("sms code"), .invalid("sms code"))) {
                    return tempValue
                }
            }
        }
        return .success
    }

    public func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    public func isPasswordsMatch(password: String, confirmPassowrd: String) -> Valid? {
        if password != confirmPassowrd {
            return .failure(.error, .passwordsNotMatch)
        }
        
        return nil
    }

    public func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format: "SELF MATCHES %@", regex.value)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}
