import XCTest
import WolfPipe

class Tests: XCTestCase {
    class TestError: Error { }

    func testClosure() {
        XCTAssert(2 |> { $0 + 2 } == 4)
    }

    func testAppendFilter() {
        func filterOrThrow(i: Int) throws -> Bool {
            if i > 100 { throw TestError() }
            return i > 2
        }

        let a = [1, 2, 3]
        //a.append(4).append(5) // Doesn't work
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
        let c = a |> sorted( > )
        let d = try! a |> sorted(compareOrThrow)
        XCTAssert(b == [2, 5, 7, 8])
        XCTAssert(c == [8, 7, 5, 2])
        XCTAssert(d == [2, 5, 7, 8])
    }

    func testMap() {
        func multiplyOrThrow(a: Int) throws -> Double {
            if a > 100 { throw TestError() }
            return Double(a) * 1.5
        }

        let a = [1, 2, 3, 4]
        let b = a |> map({ Double($0) * 1.5 })
        let c = try! a |> map(multiplyOrThrow)
        XCTAssert(b == [1.5, 3.0, 4.5, 6.0])
        XCTAssert(c == [1.5, 3.0, 4.5, 6.0])
    }
}
