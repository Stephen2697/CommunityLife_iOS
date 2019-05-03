//
//  SaveLoadData.swift
//  communityLife
//
//  Created by Stephen Alger on 02/05/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//  DEBUG - Tempromental code with ios12 deprecated swift code (will be added in future release)



//extension NextEventsViewController {
//
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//
//
//    private func saveEntry()
//    {
//        //save the foodItems array to memory... if return is true we have success
//        let saved = NSKeyedArchiver.archiveRootObject(eventItems, toFile: Event.ArchiveURL.path)
//        if saved
//        {
//            os_log("Food Item saved.", log: OSLog.default, type: .debug)
//        } else {
//            os_log("Failed save", log: OSLog.default, type: .error)
//        }
//    }
//
//    //    private func saveEvents() {
//    //     DEBUG - Tempromental code with ios12 deprecated swift code
//    //        let randomFilename = UUID().uuidString
//    //        let fullPath = getDocumentsDirectory().appendingPathComponent(randomFilename)
//    //
//    //        do {
//    //
//    //            let data = try NSKeyedArchiver.archivedData(withRootObject: eventItems, requiringSecureCoding: false)
//    //            try data.write(to: fullPath)
//    //        } catch {
//    //            print("Couldn't write file")
//    //        }
//
//    //    }
//
//    //Method returns either nil or an array of FoodItem objects
//    private func loadEntries() -> [Event]?
//    {
//        //return object from memory location and downcast to an array of FoodItem objects
//        return NSKeyedUnarchiver.unarchiveObject(withFile: Event.ArchiveURL.path) as? [Event]
//    }
//
//    //DEBUG - Tempromental code with ios12 deprecated swift code
//    //    private func loadEvents() -> [Event]?  {
//    //
//    //        var returnObjArray: [Event]? = nil
//    //
//    //
//    //        do {
//    //
//    //            let rawdata = try Data(contentsOf: getDocumentsDirectory())
//    //            if let loadedEvent = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(rawdata) as? [Event] {
//    //                returnObjArray = loadedEvent
//    //            }
//    //
//    //
//    //        } catch {
//    //            print("Couldn't read file.")
//    //        }
//    //        return returnObjArray
//    //    }
//    //
//    
//}
