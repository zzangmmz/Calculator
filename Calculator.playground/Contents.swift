import UIKit

protocol AbstractOperation {
    func addOperation(_ a: Double, _ b: Double) -> Double
    func subSubtractOperation(_ a: Double, _ b: Double) -> Double
    func multiplyOperation(_ a: Double, _ b: Double) -> Double
    func divideOperation(_ a: Double, _ b: Double) -> Double
}

class Calculator: AbstractOperation {
    func addOperation(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func subSubtractOperation(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    func multiplyOperation(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
    
    func divideOperation(_ a: Double, _ b: Double) -> Double {
        return a / b
    }
}

let calculator = Calculator()

print(calculator.addOperation(10, 20))
print(calculator.subSubtractOperation(10, 20))
print(calculator.multiplyOperation(10, 20))
print(calculator.divideOperation(10, 20))
