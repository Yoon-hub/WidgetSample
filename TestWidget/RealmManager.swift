//
//  RealmManager.swift
//  WidgetSample
//
//  Created by 최윤제 on 2022/11/09.
//

import UIKit
import RealmSwift

class RealmManager {
    
    private init() { }
    
    static let shared: RealmManager = .init()
     
    private var localRealm: Realm {
        let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.sesac.WidegtSample")
        let realmURL = container?.appendingPathComponent("default.realm")
        let config = Realm.Configuration(fileURL: realmURL, schemaVersion: 1)
        return try! Realm(configuration: config)
    }
    
    
    func getData() -> [Izone] {
        Array(localRealm.objects(Izone.self))
    }

    
}
