//
//  ObservableStorage.swift
//  
//
//  Created by Дмитрий Папков on 19.07.2021.
//

import SwiftUI

public class ObservableStorage {
    public static let shared: ObservableStorage = .init()
    
    private var storage: [String: ObservableObjectItem]
    
    init() {
        self.storage = [:]
    }
    
    subscript(key: String) -> ObservableObjectItem? {
        get { self.storage[key] }
        set { self.storage[key] = newValue }
    }
    
    public func removeValue(forKey key: String) {
        self.storage.removeValue(forKey: key)
    }
    
    public func removeAll(where delete: (ObservableObjectItem) -> Bool = { _ in return true }) {
        for (key, value) in storage {
            if delete(value) {
                storage.removeValue(forKey: key)
            }
        }
    }
}
