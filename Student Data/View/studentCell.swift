//
//  studentCell.swift
//  Student Data
//
//  Created by AnDy on 5/1/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit

class studentCell: UITableViewCell {
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studenAge: UILabel!
    @IBOutlet weak var studentPhoneNumber: UILabel!
    @IBOutlet weak var studentDOB: UILabel!
    @IBOutlet weak var studentFavSubject: UILabel!
    
    func updateView(student : StudentData){
        studentName.text = student.name
        studenAge.text = "Age : \(student.age ?? "")"
        studentPhoneNumber.text = "Phone Number : \(student.phoneNumber ?? "")"
        studentDOB.text = "Date Of Birth : \(student.dob?.getStringFromDate() ?? "")"
        studentFavSubject.text = "Favourite Subject : \(student.age ?? "")"
    }
}
