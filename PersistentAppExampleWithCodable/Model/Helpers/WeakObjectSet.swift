//
//  WeakObjectSet.swift
//  Teste SwiftUI
//
//  Created by Ricardo Almeida Venieris on 04/05/24.
//

import Foundation


protocol WeakWrappedType: AnyObject, Identifiable {}
class WeakObject<T: WeakWrappedType>: Equatable, Hashable {
    weak var object: T?
    init(object: T) { self.object = object }

    func hash(into hasher: inout Hasher) {
        if let object { hasher.combine(object.id) }
    }

    static func == (lhs: WeakObject<T>, rhs: WeakObject<T>) -> Bool {
        return lhs.object === rhs.object
    }
}



class WeakObjectSet<T: WeakWrappedType> {
    private var _objects: Set<WeakObject<T>>
    var objects: [T] {
        reap()
        return _objects.compactMap { $0.object }
    }
    
    
    var isEmpty: Bool {reap(); return _objects.isEmpty}
    var count: Int  {reap(); return _objects.count}
    var capacity: Int {_objects.capacity}

    
    

    init() {
        self._objects = Set<WeakObject<T>>([])
    }

    init(objects: [T]) {
        self._objects = Set<WeakObject<T>>(objects.map { WeakObject(object: $0) })
    }

    func contains(_ object: T) -> Bool {
        return self._objects.contains(WeakObject(object: object))
    }

    func object(id: T.ID) -> T? {
        return self._objects.first(where: {$0.object?.id == id})?.object
    }

    func insert(_ object: T) {
        self._objects.insert(WeakObject(object: object))
    }

    func insert(_ objects: any Sequence<T>) {
        self._objects.formUnion(objects.map { WeakObject(object: $0) })
    }
    
    func reap () {
        self._objects = self._objects.filter { $0.object != nil}
      }
}
