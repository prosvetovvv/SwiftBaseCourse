//
//  Lesson6.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 15.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

// Create type generic Queue, using closure and subscripting

import Foundation

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue (_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue () -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
    
    subscript (element: Int) -> T? {
        guard element >= 0 else { return nil }
        guard element <= self.elements.count - 1 else { return nil }
        return self.elements[element]
    }
    
    func filterByOdometer (closure: (T) -> Bool) -> [T] {
        var resultArray = [T]()
        
        for element in self.elements {
            if closure(element) {
                resultArray.append(element)
            }
        }
        return resultArray        
    }
}




