//
//  ObservableStorage.swift
//  
//
//  Created by Дмитрий Папков on 19.07.2021.
//

import SwiftUI

class ObservableStorage {
    static let shared: ObservableStorage = .init()
    
    private var storage: [String: ObservableObjectItem]
    
    init() {
        self.storage = [:]
    }
    
    subscript(key: String) -> ObservableObjectItem? {
        get { self.storage[key] }
        set { self.storage[key] = newValue }
    }
}
