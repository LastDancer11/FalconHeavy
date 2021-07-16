//
//  CoordinatorDelegate.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

protocol CoordinatorDelegate: UIViewController{
    var coordinator: CoordinatorProtocol? { get set }
}
