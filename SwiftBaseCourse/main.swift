//
//  main.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 09.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

// Lesson 7

// Create object by throws init

do {
    let trunkCar1 = try TruckVehicle(brand: .Man, year: 2020, vin: "123456739qWERTYUI", trunkVolume: 400)
    
    print(trunkCar1)
    
    // Load cargo in to trunk
    
    let firstLoadTo = trunkCar1.loadToTrunk(cargo: 330)
    
    switch firstLoadTo {
        
    case .error(.overloadTrunk(let value)):
        print("Overload: \(value)m3")
        
    case .freeVolume(let value):
        print("Free volume: \(value)")
        
    default:
        break
    }
    
    // Unload cargo from trunk
    
    let firstUnloadTrunk = trunkCar1.unloadFromTrunk()
    
    switch firstUnloadTrunk {
        
    case .error(.trunkIsEmpty):
        print("Trunk is empty")
        
    case .trunkUnloaded:
        print("Trunk unloaded")
        
    default:
        break
    }    
    
} catch  {
    print("trunkCar1: ", error)
}


// Lesson 6

// Create objects with type MuscleCar and TankCar

//var muscleCar1 = MuscleCar(name: .BMW, muscleCarVin: "11111", muscleCarColor: .Black, odometer: 24500)
//var muscleCar2 = MuscleCar(name: .Ford, muscleCarVin: "22222", muscleCarColor: .Blue, odometer: 8700)
//var muscleCar3 = MuscleCar(name: .Subaru, muscleCarVin: "33333", muscleCarColor: .Green, odometer: 23000)
//
//var tankCar1 = TankCar(name: .Man, tankCarVin: "44444", tankCarColor: .Blue, odometer: 450000)
//var tankCar2 = TankCar(name: .Scania, tankCarVin: "55555", tankCarColor: .Green, odometer: 340000)
//var tankCar3 = TankCar(name: .Volvo, tankCarVin: "66666", tankCarColor: .Red, odometer: 50000)
//var tankCar4 = TankCar(name: .Man, tankCarVin: "77777", tankCarColor: .Green, odometer: 43000)
//
//// Create objects with type Queue<T>
//
//var muscleQueue = Queue<MuscleCar>()
//var tankQueue = Queue<TankCar>()

// Insert elements in to queue

//muscleQueue.enqueue(muscleCar1)
//muscleQueue.enqueue(muscleCar2)
//muscleQueue.enqueue(muscleCar3)
//
//tankQueue.enqueue(tankCar1)
//tankQueue.enqueue(tankCar2)
//tankQueue.enqueue(tankCar3)
//tankQueue.enqueue(tankCar4)
//
//// Pull element from queue
//
//if let q = tankQueue.dequeue() {
//    print(q)
//}
//print("================")
//
//// Return "nil" if index out of range
//
//print(tankQueue[8])
//
//print("================")
//
//// Call method higher order with closure
//
//let filterTankQueue = tankQueue.filterByOdometer {
//    $0.odometer <= 400000
//}
//print(filterTankQueue)


// Lesson 5

//var muscleCar1 = MuscleCar(name: .BMW, muscleCarVin: "11111", muscleCarColor: .Black)
//var tankCar1 = TankCar(name: .Man, tankCarVin: "22222", tankCarColor: .Green)


//print(muscleCar1.rePaint(to: .Green))
//print(muscleCar1.openWindow())
//
//print(tankCar1.loadTank())
//
//print(muscleCar1.description)
//print(tankCar1.description)


// Lesson 4
// Changing properties and call methods

//var truck1 = TrackCar(trunkVolume: 20000)
//print(truck1.color)
//print("Trunk volume = ", truck1.showMainProperty())
//truck1.doAction(action: .unloadCargo)
//print(truck1.state)
//
//var sportCar1 = SportCar(maxSpeed: 250)
//print("Max speed = ", sportCar1.showMainProperty())
//sportCar1.doAction(action: .enableSportMode)
//print(sportCar1.color)
//print(sportCar1.specialState)


