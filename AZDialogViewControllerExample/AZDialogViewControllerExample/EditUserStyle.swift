//
//  EditUserStyle.swift
//  AZDialogViewControllerExample
//
//  Created by Brian Ault on 9/20/18.
//  Copyright © 2018 Antonio Zaitoun. All rights reserved.
//

import UIKit

struct EditUserStyle: AZDialogStyle {
    var dismissDirection: AZDialogDismissDirection = .bottom
    
    var buttonStyle: ((UIButton, CGFloat, Int) -> Void)? = { (button,height,position) in        
        button.setBackgroundImage(UIImage.imageWithColor(#colorLiteral(red: 0.5373370051, green: 0.2116269171, blue: 0.7118118405, alpha: 1)), for: .highlighted)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.setTitleColor(#colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1), for: .normal)
        button.layer.masksToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1).cgColor
    }

    var cancelButtonStyle: ((UIButton, CGFloat) -> Bool)? = { (button,height) in
        button.tintColor = #colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1)
        button.setTitle("CANCEL", for: [])
        return true
    }
    
    var buttonInit: ((Int) -> UIButton?)?
    var imageHandler: ((UIImageView) -> Bool)?
    var leftToolAction: ((UIButton) -> Void)?
    var rightToolAction: ((UIButton) -> Void)?
    var leftToolStyle: ((UIButton) -> Bool)?
    var rightToolStyle: ((UIButton) -> Bool)?
    var titleColor: UIColor?
    var messageColor: UIColor?
    var alertBackgroundColor: UIColor?
    var cancelEnabled: Bool = true
}
