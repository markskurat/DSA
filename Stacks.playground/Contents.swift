import UIKit
import Foundation


struct Stack<Element> {
    private var storage: [Element] = []
    init() { }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}



// FOR DISPLAY PURPOSES

extension Stack: CustomStringConvertible {
    
    var description: String {
        
        let topDivider = "------top--------\n"
        let bottomDivider = "\n---------"
        
        let stackElements = storage.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
  

var stack = Stack<Int>()

stack.push(45)
stack.push(67)
stack.push(8)
stack.push(23)
print(stack)

stack.pop()
print(stack)
