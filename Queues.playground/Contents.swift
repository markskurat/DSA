import UIKit


struct Queue<T> {
    var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    init() { }
    
    mutating func enqueue(_ element: T) -> Bool{
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

// FOR DISPLAY PURPOSES
extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

var queue = Queue<Int>()

queue.enqueue(90)
queue.enqueue(76)
queue.enqueue(34)
print(queue)

queue.dequeue()
print(queue)
