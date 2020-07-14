//
//  main.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 09.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

// Lesson 5

var muscleCar1 = MuscleCar(name: .BMW, muscleCarVin: "11111", muscleCarColor: .Black)
var tankCar1 = TankCar(name: .Man, tankCarVin: "22222", tankCarColor: .Green)


print(muscleCar1.rePaint(to: .Green))
print(muscleCar1.openWindow())

print(tankCar1.loadTank())

print(muscleCar1.description)
print(tankCar1.description)




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


