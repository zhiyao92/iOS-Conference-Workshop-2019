//: ### FlatMapping Sequences
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


//let scheduleMap = schedule.map{ (key, days) in
//    days
//}
let scheduleMap = schedule.map{$0.value}
scheduleMap

extension Sequence {
    func changed<Output>(by f: (Element) -> [Output]) -> [Output] {
        var output = [Output]()
        for element in self {
            output.append(contentsOf: f(element))
        }
        return output
    }
}

let scheduleChanged = schedule.changed{$0.value}
scheduleChanged

let scheduleFlatMap = schedule.flatMap{$0.value}

scheduleFlatMap



let coveredDays = Array(Set(scheduleFlatMap))


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)



