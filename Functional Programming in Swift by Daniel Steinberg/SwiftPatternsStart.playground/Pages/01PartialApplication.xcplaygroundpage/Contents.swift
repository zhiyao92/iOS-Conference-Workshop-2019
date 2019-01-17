//: ### Functions that return other functions
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
func payAt15(for hours: Hours) -> Euros {
    let pay = hours * 15.euros.perHour
    return pay
}

func payAt12(for hours: Hours) -> Euros {
    let pay = hours * 12.euros.perHour
    return pay
}

payAt15(for: 3.5.hours)

payAt12(for: 3.5.hours)


func pay(at rateInEuros: Euros.Rate, for hours: Hours) -> Euros {
    let pay = hours * rateInEuros
    return pay
}

pay(at: 15.euros.perHour, for: 3.5.hours)

//let pay15 = pay(at: 15.euros.perHour, for: 3.5.hours) DON'T WORK

let employeePayFor3Hours = payAt15(for: 3.hours)

let employeePay = payAt15
employeePay(3.hours)

// Simplify it
//func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
//    func payCalculation(hours: Hours) -> Euros {
//        let pay = hours * rateInEuros
//        return pay
//    }
//    return payCalculation
//}

// Change func to a let insert opening brac and change to in
//func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
//    let payCalculation = {(hours: Hours) -> Euros in
//        let pay = hours * rateInEuros
//        return pay
//    }
//    return payCalculation
//}

// Remove the explaining variable pay and payCalculation
//func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
//    return {(hours: Hours) -> Euros in
//        return hours * rateInEuros
//    }
//}

// Remove type information remove inner return
//func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
//    return { hours in hours * rateInEuros }
//}

// If you hate your coworker, replace hours with $0
//func pay(at rateInEuros: Euros.Rate) -> (Hours) -> Euros {
//    return { $0 * rateInEuros }
//}

let pay15 = pay(at: 15.euros.perHour)
pay15(3.5.hours)

pay(at: 12.euros.perHour)(3.5.hours)
//: [TOC](00TOC) - [Previous](@previous) - [Next](@next)
