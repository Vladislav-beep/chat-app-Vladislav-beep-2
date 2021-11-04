//
//  CoreDataManager.swift
//  Chat
//
//  Created by Владислав Сизонов on 01.11.2021.
//

import Foundation
import CoreData

class CoreDataManager {
        
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                print(description.url ?? "")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    // MARK: - DBChannel methods
    
    func getChannelsFromCoreData() {
        
        let fetchRequest: NSFetchRequest<DBChannel> = DBChannel.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            for result in results {
                print("""
                         \(result.name ?? "") - channel name,
                         \(result.identifier ?? "") - channel identifier,
                         \(result.lastMessage ?? "") - last message,
                         \(result.lastActivity ?? Date()) - last activity
                      """)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func saveChannelIntoCoreData(channel: Channel) {
        persistentContainer.performBackgroundTask { context in
            let dbChannelObject = DBChannel(context: context)
            dbChannelObject.identifier = channel.identifier
            dbChannelObject.name = channel.name
            dbChannelObject.lastMessage = channel.lastMessage
            dbChannelObject.lastActivity = channel.lastActivity

            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteChannelsFromCoreData() {
        persistentContainer.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<DBChannel> = DBChannel.fetchRequest()
            if let objects = try? context.fetch(fetchRequest) {
                for object in objects {
                    context.delete(object)
                }
                do {
                    try context.save()
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getDBChannel(channel: Channel) -> DBChannel {
        let dbChannelObject = DBChannel(context: context)
        
        dbChannelObject.identifier = channel.identifier
        dbChannelObject.name = channel.name
        dbChannelObject.lastMessage = channel.lastMessage
        dbChannelObject.lastActivity = channel.lastActivity
        
        return dbChannelObject
    }
    
    // MARK: - DBMessage methods
    
    func saveMessagesIntoCoreData(message: Message, id: String) {
        persistentContainer.performBackgroundTask { context in
            var currentChannel = DBChannel()
            
            let fetchRequest: NSFetchRequest<DBChannel> = DBChannel.fetchRequest()
            do {
                let results = try context.fetch(fetchRequest)
                let result = results.first(where: { $0.identifier == id })
                currentChannel = result ?? DBChannel()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            let dbMessageObject = DBMessage(context: context)
            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

            dbMessageObject.content = message.content
            dbMessageObject.created = message.created
            dbMessageObject.senderId = message.senderId
            dbMessageObject.senderName = message.senderName

            currentChannel.addToMessages(dbMessageObject)

            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func getMessagesFromCoreData() {
        persistentContainer.performBackgroundTask { (context) in
            let fetchRequest: NSFetchRequest<DBMessage> = DBMessage.fetchRequest()
            
            do {
                let results = try context.fetch(fetchRequest)
                for result in results {
                    print("""
                             \(result.content ?? "") - message content,
                             \(result.senderId ?? "") - sender identifier,
                             \(result.senderName ?? "") - sender name,
                             \(result.created ?? Date()) - created
                          """)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
