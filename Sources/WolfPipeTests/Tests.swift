//
//  Tests.swift
//  WolfPipe_Tests
//
//  Created by Wolf McNally on 09/05/2018.
//  Copyright © 2018 Wolf McNally.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest
import WolfPipe

class Tests: XCTestCase {
    class TestError: Error { }

    func testClosure() {
        XCTAssert("dog" |> { a -> String in a + "cat" } == "dogcat")
    }

    func testAppendFilter() {
        func filterOrThrow(i: Int) throws -> Bool {
            if i > 100 { throw TestError() }
            return i > 2
        }

        let a = [1, 2, 3]

        let b = a |> append(4) |> append(5)
        XCTAssert(b == [1, 2, 3, 4, 5])

        let c = b |> filter({ $0 > 2 })
        XCTAssert(c == [3, 4, 5])

        let d = try! b |> filter(filterOrThrow)
        XCTAssert(d == [3, 4, 5])
    }

    func testSorted() {
        func compareOrThrow(a: Int, b: Int) throws -> Bool {
            if a > 100 || b > 100 { throw TestError() }
            return a < b
        }

        let a = [5, 8, 2, 7]

        let b = a |> sorted
        XCTAssert(b == [2, 5, 7, 8])

        let c = a |> sorted( > )
        XCTAssert(c == [8, 7, 5, 2])

        let d = try! a |> sorted(compareOrThrow)
        XCTAssert(d == [2, 5, 7, 8])
    }

    func testMap() {
        func multiplyOrThrow(a: Int) throws -> Double {
            if a > 100 { throw TestError() }
            return Double(a) * 1.5
        }

        let a = [1, 2, 3, 4]

        let b = a |> map({ Double($0) * 1.5 })
        XCTAssert(b == [1.5, 3.0, 4.5, 6.0])

        let c = try! a |> map(multiplyOrThrow)
        XCTAssert(c == [1.5, 3.0, 4.5, 6.0])
    }

    func testReduce() {
        func addOrThrow(a: Int, b: Int) throws -> Int {
            if a > 100 || b > 100 { throw TestError() }
            return a + b
        }

        let a = [1, 2, 3, 4]

        let b = a |> reduce(0, { $0 + $1 })
        XCTAssert(b == 10)

        let c = try! a |> reduce(0, addOrThrow)
        XCTAssert(c == 10)
    }
}
