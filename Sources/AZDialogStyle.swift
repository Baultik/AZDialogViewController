//
//  AZDialogStyle.swift
//  AZDialogViewController
//
//  Created by Brian Ault on 9/17/18.
//  Copyright © 2018 Brian Ault. All rights reserved.
//

import Foundation
import UIKit

///Protocol to define set style for dialogs
public protocol AZDialogStyle {
    //MARK: - Settings
    var blurBackground: Bool { get }
    
    var blurEffectStyle: UIBlurEffect.Style { get }
    
    /// Background alpha. default is 0.2
    var backgroundAlpha: CGFloat { get }
    
    /// Animation duration.
    var animationDuration: TimeInterval { get }
    
    /// Show separator
    var showSeparator: Bool { get }
    
    /// Dismiss direction [top,bottom,both,none]
    var dismissDirection: AZDialogDismissDirection { get set }
    
    /// Allow dismiss when touching outside of the dialog (touching the background)
    var dismissWithOutsideTouch: Bool { get }
    
    /// Allow users to drag the dialog
    var allowDragGesture: Bool { get }
    
    /// Use this to hide/show the cancel button
    var cancelEnabled: Bool { get }
    
    /// Enables the rubber effect you would see on a scroll view.
    var rubberEnabled: Bool { get }
    
    //MARK: - Setup Closures
    /// Button style closure, called when setting up an action. Where the 1st parameter is a reference to the button, the 2nd is the height of the button and the 3rd is the position of the button (index).
    var buttonStyle: ((UIButton,_ height: CGFloat,_ position: Int)->Void)? { get set }
    
    var buttonInit: ((_ index: Int) -> UIButton?)? { get set }
    
    /// Left Tool Style, is the style (closure) that is called when setting up the left tool item. Make sure to return true to show the item.
    var leftToolStyle: ((UIButton)->Bool)? { get set }
    
    /// Right Tool Style, is the style (closure) that is called when setting up the right tool item. Make sure to return true to show the item.
    var rightToolStyle: ((UIButton)->Bool)? { get set }
    
    /// The cancel button style. where @UIButton is the refrence to the button, @CGFloat is the height of the button and @Bool is the value you return where true would show the button and false won't.
    var cancelButtonStyle: ((UIButton,CGFloat)->Bool)? { get set }
    
    /// Image handler, used when setting up an image using some sort of process.
    var imageHandler: ((UIImageView)->Bool)? { get set }
    
    //MARK: - Event Handlers
    /// The action that is triggered when tool is clicked.
    var leftToolAction: ((UIButton)->Void)? { get set }
    
    /// The action that is triggered when tool is clicked.
    var rightToolAction: ((UIButton)->Void)? { get set }
    
    //MARK: - Colors
    /// Separator Color
    var separatorColor: UIColor { get }
    
    /// Change the color of titleLabel
    var titleColor: UIColor? { get }
    
    /// Change the color of messageLabel
    var messageColor: UIColor? { get }
    
    /// Change the color of alert container
    var alertBackgroundColor: UIColor? { get }
    
//    /// The offset of the dialog.
//    var contentOffset: CGFloat { get set }
//    
//    /// Change the height of the custom view
//    var customViewSizeRatio: CGFloat { get set }
}

//MARK: - Extension defaults
extension AZDialogStyle {
    var blurBackground: Bool { return true }
    
    var blurEffectStyle: UIBlurEffect.Style { return .dark }
    
    var showSeparator: Bool { return true }
    
    var separatorColor: UIColor { return UIColor(red: 208.0/255.0, green: 211.0/255.0, blue: 214.0/255.0, alpha: 1.0) }
    
    var dismissWithOutsideTouch: Bool { return true }
    
    var allowDragGesture: Bool { return true }
    
    var backgroundAlpha: CGFloat { return 0.2 }
    
    var animationDuration: TimeInterval { return 0.2 }
    
//    var contentOffset: CGFloat { return 0.0 }
//    
//    var customViewSizeRatio: CGFloat { return 0.0 }
    
    var cancelEnabled: Bool { return false }
    
    var rubberEnabled: Bool { return true }
}
