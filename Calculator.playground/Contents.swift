import UIKit

// 프로토콜 구현.
protocol AbstractOperation {
    // 덧셈, 뺄셈, 곱셈, 나눗셈 함수 뼈대 설계.
    func addOperation(_ a: Double, _ b: Double) -> Double
    func subSubtractOperation(_ a: Double, _ b: Double) -> Double
    func multiplyOperation(_ a: Double, _ b: Double) -> Double
    func divideOperation(_ a: Double, _ b: Double) throws -> Double
}
    
// 나눗셈에서 발생할 수 있는 에러 열거형 구현.
enum CalculatorError: Error {
    case zeroDivided    // 0울 나눴을 때 (0 / b)
    case dividedByZero  // 0으로 나눴을 때 (a / 0)
}

// 프로토콜 채택한 계산기 클래스 구현.
// 덧셈, 뺄셈, 곱셈, 나눗셈 별로 클래스를 만드는 것은 메모리적으로 효율적이지 않다고 판단.
// 4가지 연산을 클래스로 나누어 생성 시, 모든 연산을 수행할 경우 4가지 클래스 각각의 인스턴스 4개가 힙에 올라가지만
// 4가지 연산을 한 클래스 내부의 함수로 구현하면 인스턴스는 1개만이 생성됨.
class Calculator: AbstractOperation {
    // 프로토콜의 덧셈 함수 구현
    func addOperation(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    // 프로토콜의 뺄셈 함수 구현
    func subSubtractOperation(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    // 프로토콜의 곱셈 함수 구현
    func multiplyOperation(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
    
    // 프로토콜의 나눗셈 함수 구현.
    func divideOperation(_ a: Double, _ b: Double) throws -> Double {
        if a == 0 {
            // 0을 나눌 경우의 오류 처리
            throw CalculatorError.zeroDivided
        } else if b == 0 {
            // 0으로 나눌 경우의 오류 처리
            throw CalculatorError.dividedByZero
        }
        // 그 외에는 정상 나눗셈
        return a / b
    }
}

let calculator = Calculator()   // 계산기 인스턴스 생성

do {
    print(calculator.addOperation(10, 20))
    print(calculator.subSubtractOperation(10, 20))
    print(calculator.multiplyOperation(10, 20))
    print(try calculator.divideOperation(10, 20))   // 에러가 발생할 수 있는 코드에 try 키워드 추가.
    print(try calculator.divideOperation(10, 0))
    print(try calculator.divideOperation(0, 10))    // 윗줄에서 에러가 발생해 catch문으로 이동하기 때문에 이 코드는 실행되지 않음.
} catch CalculatorError.zeroDivided {               // 에러 발생 시 해당되는 애러 케이스에 catch됨.
    print("0을 나눴습니다.")
} catch CalculatorError.dividedByZero {
    print("0으로 나눴습니다.")
}

do {
    print(try calculator.divideOperation(0, 10))    // 다른 에러 케이스 검출되는지 검사
} catch CalculatorError.zeroDivided {
    print("0을 나눴습니다.")
} catch CalculatorError.dividedByZero {
    print("0으로 나눴습니다.")
}

