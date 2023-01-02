//
//  ViewController.swift
//  WidgetSample
//
//  Created by 최윤제 on 2022/11/09.
//

import UIKit

import RealmSwift


class ViewController: UIViewController {
    
    let localRealm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        
//        let task = Izone(name: "김채원", age: "22")
//        let task1 = Izone(name: "권은비", age: "23")
//        let task2 = Izone(name: "장원영", age: "24")
//        let task3 = Izone(name: "사쿠라", age: "25")
//        
//        let tasks = [task, task1, task2, task3]
//        
//        for i in tasks {
//            try! localRealm.write {
//                localRealm.add(i)
//            }
//        }
//        
//        
//        print("Realm is located at:", localRealm.configuration.fileURL!)
    }

}

