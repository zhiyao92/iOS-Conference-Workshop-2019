//: ### Mapping Optionals
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

enum Weekdays: String, CustomStringConvertible {
    case mon, tue, wed, thu, fri
    var description: String {
        return rawValue
    }
}


extension Optional {
    func myMap<Output>(_ transform: (Wrapped) -> Output) -> Output? {
        switch self {
        case .none:
            return .none
        case .some(let value):
            return .some(transform(value))
        }
    }
}

let hoursForTheWeek = [Weekdays.mon: 3.5.hours,
                       .tue: 10.hours, .thu: 12.hours]

//func earningsFor(_ day: Weekdays) -> Euros? {
//    guard let hours = hoursForTheWeek[day] else { return nil }
//    return pay15for(hours)
//}

func earningsFor(_ day: Weekdays) -> Euros? {
    return hoursForTheWeek[day].map(pay15for)
}

earningsFor(.mon)
earningsFor(.wed)

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
