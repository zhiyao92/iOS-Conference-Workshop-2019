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

let daysForTeamMap = team.map{name in schedule[name]}
daysForTeamMap

print(daysForTeamMap)

extension Sequence {
    func changed<Output>(_ f: (Element) -> Output?) -> [Output] {
        var output = [Output]()
        for element in self {
            if let newElement = f(element) {
                output.append(newElement)
            }
        }
        return output
    }
}

let daysForTeamChanged = team.changed{name in schedule[name]}
daysForTeamChanged
print(daysForTeamChanged)

let daysForTeamCompactMap = team.compactMap{name in schedule[name]}
daysForTeamCompactMap

let daysForTeamCompactMap2
    = team.map{name in schedule[name]}
        .filter{days in days != nil}
        .map{value in value!}



let daysForTeam = team.compactMap{name in schedule[name]}.flatMap{$0}
print(daysForTeam)

print(Set(daysForTeam))


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


