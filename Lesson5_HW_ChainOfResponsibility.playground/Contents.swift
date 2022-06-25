import UIKit
import Foundation

protocol Coffe {
    var coast: Swift.Double { get }
}

protocol CoffeeDecorator: Coffe {
    var base: Coffe { get }
    init(_ base: Coffe )
}


class SimpleCoffee: Coffe {
    var coast: Swift.Double {
        return 100.0
    }
}

class Milk: CoffeeDecorator {
    var base: Coffe

    required init(_ base: Coffe) {
        self.base = base
    }

    var coast: Swift.Double {
        return base.coast + 20.0
    }
}

class Whip: CoffeeDecorator {
    var base: Coffe

    required init(_ base: Coffe) {
        self.base = base
    }

    var coast: Swift.Double {
        return base.coast + 30.0
    }
}

class Sugar: CoffeeDecorator {
    var base: Coffe

    required init(_ base: Coffe) {
        self.base = base
    }

    var coast: Swift.Double {
        return base.coast + 5.0
    }
}


class Double: CoffeeDecorator {
    var base: Coffe

    required init(_ base: Coffe) {
        self.base = base
    }

    var coast: Swift.Double {
        return base.coast + base.coast * 0.7
    }
}

let coffe = SimpleCoffee()
let coffeMilk = Milk(coffe)
let coffeWhip = Whip(coffe)
let coffeSugar = Sugar(coffe)
let coffeDouble = Double(coffe)
let coffeDoubleSugar = Sugar(coffeDouble)


print("cofee: \(coffe.coast)")
print("cofeeMilk: \(coffeMilk.coast)")
print("coffeWhip: \(coffeWhip.coast)")
print("coffeSugar: \(coffeSugar.coast)")
print("coffeDouble: \(coffeDouble.coast)")
print("coffeDoubleSugar: \(coffeDoubleSugar.coast)")

