//
//  DetailPMViewController.swift
//  project02
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class DetailPMViewController: UIViewController {
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextField!
    @IBOutlet var textGrade: UITextField!
    @IBOutlet var textpaytime: UITextField!
    
    var detailEnrollment: NSManagedObject?
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "EnrollmentTablePM", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textName.text, forKey: "name")
        object.setValue(textGrade.text, forKey: "grade")
        object.setValue(textPhone.text, forKey: "phone")
        object.setValue(textpaytime.text, forKey: "paytime")
        object.setValue(textMemo.text, forKey: "memo")
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let Enrollment = detailEnrollment {
            textName.text = Enrollment.value(forKey: "name") as? String
            textPhone.text = Enrollment.value(forKey: "phone") as? String
            textMemo.text = Enrollment.value(forKey: "memo") as? String
            textGrade.text = Enrollment.value(forKey: "grade") as? String
            textpaytime.text = Enrollment.value(forKey: "paytime") as? String
            
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
