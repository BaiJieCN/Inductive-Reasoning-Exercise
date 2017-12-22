//
//  coreDatahandler.swift
//  Indicative Reasoning Test
//
//  Created by BaiJie on 12/22/17.
//  Copyright © 2017 BaiJie. All rights reserved.
//

import UIKit
import CoreData

class coreDatahandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(score:Int, date:Date) -> Bool{
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ScoreHistory", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        manageObject.setValue(score, forKey:"score")
        manageObject.setValue(date, forKey:"date")
        
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }
    
    class func fetchObject() -> [ScoreHistory]?{
        let context = getContext()
        var scorehistory:[ScoreHistory]? = nil
        do{
            scorehistory = try context.fetch(ScoreHistory.fetchRequest())
            return scorehistory
        }catch{
            return scorehistory
        }
    }
    
}

