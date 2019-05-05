//
//  Date+getStringFromDate.swift
//  Student Data
//
//  Created by AnDy on 5/1/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation

extension Date {
    
    func getStringFromDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyy"
        return formatter.string(from: self)
    }
}
