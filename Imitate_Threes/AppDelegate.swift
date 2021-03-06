//
//  AppDelegate.swift
//  Imitate_Threes
//
//  Created by 任岐鸣 on 2016/10/10.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    lazy var managedObjectContext:NSManagedObjectContext = {
        
            let mainContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
            mainContext.persistentStoreCoordinator = self.persistentStoreCoordinator
            return mainContext
        
    }()
    lazy var managedObjectModel:NSManagedObjectModel = {
        
            let fileURL = Bundle.main.url(forResource: "Imitate_Threes", withExtension: "momd")
            let model = NSManagedObjectModel.init(contentsOf: fileURL!)!
            return model
        
    }()
    lazy var persistentStoreCoordinator:NSPersistentStoreCoordinator = {
        
            let storeCoordinator = NSPersistentStoreCoordinator.init(managedObjectModel: self.managedObjectModel)
            let options = [NSMigratePersistentStoresAutomaticallyOption:true,NSInferMappingModelAutomaticallyOption:true]
            
            let storeURL = self.applicationDocumentsDirectory.appendingPathComponent("Imitate_Threes.sqlite")
            
            _ = try? storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)
            
            return storeCoordinator
        
    }()
    
    lazy var applicationDocumentsDirectory:URL = {
        
            return FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last!
        
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let coreDataTools = CoreDataTools.sharedInstance
//        coreDataTools.modelName = 
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            try? managedObjectContext.save()
        }
    }
    
}

