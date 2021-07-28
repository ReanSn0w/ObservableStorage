//
//  DynamicObservableObject.swift
//  
//
//  Created by Дмитрий Папков on 19.07.2021.
//

import Foundation

public protocol DynamicObservableObject: ObservableObjectItem {
    associatedtype IdentityType: Hashable
    
    static func publisherKey(_ identity: IdentityType) -> String
    static func createPublisher(_ identity: IdentityType) -> Self
}

public extension DynamicObservableObject {
    static func getPublisher(_ identity: IdentityType) -> Self {
        Self.getPublisher(key: publisherKey(identity)) {
            Self.createPublisher(identity)
        }
    }
}
