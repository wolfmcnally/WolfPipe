//
//  PipeCompatibleFunctions.swift
//  WolfPipe
//
//  Created by Wolf McNally on 09/05/2018.
//  Copyright © 2018 Wolf McNally. All rights reserved.
//

import Foundation

public func append<T, C>(_ e: T) -> (C) -> C where C: RangeReplaceableCollection, C.Element == T {
    return { c in
        var d = c
        d.append(e)
        return d
    }
}

public func filter<T, C>(_ isIncluded: @escaping (T) -> Bool) -> (C) -> C where C: RangeReplaceableCollection, C.Element == T {
    return { c in
        return c.filter(isIncluded)
    }
}

public func filter<T, C>(_ isIncluded: @escaping (T) throws -> Bool) rethrows -> (C) throws -> C where C: RangeReplaceableCollection, C.Element == T {
    return { c in
        return try c.filter(isIncluded)
    }
}
