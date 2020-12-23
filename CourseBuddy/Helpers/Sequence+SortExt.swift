//
//  Collection+SortExt.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import Foundation

extension Sequence {
    func sort<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            return a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}
