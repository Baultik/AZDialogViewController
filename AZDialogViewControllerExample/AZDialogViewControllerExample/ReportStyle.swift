//
//  ReportStyle.swift
//  AZDialogViewControllerExample
//
//  Created by Brian Ault on 9/20/18.
//  Copyright © 2018 Antonio Zaitoun. All rights reserved.
//

import UIKit

struct ReportStyle: AZDialogStyle {
    var dismissDirection: AZDialogDismissDirection = .bottom
    
    var buttonStyle: ((UIButton, CGFloat, Int) -> Void)? = { (button,height,position) in
        button.tintColor = #colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1)
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage.imageWithColor(#colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1)) , for: .normal)
        button.setBackgroundImage(UIImage.imageWithColor(#colorLiteral(red: 0.0862745098, green: 0.6274509804, blue: 0.5215686275, alpha: 1)), for: .highlighted)
        button.setTitleColor(UIColor.white, for: [])
        button.layer.masksToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1).cgColor
        button.layer.borderColor = #colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1).cgColor
    }
    
    var buttonInit: ((Int) -> UIButton?)? = { index in
        return HighlightableButton()
    }

    var cancelButtonStyle: ((UIButton, CGFloat) -> Bool)? = { (button, height) in
        button.tintColor = #colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1)
        button.setTitle("CANCEL", for: [])
        return true
    }
    
    var cancelEnabled: Bool = true
    var imageHandler: ((UIImageView) -> Bool)?
    var leftToolAction: ((UIButton) -> Void)?
    var rightToolAction: ((UIButton) -> Void)?
    var leftToolStyle: ((UIButton) -> Bool)?
    var rightToolStyle: ((UIButton) -> Bool)?
    var titleColor: UIColor? = .black
    var messageColor: UIColor? = .black
    var alertBackgroundColor: UIColor?
}
