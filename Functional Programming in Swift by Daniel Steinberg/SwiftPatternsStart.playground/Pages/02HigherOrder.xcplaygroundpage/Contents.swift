//: ### Functions that consume other functions
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay(at rateInEuros: Euros.Rate,
         for hours: Hours) -> Euros {
    return rateInEuros * hours
}

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}

let pay15For = pay(at: 15.euros.perHour)

func apply(_ f: (Hours) -> Euros, to startValue: Hours) -> Euros {
    return f(startValue)
}

apply(pay15For, to: 3.5.hours)

// In Swift, we prefer that the closure be the last parameter

func change(_ startingValue: Hours, using f: (Hours) -> Euros) -> Euros {
    return f(startingValue)
}

// Generic version
func changed<Input, Output>(_ startValueAt: Input, using f: (Input) -> Output) -> Output {
    return f(startValueAt)
}

change(3.5.hours, using: pay15For)
change(3.5.hours, using: { hours in pay15For(hours)})
change(3.5.hours) {hours in pay15For(hours)}
change(3.5.hours){hours in pay(at: 12.euros.perHour)(hours)}

3.5.hours |> pay15For
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

