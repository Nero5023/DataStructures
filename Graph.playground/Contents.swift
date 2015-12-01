//: Playground - noun: a place where people can play

import UIKit
import Foundation

struct Vertex<T> {
    var data: T
    var edges: [Int]
}

struct Graph<T> {
    private var vertexs: [Vertex<T>]
    init?(datas: [T], edges: [[Int]]) {
        guard datas.count == edges.count else {
            return nil
        }
        
        self.vertexs = [Vertex<T>]()
        for (num, data) in datas.enumerate() {
            let vertex = Vertex(data: data, edges: edges[num])
            self.vertexs.append(vertex)
        }
    }
    
  
    
    func dfsTraverse(visitedFunc:(T)->Void) {
        var visited = [Bool](count: self.vertexs.count, repeatedValue: false)
        for i in 0 ..< self.vertexs.count {
            if !visited[i] {
                dfs(i, visited: &visited, visitFunc: visitedFunc)
            }
        }
    }
    
    private func dfs(index: Int, inout visited: [Bool], visitFunc: (T) -> Void) {
        visitFunc(vertexs[index].data)
        visited[index] = true
        for i in 0 ..< vertexs[index].edges.count {
            if !visited[i] {
                dfs(i, visited: &visited, visitFunc: visitFunc)
            }
        }
    }
    
    func bfsTraverse(startIndex: Int, visitFunc: T -> Void) {
        var queue = Queue<Int>()
        var visited = [Bool](count: self.vertexs.count, repeatedValue:false)
        visitFunc(vertexs[startIndex].data)
        visited[startIndex] = true
        queue.enqueue(startIndex)
        while let index = queue.dequeue() {
            for i in vertexs[index].edges {
                if !visited[i] {
                    visitFunc(vertexs[i].data)
                    visited[i] = true
                    queue.enqueue(i)
                }
            }
        }
        
    }
    
}



let datas = [0,1,2,3,4,5,6,7]
let edges = [
    [1,3,4],
    [0,2,4],
    [1,5],
    [0,4,6],
    [1,3],
    [2],
    [3,7],
    [6]
]

let graph = Graph(datas: datas, edges: edges)

if let g = graph {
    print("dfs:")
    g.dfsTraverse {
        print($0)
    }
    print("bfs:")
    g.bfsTraverse(0) {
        print($0)
    }
}





