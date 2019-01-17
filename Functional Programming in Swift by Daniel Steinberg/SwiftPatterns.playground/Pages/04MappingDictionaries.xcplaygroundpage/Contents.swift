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

let worstToFirst = hoursForTheWeek.sorted{(entry1, entry2) in  entry1.value < entry2.value}
worstToFirst.description

let alphabeticalDays
    = Dictionary(grouping: hoursForTheWeek.keys){day in
        day.firstLetter
}
alphabeticalDays.description

let result1 = hoursForTheWeek.map{(day, hours) in
    pay15for(hours)
}
result1.description

let result2 = hoursForTheWeek.map{(day, hours) in
    (day, pay15for(hours))
}
result2.description

let result3 = hoursForTheWeek.mapValues{hours in
    pay15for(hours)
}
result3.description






//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
