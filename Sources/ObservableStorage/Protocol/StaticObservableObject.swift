//
//  StaticObservalbeObject.swift
//  
//
//  Created by Дмитрий Папков on 19.07.2021.
//

import Foundation

public protocol StaticObservalbeObject: ObservableObjectItem {
    static var publisherKey: String { get }
    static func createPublisher() -> Self
}

public extension StaticObservalbeObject {
    static func getPublisher() -> Self {
        Self.getPublisher(key: publisherKey) {
            createPublisher()
        }
    }
}
