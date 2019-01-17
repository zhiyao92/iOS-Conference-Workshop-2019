import Foundation

public protocol IndividualCurrency {
    static var conversionRateInDollars: Double {get}
    static var formatter: CurrencyFormatter {get}
}


