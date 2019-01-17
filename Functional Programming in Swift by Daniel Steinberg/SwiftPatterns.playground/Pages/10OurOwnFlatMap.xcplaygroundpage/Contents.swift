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
    
    func flatMap<TargetValue>(_ transform: (Value) -> ResultLite<TargetValue>) -> ResultLite<TargetValue> {
        switch self {
        case .failure(let errorMessage):
            return ResultLite<TargetValue>.failure(errorMessage)
        case .success(let value):
            return transform(value)
        }
    }
}

let hoursForTheWeek = [Weekdays.mon: 3.5.hours,
                       .tue: 10.hours, .thu: 12.hours,
                       .fri: 0.hours]

func hoursWorkedOn(_ day: Weekdays) -> ResultLite<Hours> {
    guard let hours = hoursForTheWeek[day] else  {
        return ResultLite.failure("Didn't work on \(day)")
    }
    return ResultLite.success(hours)
}

let monHours = hoursWorkedOn(.mon)
let wedHours = hoursWorkedOn(.wed)
let friHours = hoursWorkedOn(.fri)

func pay15For(_ hours: Hours) -> ResultLite<Euros> {
    guard hours > 0.hours else {
        return ResultLite.failure("No hours")
    }
    return ResultLite.success(hours * 15.euros.perHour)
}

let wrongMonPay = monHours.map(pay15For)
let wrongWedPay = wedHours.map(pay15For)
let wrongFriPay = friHours.map(pay15For)

let monPay = monHours.flatMap(pay15For)
let wedPay = wedHours.flatMap(pay15For)
let friPay = friHours.flatMap(pay15For)

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)



