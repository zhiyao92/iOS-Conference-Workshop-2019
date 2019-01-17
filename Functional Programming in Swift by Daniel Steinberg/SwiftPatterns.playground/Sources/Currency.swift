import Foundation

public struct Currency<T: IndividualCurrency> {
    public let value: Double
    
    public init(_ value: Double) {
        self.value = value
    }
    public var perHour: Rate {
        return Rate(self)
    }
    
    public struct Rate {
        public let amount: Currency
        public var value: Double {
            return amount.value
        }
        public init(_ amount: Currency) {
            self.amount = amount
        }
    }
}
extension Currency: CustomStringConvertible {
    public var description: String {
        guard let formattedCurrency
            = T.formatter.string(for: value)
            else {fatalError("Could not format Double")}
        return formattedCurrency
    }
}

extension Currency { // addition
    public static func +(lhs: Currency, rhs: Currency) -> Currency {
        return Currency(lhs.value + rhs.value)
    }
}

extension Currency.Rate { // Multiply hours and rate
    public static func *(hours: Hours, rate: Currency.Rate) -> Currency {
        return Currency(hours.value * rate.value)
    }
    public static func *(rate: Currency.Rate, hours: Hours) -> Currency {
        return hours * rate
    }
}
extension Currency { // Convert and Combine
    public func converted<U: IndividualCurrency>(to targetCurrency: U.Type) -> Currency<U> {
        return Currency<U>(value * T.conversionRateInDollars
            /  U.conversionRateInDollars)
    }
    public static func +<V>(currency1: Currency,
                            currency2: Currency<V>)
        -> Currency {
            let convertedCurrency2 = currency2.converted(to: T.self)
            return currency1 + convertedCurrency2
    }
}
extension Currency.Rate: CustomStringConvertible {
    public var description: String {
        return "\(amount) per hour"
    }
}

