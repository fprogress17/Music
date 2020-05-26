//
//  musicTests.swift
//  musicTests
//
//  Created by Choonghun Lee on 5/9/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import XCTest
@testable import music


enum SomeError: Error {
    case FileError
    case FError
}

class musicTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       
        guard let bundlePath =  Bundle(for: type(of: self)).path(forResource: name, ofType: "json") else {
                      throw SomeError.FileError
                  }
                  
        guard let jsonString = try? String(contentsOfFile: bundlePath, encoding: .utf8) else {
                   throw SomeError.FileError
              }
              
        guard let loadedData = jsonString.data(using: .utf8) else {
                   throw SomeError.FileError
              }
        
        
        guard let posts = try? JSONDecoder().decode(JSON.self, from: loadedData) else{
              throw SomeError.FileError
        }
            let items = posts.feed.results
            
            XCTAssertEqual(items[0].artistName,"Lady Gaga", "result 0 artiest name is wrong")
         
            
       
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func readLocalFile(forName name: String) -> Data? {
     //   do {

        guard let bundlePath =  Bundle(for: type(of: self)).path(forResource: name, ofType: "json") else {
                 print(" loading error")
                fatalError("UnitTestData.json not found")
            }
            
        guard let jsonString = try? String(contentsOfFile: bundlePath, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        
       guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
        
        return jsonData
 
    }
    

}
