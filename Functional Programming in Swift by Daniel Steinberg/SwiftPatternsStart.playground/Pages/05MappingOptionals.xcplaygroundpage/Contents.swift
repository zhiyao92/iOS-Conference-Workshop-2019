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

let hoursForTheWeek = [Weekdays.mon: 3.5.hours,
                       .tue: 10.hours, .thu: 12.hours]
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

