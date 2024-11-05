import UIKit

// 프로토콜 구현.
protocol AbstractOperation {
    func operation(_ a: Double, _ b: Double) throws -> Double
}
    
// 나눗셈에서 발생할 수 있는 에러 열거형 구현.
enum CalculatorError: Error {
    case dividedByZero  // 0으로 나눴을 때 (a / 0)
}

final class AddOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) throws -> Double {
        return a + b
    }
}

final class SubtractOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) throws -> Double {
        return a - b
    }
}

final class MultiplyOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) throws -> Double {
        return a * b
    }
}

final class DivideOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) throws -> Double {
        guard b != 0 else { throw CalculatorError.dividedByZero }
        return a / b
    }
}

class Calculator {
    var operation: AbstractOperation?
    
    func operate(_ a: Double, _ b: Double) throws -> Double {
        try operation!.operation(a, b)
    }
}

let addOperator = AddOperation()
let subOperator = SubtractOperation()
let multiplyOperator = MultiplyOperation()
let divideOperator = DivideOperation()

let calculator = Calculator()

do {
    calculator.operation = addOperator
    print(try calculator.operate(10, 20))
    
    calculator.operation = subOperator
    print(try calculator.operate(10, 20))
    
    calculator.operation = multiplyOperator
    print(try calculator.operate(10, 20))
    
    calculator.operation = divideOperator
    print(try calculator.operate(10, 20))
    print(try calculator.operate(10, 0))
} catch CalculatorError.dividedByZero {
    print("0으로 나눴습니다.")
}

