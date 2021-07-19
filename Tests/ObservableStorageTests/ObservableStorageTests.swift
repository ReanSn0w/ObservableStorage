import XCTest
@testable import ObservableStorage

final class PublisherStorageTests: XCTestCase {
    func testIdenticalPublishers() {
        let dynamic = Dynamic.getPublisher("test")
        let secondDynamic = Dynamic.getPublisher("test")
        
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
