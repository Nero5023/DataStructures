import Foundation

protocol QueueType {
    typealias Element
    mutating func dequeue() -> Element?
    mutating func enqueue(newElement: Element)
}


struct Queue<Element>: QueueType {
    private var left: [Element]
    private var right: [Element]
    
    var isEmpyy: Bool {
        get {
            return left.isEmpty && right.isEmpty
        }
    }
    
    init() {
        left = []
        right = []
    }
    
    mutating func enqueue(newElement: Element) {
        right.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !(left.isEmpty && right.isEmpty) else { return nil }
        if left.isEmpty {
            left = right.reverse()
            right.removeAll(keepCapacity: true)
        }
        return left.removeLast()
    }
    
    
}

let queue = Queue<Int>()
