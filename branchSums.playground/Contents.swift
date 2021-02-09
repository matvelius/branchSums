import Foundation

class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    var outputSums = [Int]()
    
    func branchSums(root: BST) -> [Int] {
        findLeaf(node: root, sum: 0)
        return outputSums
    }
    
    func findLeaf(node: BST, sum: Int) {
        let newSum = sum + node.value
        if node.left == nil && node.right == nil {
            outputSums.append(newSum)
        } else if node.right == nil && node.left != nil {
            findLeaf(node: node.left!, sum: newSum)
        } else if node.right != nil && node.left == nil {
            findLeaf(node: node.right!, sum: newSum)
        } else if node.right != nil && node.left != nil {
            findLeaf(node: node.left!, sum: newSum)
            findLeaf(node: node.right!, sum: newSum)
        }
    }
}

var myProgram = Program()
var myBST = Program.BST(value: 0)

myBST.right = Program.BST(value: 1)
myBST.right!.right = Program.BST(value: 10)
myBST.right!.right?.right = Program.BST(value: 100)
print(myProgram.branchSums(root: myBST))
