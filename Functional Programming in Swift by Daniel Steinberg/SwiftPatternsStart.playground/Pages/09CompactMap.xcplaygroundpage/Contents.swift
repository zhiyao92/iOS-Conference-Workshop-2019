//: ### CompactMap 
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

let team = ["Joan", "Mike", "Dave", "Anna"]

let daysForTeamMap = team.map{ name in schedule[name] }
// [Optional([mon, tue, fri]), nil, Optional([tue, wed, fri]), nil]

let daysForTeamCompact = team.compactMap{ name in schedule[name] }.flatMap{$0}
// [[mon, tue, fri], [tue, wed, fri]]
// .flatmap [mon, tue, fri, tue, wed, fri]








//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


