//
//  PipeCompatibleFunctions.swift
//  WolfPipe
//
//  Created by Wolf McNally on 09/05/2018.
//  Copyright © 2018 Wolf McNally. All rights reserved.
//

import Foundation

/// Curried version of `append`.
public func append<E, C>(_ e: E) -> (C) -> C where C: RangeReplaceableCollection, C.Element == E {
    return { c in
        var d = c
        d.append(e)
        return d
    }
}

/// Curried version of `filter`.
public func filter<E, C>(_ isIncluded: @escaping (E) -> Bool) -> (C) -> C where C: RangeReplaceableCollection, C.Element == E {
    return { c in
        return c.filter(isIncluded)
    }
}

/// Curried version of `filter`, taking a throwing functor.
public func filter<E, C>(_ isIncluded: @escaping (E) throws -> Bool) rethrows -> (C) throws -> C where C: RangeReplaceableCollection, C.Element == E {
    return { c in
        return try c.filter(isIncluded)
    }
}

/// Curried version of `sorted` for `Array` with `Comparable` elements.
public func sorted<E>(_ a: [E]) -> [E] where E: Comparable {
    return a.sorted()
}

/// Curried version of `sorted` for `Array`, taking a custom compare functor.
public func sorted<E>(_ by: @escaping (E, E) -> Bool) -> ([E]) -> [E] {
    return { a in
        return a.sorted(by: by)
    }
}

/// Curried version or `sorted` for `Array`, taking a custom throwing compare functor.
public func sorted<E>(_ by: @escaping (E, E) throws -> Bool) rethrows -> ([E]) throws -> [E] {
    return { a in
        return try a.sorted(by: by)
    }
}

/// Curried version of `map`.
public func map<E1, E2, S>(_ transform: @escaping (E1) -> E2) -> (S) -> [E2] where S: Sequence, S.Element == E1 {
    return { s in
        return s.map(transform)
    }
}

/// Curried version of `map`, taking a throwing functor.
public func map<E1, E2, S>(_ transform: @escaping (E1) throws -> E2) rethrows -> (S) throws -> [E2] where S: Sequence, S.Element == E1 {
    return { s in
        return try s.map(transform)
    }
}
