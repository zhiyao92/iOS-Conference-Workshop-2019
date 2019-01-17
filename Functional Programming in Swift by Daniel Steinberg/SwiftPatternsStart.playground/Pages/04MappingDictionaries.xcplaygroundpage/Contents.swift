//: ### Mapping Dictionaries
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

enum Weekdays: String, CustomStringConvertible {
    case mon, tue, wed, thu, fri
    var description: String {
        return rawValue
    }
    var firstLetter: Character {
        return self.rawValue.first!
    }
}

let hoursForTheWeek = [Weekdays.mon: 3.5.hours,
                       .tue: 10.hours, .wed: 7.hours,
                       .thu: 12.hours, .fri: 4.6.hours]

let result2 = hoursForTheWeek.mapValues{hours in pay15for(hours)}
result2.description

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
