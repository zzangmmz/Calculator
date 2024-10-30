import UIKit

protocol AbstractOperation {
    func addOperation(_ a: Double, _ b: Double) -> Double
    func subSubtractOperation(_ a: Double, _ b: Double) -> Double
    func multiplyOperation(_ a: Double, _ b: Double) -> Double
    func divideOperation(_ a: Double, _ b: Double) throws -> Double
}

enum CalculatorError: Error {
    case zeroDivided
    case dividedByZero
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
    
    func divideOperation(_ a: Double, _ b: Double) throws -> Double {
        if a == 0 {
            throw CalculatorError.zeroDivided
        } else if b == 0 {
            throw CalculatorError.dividedByZero
        }
        return a / b
    }
}

let calculator = Calculator()

do {
    print(calculator.addOperation(10, 20))
    print(calculator.subSubtractOperation(10, 20))
    print(calculator.multiplyOperation(10, 20))
    print(try calculator.divideOperation(10, 20))
    print(try calculator.divideOperation(10, 0))
    print(try calculator.divideOperation(0, 10)) // 윗줄에서 에러가 발생해 catch문으로 이동하기 때문에 이 코드는 실행되지 않음.
} catch CalculatorError.zeroDivided {
    print("0을 나눴습니다.")
} catch CalculatorError.dividedByZero {
    print("0으로 나눴습니다.")
}

do {
    print(try calculator.divideOperation(0, 10)) // 다른 에러 케이스 검출되는지 검사
} catch CalculatorError.zeroDivided {
    print("0을 나눴습니다.")
} catch CalculatorError.dividedByZero {
    print("0으로 나눴습니다.")
}

