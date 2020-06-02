//
//  Service1.swift
//  pairProgrammingTests
//
//  Created by Евгений Елчев on 02.06.2020.
//  Copyright © 2020 jonfir. All rights reserved.
//

import XCTest
import Combine
@testable import pairProgramming

protocol PersonServiceInput {
    
    func obtainPeople() -> AnyPublisher<[Person], Error>
    
}

class PersonServiceTests: XCTestCase {
    
    var service: PersonServiceInput!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testObtainPeople() {
        let publisher = service.obtainPeople()
        let exp = expectation(description: "luc ya you otec")
        var success = false
        var error = false
        publisher.sink(receiveCompletion: { completion in
            error = true
            exp.fulfill()
        }) { person in
            success = true
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertNotNil(success)
        XCTAssertNil(error)
    }

}

