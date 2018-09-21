//
//  IGNStyle.swift
//  AZDialogViewControllerExample
//
//  Created by devteam on 9/21/18.
//  Copyright © 2018 Antonio Zaitoun. All rights reserved.
//

import UIKit

struct IGNStyle: AZDialogStyle {
    var dismissDirection: AZDialogDismissDirection = .bottom
    
    var buttonStyle: ((UIButton, CGFloat, Int) -> Void)? = { (button,height,position) in
        button.setBackgroundImage(UIImage.imageWithColor(#colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1)) , for: .normal)
        button.setBackgroundImage(UIImage.imageWithColor(#colorLiteral(red: 0.5373370051, green: 0.2116269171, blue: 0.7118118405, alpha: 1)), for: .highlighted)
        button.setTitleColor(UIColor.white, for: [])
        button.layer.masksToBounds = true
        button.layer.borderColor = #colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1).cgColor
        button.tintColor = .white
        if position == 0 {
            let image = #imageLiteral(resourceName: "ic_bookmark").withRenderingMode(.alwaysTemplate)
            button.setImage(image, for: [])
            button.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    var cancelButtonStyle: ((UIButton, CGFloat) -> Bool)?
    var buttonInit: ((Int) -> UIButton?)?
    
    var imageHandler: ((UIImageView) -> Bool)? = {
        $0.image = UIImage(named: "ign")
        $0.contentMode = .scaleAspectFill
        return true
    }
    
    var leftToolAction: ((UIButton) -> Void)?
    var rightToolAction: ((UIButton) -> Void)? = { (button) in
        print("Share function")
    }
    var leftToolStyle: ((UIButton) -> Bool)?
    var rightToolStyle: ((UIButton) -> Bool)? = { (button) in
        button.setImage(#imageLiteral(resourceName: "share"), for: [])
        button.tintColor = .lightGray
        return true
    }
    var titleColor: UIColor?
    var messageColor: UIColor?
    var alertBackgroundColor: UIColor?
}
