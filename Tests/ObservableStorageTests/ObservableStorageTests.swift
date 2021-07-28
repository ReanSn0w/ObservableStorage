import XCTest
@testable import ObservableStorage

final class PublisherStorageTests: XCTestCase {
    func testIdenticalPublishers() {
        let dynamic = Dynamic.getPublisher("test")
        let secondDynamic = Dynamic.getPublisher("test")
        
        XCTAssertIdentical(dynamic, secondDynamic)
    }
    
    func testIdenticalPublishers2() {
        let dynamic = DynamicInt.getPublisher(100)
        let secondDynamic = DynamicInt.getPublisher(100)
        
        XCTAssertIdentical(dynamic, secondDynamic)
    }
    
    func testIdenticalContent() {
        let dynamic = Dynamic.getPublisher("test")
        let secondDynamic = Dynamic.getPublisher("test")
        
        XCTAssertEqual(dynamic.id, secondDynamic.id)
    }
    
    func testNotIdenticalContent() {
        let dynamic = Dynamic.getPublisher("test")
        let secondDynamic = Dynamic.getPublisher("test 2")
        
        XCTAssertNotEqual(dynamic.id, secondDynamic.id)
    }
}

final class Dynamic {
    var id: String
    
    init(id: String) {
        self.id = id
    }
}

extension Dynamic: DynamicObservableObject {
    static func publisherKey(_ identity: String) -> String {
        "\(identity)"
    }
    
    static func createPublisher(_ identity: String) -> Dynamic {
        Dynamic(id: identity)
    }
}

final class DynamicInt {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}

extension DynamicInt: DynamicObservableObject {
    typealias IdentityType = Int
    
    static func publisherKey(_ identity: Int) -> String {
        "dynamic_int_\(identity)"
    }
    
    static func createPublisher(_ identity: Int) -> DynamicInt {
        DynamicInt(id: identity)
    }
}
