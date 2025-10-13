//
//  EXPersisting.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation

protocol EXPersisting {
    func add(_ item: Expense)
    func remove(_ item: Expense)
    func saveCahangesInStorage()
}
