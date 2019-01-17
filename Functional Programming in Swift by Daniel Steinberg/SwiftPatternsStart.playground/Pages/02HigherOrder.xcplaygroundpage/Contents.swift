//: ### Functions that consume other functions
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func pay(at rateInEuros: Euros.Rate,
         for hours: Hours) -> Euros {
    return rateInEuros * hours
}

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}

//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

