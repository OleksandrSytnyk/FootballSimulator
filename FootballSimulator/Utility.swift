//
//  Utility.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/9/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import UIKit

func getValidationAlert(message: String) ->  UIAlertController {
    let alert = UIAlertController(
        title: NSLocalizedString("Sorry...", comment: "Validation alert: title"),
        message: NSLocalizedString(message, comment: "Validation alert: message"), preferredStyle: .alert)
    let action = UIAlertAction(title: NSLocalizedString("OK", comment: "Validation alert: OK"), style: .default, handler: nil)
    alert.addAction(action)
    return alert
}
