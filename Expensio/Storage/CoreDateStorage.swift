//
//  CoreDateStorage.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import CoreData

class CoreDateStorage: ExStore {
    
    
    let container: NSPersistentContainer
    let viewContext: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Expensio")
        container.loadPersistentStores { description, error in
            guard let error else {
                Log.info("CoreData persistent storage loaded")
                return
            }
            Log.warning("Error loading the CoreData persistent storage", error: error)
        }
        viewContext = container.viewContext
    }
    
    func fetchItems<T: NSFetchRequestResult>() -> [T] {
        let request = NSFetchRequest<T>(entityName: "\(T.self)")
        do {
            let items = try viewContext.fetch(request)
            return items
        } catch {
            Log.warning("Can't fetch expenses from the store", error: error)
            return []
        }
    }
    
    func addExpense(amount: Double, title: String, category: Category, note: String) {
        let expense = Expense(context: viewContext)
        expense.title = title
        expense.amount = amount
        expense.category = category
        expense.dateCreated = Date()
        
        saveCahangesInStorage()
    }
    
    func addCategory(emoji: String, name: String) -> Category {
        let category = Category(context: viewContext)
        category.emoji = emoji
        category.title = name
        
        saveCahangesInStorage()
        return category
    }
    
    func delete<T: NSManagedObject>(_ item: T) {
        viewContext.delete(item)
        saveCahangesInStorage()
    }
    
    func saveCahangesInStorage() {
        do {
            try viewContext.save()
        } catch {
            Log.warning("Can't save chnages in coreData store.", error: error)
        }
    }
    
    
}
