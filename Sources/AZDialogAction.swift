//
//  AZDialogAction.swift
//  AZDialogViewControllerExample
//
//  Created by devteam on 9/21/18.
//  Copyright © 2018 Antonio Zaitoun. All rights reserved.
//

import Foundation

public typealias ActionHandler = ((AZDialogViewController) -> Void)

open class AZDialogAction {
    open var title: String?
    open var isEnabled: Bool = true
    open var handler: ActionHandler
    
    public init(title: String, handler: ActionHandler? = nil){
        self.title = title
        self.handler = handler ?? { $0.dismiss() }
    }
}
