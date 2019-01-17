//: ### Functions that return other functions
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)

func payAt15(for hours: Hours) -> Euros {
    let pay = hours * 15.euros.perHour
    return pay
}

payAt15(for: 3.5.hours)

func payAt12(for hours: Hours) -> Euros {
    let pay = hours * 12.euros.perHour
    return pay
}

payAt12(for: 3.5.hours)

func pay(at rateInEuros: Euros.Rate,
         for hours: Hours) -> Euros {
    let pay = rateInEuros * hours
    return pay
}

pay(at: 15.euros.perHour,
    for: 3.5.hours)

func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
    return {hours in rateInEuros * hours}
}

pay(at: 15.euros.perHour)(10.hours)

let pay15 = pay(at: 15.euros.perHour)
pay15(3.5.hours)

typealias PayCalculator = (Euros.Rate) -> (Hours) -> Euros

let altPay: PayCalculator  = {rate in {hours in rate * hours}}
altPay(12.euros.perHour)(10.hours)

let altPay2 = {rate in {hours in pay(at: rate, for: hours)}}
altPay2(10.euros.perHour)(7.5.hours)

func curry<A, B, C>(_ f: @escaping (A,  B) -> C) -> (A) -> (B) -> C {
    return {a in {b in f(a, b)}}
}

func uncurry<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (A, B) -> C {
    return { (a, b) in f(a)(b)}
}

let curriedPay = curry(pay)
curriedPay(5.euros.perHour)(7.hours)

let uncurriedAltPay = uncurry(altPay)
uncurriedAltPay(4.euros.perHour, 12.hours)


//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
