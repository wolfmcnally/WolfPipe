//
//  Curry.swift
//  WolfPipe
//
//  Created by Wolf McNally on 11/8/18.
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

/// Takes a 2-argument function and returns a function that takes
/// the first argument and returns a function that takes the second argument
/// and returns the result.
///
/// Used to take two-argument functions and produce a single-argument function for
/// use with the pipe operator.
public func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in { b in f(a, b) } }
}

/// Takes a function taking A and returning a function that takes B and returns C,
/// and returns a function taking B and returning a function that takes A and returns C.
///
/// The produced result C is the same.
///
/// Used for flipping the arguments of existing functions when currying.
func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    return { b in { a in f(a)(b) } }
}

/// Takes a function taking A and returning a function that takes no arguments and returns C,
/// and returns a function taking no arguments and returning a function taking A and returning C.
func flip<A, C>(_ f: @escaping (A) -> () -> C) -> () -> (A) -> C {
    return { { a in f(a)() } }
}

/// Takes a function taking no arguments and returning A, calls the function and
/// returns the result.
func zurry<A>(_ f: () -> A) -> A {
    return f()
}
