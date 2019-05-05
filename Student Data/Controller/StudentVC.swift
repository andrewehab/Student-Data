//
//  ViewController.swift
//  Student Data
//
//  Created by AnDy on 5/1/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit
import RevealingSplashView

class StudentVC: UIViewController {
    
    var students : [StudentData]?
    
    @IBOutlet weak var studentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make navigation bar same color with view
        // make sure of button bar to be black navigation var with promote
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "student")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
        revealingSplashView.animationType = SplashAnimationType.popAndZoomOut
        
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        students = CoreDataHandler.instance.getItemsFromCoreData()
        studentTable.tableFooterView = UIView()
        studentTable.reloadData()
    }
    
    @IBAction func searchForItem(_ sender: UITextField) {
        
        if !(sender.text!.isEmpty){
            students = CoreDataHandler.instance.searcForItemInCoreData(studentName: sender.text!)
        } else {
            students = CoreDataHandler.instance.getItemsFromCoreData()
        }
        studentTable.reloadData()
    }
}

extension StudentVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! studentCell
        let listOfStudents = students![indexPath.row]
        cell.updateView(student: listOfStudents)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students =  CoreDataHandler.instance.deleteItemsFromCoreData(student: students![indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            tableView.dataSource?.tableView!(tableView, commit: .delete, forRowAt: indexPath)
            return
        }
        deleteButton.backgroundColor = #colorLiteral(red: 0.3745741844, green: 0.4291228056, blue: 0.7684418559, alpha: 1)
        return [deleteButton]
    }
}
