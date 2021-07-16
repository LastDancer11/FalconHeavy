//
//  CoordinatorProtocol.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
}

extension CoordinatorProtocol {
    func start() {}
   
    
}
