//: ### Mapping Arrays
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func changed<Input, Output>(_ input: Input,
using f: (Input) -> Output) -> Output {
    return f(input)
}

func pay15for(_ hours: Hours) -> Euros {
    return hours * 15.euros.perHour
}

let hoursForTheWeek = [3.5.hours, 10.hours,
                       7.hours, 12.hours,
                       4.6.hours]

func myMap<Input, Output>(_ input: [Input], _ transform: (Input) -> Output) -> [Output] {
    var output = [Output]()
    for element in input {
        output.append(transform(element))
    }
    return output
}

// Swift 1.0
let result1 = myMap(hoursForTheWeek, pay15for)
result1.description

// want hoursForTheWeek.myMap(pay15For)

extension Array {
    func myMap<Output>(_ transform: (Element) -> Output) -> [Output] {
        var output = [Output]()
        for element in self {
            output.append(transform(element))
        }
        return output
    }
}

hoursForTheWeek.myMap(pay15for)


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

