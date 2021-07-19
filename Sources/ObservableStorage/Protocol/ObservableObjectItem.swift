//
//  ObservableObjectItem.swift
//  
//
//  Created by Дмитрий Папков on 19.07.2021.
//

import Foundation

public protocol ObservableObjectItem {}

extension ObservableObjectItem {
    static func getPublisher<ObservableStorageItem: ObservableObjectItem>(
        key: String,
        factory: () -> ObservableObjectItem
    ) -> ObservableStorageItem {
        guard let object = ObservableStorage.shared[key] as? ObservableStorageItem else {
            ObservableStorage.shared[key] = factory()
            return getPublisher(key: key, factory: factory)
        }
        
        return object
    }
}
