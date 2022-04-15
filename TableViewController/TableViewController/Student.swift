//
//  Student.swift
//  TableViewController
//
//  Created by Akniyet Turdybay on 28.03.2022.
//

import Foundation
import UIKit

class Student{
    public var name:String?
    public var phoneNumber:String?
    public var image: UIImage?
    init(_ name: String, _ phone: String, _ image: UIImage){
        self.name = name
        self.phoneNumber = phone
        self.image = image
    }
    
}
