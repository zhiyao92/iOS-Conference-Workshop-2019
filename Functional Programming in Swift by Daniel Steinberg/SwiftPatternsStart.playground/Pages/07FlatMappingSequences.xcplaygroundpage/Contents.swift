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

let scheduleMap = schedule.map{ (_, days) in days }
// [[tue, wed, fri], [mon, wed, fri], [mon, tue, wed], [mon, tue, fri]]


let scheduleFlatMap = schedule.flatMap { (_, days) in days }
// [mon, tue, fri, mon, wed, fri, tue, wed, fri, mon, tue, wed]

print (Set(scheduleFlatMap))
// [mon, tue, wed, fri]

extension Sequence {
    func myMap<Output>(_ transform: (Element) -> Output) -> [Output] {
        var output = [Output]()
        for element in self {
            output.append(transform(element))
        }
        return output
    }

    func myFlatMap<Output>(_ transform: (Element) -> [Output]) -> [Output] {
        var output = [Output]()
        for element in self {
            output.append(contentsOf: transform(element))
        }
        return output
    }

    func myCompactMap<Output>(_ transform: (Element) -> Output?) -> [Output] {
        var output = [Output]()
        for element in self {
            if let newElement = transform(element) {
                output.append(newElement)
            }
        }
        return output
    }
}


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)



