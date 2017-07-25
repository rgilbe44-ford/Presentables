//
//  Presentable+UITableView.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


fileprivate extension Array where Element == UITableViewCell.Type {
    
    func contains(className: AnyClass) -> Bool {
        return self.filter({$0 === className}).count > 0
    }
    
}

extension UITableView: Bindable {
    
    public func register(presentableSections sections: inout [PresentableSection]) {
        for section: PresentableSection in sections {
            section.bindableHeader.bind(listener: { (header) in
                self.reloadData()
            })
            section.bindableFooter.bind(listener: { (footer) in
                self.reloadData()
            })
            section.bindablePresenters.bind(listener: { (presenters) in
                self.reloadData()
            })
        }
        
        reloadData()
    }
    
}