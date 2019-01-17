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


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

