//
//  Izone.swift
//  WidgetSample
//
//  Created by 최윤제 on 2022/11/09.
//

import UIKit

import RealmSwift

final class Izone: Object {
    @Persisted var name: String
    @Persisted var age: String
    
    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(name: String, age: String ) {
        self.init()
        self.name = name
        self.age = age
    }
    
}
