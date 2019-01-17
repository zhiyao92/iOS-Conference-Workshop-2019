//: ### Our Own FlatMap
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}
enum Weekdays: String, CustomStringConvertible {
    case mon, tue, wed, thu, fri
    var description: String {
        return rawValue
    }
}

enum ResultLite<Value> {
    case failure(String)
    case success(Value)
}
extension ResultLite: CustomStringConvertible {
    var description: String {
        switch self {
        case .failure(let errorMessage):
            return "(Error: \(errorMessage))"
        case .success(let value):
            return "(Success: \(value))"
        }
    }
}

extension ResultLite {
    func map<TargetValue>(_ transform: (Value) -> TargetValue) -> ResultLite<TargetValue> {
    switch self {
    case .failure(let errorMessage):
    return ResultLite<TargetValue>.failure(errorMessage)
    case .success(let value):
    return ResultLite<TargetValue>.success(transform(value))
    }
    }
}

let hoursForTheWeek = [Weekdays.mon: 3.5.hours,
                       .tue: 10.hours, .thu: 12.hours,
                       .fri: 0.hours]

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)



