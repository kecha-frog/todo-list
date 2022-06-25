import UIKit
import Foundation

protocol Coffe {
    var coast: Swift.Double { get }
}

protocol CoffeeDecorator: Coffe {
    var base: Coffe { get }
    init(_ base: Coffe, options: [Topping] )
}

class SimpleCoffee: Coffe {
    var coast: Swift.Double {
        return 100.0
    }
}

enum Topping {
    case milk
    case wheep
    case sugar
    case double(_ base: Coffe)
}

extension Topping: Coffe {
    var coast: Swift.Double {
        switch self {
        case . milk:
            return 20
        case . wheep:
            return 30
        case .sugar:
            return 5
        case .double(let base):
            return base.coast * 0.7
        }
    }
}

class OptionCoffee: CoffeeDecorator {
    var base: Coffe
    var options: [Topping]

    required init(_ base: Coffe, options: [Topping]) {
        self.base = base
        self.options = options
    }

    var coast: Swift.Double {
        return base.coast + options.reduce(0, { partialResult, topping in
            return partialResult + topping.coast
        })
    }
}


let coffe = SimpleCoffee()
let doubleCoffeSugarMilk = OptionCoffee(coffe, options: [.double(coffe), .sugar, .milk])

print("cofee: \(coffe.coast)")
print("doubleCoffeSugarMilk: \(doubleCoffeSugarMilk.coast)")

