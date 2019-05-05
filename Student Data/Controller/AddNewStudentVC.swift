//
//  AddNewStudentVC.swift
//  Student Data
//
//  Created by AnDy on 5/1/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit

class AddNewStudentVC: UIViewController {
    
    @IBOutlet var studentInfo: [UITextField]!
    @IBOutlet weak var studentDOB: UIDatePicker!
    @IBOutlet weak var studentFavSubject: UIPickerView!
    
    let subjects = ["Math","Arabic","English","Science","Programming"]
    var favSub : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentDOB.setValue(UIColor.white, forKeyPath: "textColor")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtnTapped(_ sender: UIBarButtonItem) {
        let students : [String : Any] = [
            "name" : studentInfo[0].text,
            "age" : studentInfo[1].text,
            "phoneNumber" : studentInfo[2].text,
            "dob" : studentDOB.date,
            "favSubject" : favSub
        ]
        CoreDataHandler.instance.storeIntoCoreData(student: students)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}


extension AddNewStudentVC : UIPickerViewDelegate , UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjects.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjects[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        favSub = subjects[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        attributedString = NSAttributedString(string: subjects[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attributedString
    }
}
