//
//  TestCommon.swift
//  TweetleDumb
//
//  Created by Ian Keen on 2017-06-12.
//  Copyright © 2017 Mustard. All rights reserved.
//

import XCTest
@testable import TweetleDumb

enum TestError: Error, Equatable {
    case error
    
    static func ==(lhs: TestError, rhs: TestError) -> Bool {
        return true
    }
}

func XCTAssertThrows<T: Error>(file: StaticString = #file, line: UInt = #line, error: T, when closure: () throws -> Void) {
    do {
        try closure()
        XCTFail(file: file, line: line)

    } catch let e as T {
        XCTAssertEqual(String(describing: error), String(describing: e), file: file, line: line)

    } catch {
        XCTFail(file: file, line: line)
    }
}

extension XCTestExpectation {
    func fulfill<T>(when left: T, equals right: T, file: StaticString = #file, line: UInt = #line) {
        fulfill(when: String(describing: left), equals: String(describing: right), file: file, line: line)
    }
    func fulfill<T: Equatable>(when left: T, equals right: T, file: StaticString = #file, line: UInt = #line) {
        if left == right {
            fulfill()
        } else {
            XCTFail(file: file, line: line)
        }
    }
    func fulfill(file: StaticString = #file, line: UInt = #line, when predicate: () -> Bool) {
        if predicate() {
            fulfill()
        } else {
            XCTFail(file: file, line: line)
        }
    }
}
