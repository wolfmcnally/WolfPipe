import XCTest
import WolfPipe

class Tests: XCTestCase {
    func test1() {
        func addTwo(to i: Int) -> Int {
            return i + 2
        }

        XCTAssert(2 |> addTwo == 4)
    }

    func test2() {
        func filterOrThrow(i: Int) throws -> Bool {
            if i > 100 {
                throw NSError(domain: "None", code: 1)
            }
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
}
