import UIKit

protocol AbstractOperation {
    func addOperation(_ a: Double, _ b: Double) -> Double
    func subSubtractOperation(_ a: Double, _ b: Double) -> Double
    func multiplyOperation(_ a: Double, _ b: Double) -> Double
    func divideOperation(_ a: Double, _ b: Double) throws -> Double
}
