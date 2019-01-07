//
//  KeyPaths.swift
//  WolfPipe
//
//  Created by Wolf McNally on 11/9/18.
//

/// Takes a writable key path from a Root to a Value.
/// Returns a function that takes a function that transforms a Value to a Value and returns
/// a function that transforms a Root to a Root.
func prop<Root, Value>(_ kp: WritableKeyPath<Root, Value>)
    -> (@escaping (Value) -> Value)
    -> (Root) -> Root {

        return { update in
            { root in
                var copy = root
                copy[keyPath: kp] = update(copy[keyPath: kp])
                return copy
            }
        }
}

/// Takes a key path from a Root to a Value,
/// Returns a function from that Root to that Value.
func get<Root, Value>(_ kp: KeyPath<Root, Value>) -> (Root) -> Value {
    return { root in
        root[keyPath: kp]
    }
}

func their<Root, Value>(_ f: @escaping (Root) -> Value, _ g: @escaping (Value, Value) -> Bool) -> (Root, Root) -> Bool {
        return { g(f($0), f($1)) }
}
