import UIKit
import Foundation
import Darwin

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() { }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    mutating func append(value: Value) {
        guard !isEmpty else {
            push(value: value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value: value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// FOR DISPLAY PURPOSES
extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
        
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {

        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

var list = LinkedList<Int>()

print("Before appending")
list.push(value: 34)
list.push(value: 90)
list.push(value: 12)
print(list)

print("After appending")
list.append(value: 89)
print(list)

print("After inserting")
var middleNode = list.node(at: 1)
list.insert(999, after: middleNode!)
print(list)

print("After popping")
list.pop()
print(list)

print("After removing last")
list.removeLast()
print(list)

print("After removing")
var index = 1
var node = list.node(at: index - 1)
var removedValue = list.remove(after: node!)
print(list)
