//: ### Result Type
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}
func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
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
                       .tue: 10.hours, .thu: 12.hours]

enum ResultLite<Value> {
    case failure(String)
    case success(Value)
}

func hoursFor(_ day: Weekdays) -> ResultLite<Hours> {
    guard let hours = hoursForTheWeek[day] else { return ResultLite.failure("Not schedule on \(day)") }
    return ResultLite.success(hours)
}

hoursFor(.mon)
hoursFor(.wed)

func earningsFor(_ hours: ResultLite<Hours>) -> ResultLite<Euros> {
    switch hours {
    case .failure(let error):
        return ResultLite.failure(error)
    case .success(let value):
        return ResultLite.success(pay15for(value))
    }
}

earningsFor(hoursFor(.mon))
earningsFor(hoursFor(.wed))

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

let monPay = hoursFor(.mon).map { hours in pay15for(hours)}
monPay
hoursFor(.wed).map(pay15for)


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)


