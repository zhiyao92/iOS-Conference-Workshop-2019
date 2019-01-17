//: ### FlatMapping Optionals
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

enum Weekdays: String, CustomStringConvertible {
    case mon, tue, wed, thu, fri
    var description: String {
        return rawValue
    }
}

let joansDays = [Weekdays.mon, .tue, .fri]
let davesDays = [Weekdays.tue, .wed, .fri]
let marysDays = [Weekdays.mon, .wed, .fri]
let fredsDays = [Weekdays.mon, .tue, .wed]

let schedule = ["Joan": joansDays, "Dave": davesDays,
                "Mary": marysDays, "Fred": fredsDays]

let joan = schedule["Joan"]

let joanFirstMap = joan.map { $0.first }
// Optional(Optional(mon))

extension Optional {
    func myMap<Output>(_ transform: (Wrapped) -> Output?) -> Output? {
        switch self {
        case .none:
            return .none
        case .some(let value):
            return transform(value)
        }
    }

}
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)




