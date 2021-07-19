//
//  DynamicObservableObject.swift
//  
//
//  Created by Дмитрий Папков on 19.07.2021.
//

import Foundation

public protocol DynamicObservableObject: ObservableObjectItem {
    static func publisherKey(_ identity: String) -> String
    static func createPublisher(_ identity: String) -> Self
}

public extension DynamicObservableObject {
    static func getPublisher(_ identity: String) -> Self {
        Self.getPublisher(key: publisherKey(identity)) {
            Self.createPublisher(identity)
        }
    }
}
