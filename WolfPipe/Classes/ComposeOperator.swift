//
//  ComposeOperator.swift
//  WolfPipe
//
//  Created by Wolf McNally on 11/5/18.
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

import Foundation


infix operator >>> : ForwardCompositionPrecedence

precedencegroup ForwardCompositionPrecedence {
    associativity: left
    higherThan: ForwardApplicationPrecedence
}

public func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    return { g(f($0)) }
}

public func >>> <A, B, C>(f: @escaping (A) throws -> B, g: @escaping (B) throws -> C) -> ((A) throws -> C) {
    return { try g(f($0)) }
}


infix operator <> : SingleTypeCompositionPrecedence

precedencegroup SingleTypeCompositionPrecedence {
    associativity: left
    higherThan: ForwardApplicationPrecedence
}

func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { f($0); g($0) }
}

func <> <A: AnyObject>(f: @escaping (A) throws -> Void, g: @escaping (A) throws -> Void) -> (A) throws -> Void {
    return { try f($0); try g($0) }
}

func <> <A>(f: @escaping (inout A) -> Void, g: @escaping (inout A) -> Void) -> (inout A) -> Void {
    return { f(&$0); g(&$0) }
}

func <> <A>(f: @escaping (inout A) throws -> Void, g: @escaping (inout A) throws -> Void) -> (inout A) throws -> Void {
    return { try f(&$0); try g(&$0) }
}

func <> <A>(f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
    return f >>> g
}

func <> <A>(f: @escaping (A) throws -> A, g: @escaping (A) throws -> A) -> (A) throws -> A {
    return f >>> g
}
