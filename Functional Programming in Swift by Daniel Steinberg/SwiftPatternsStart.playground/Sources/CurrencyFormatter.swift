import Foundation

public class CurrencyFormatter: NumberFormatter {
    public init(for locale: Locale) {
        super.init()
        numberStyle = .currency
        self.locale = locale
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

