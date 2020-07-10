//
//  Lesson3_struct_car.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 10.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

// Create structure Car

enum Brand {
    case Ford, BMW, Subaru, VW
}
enum Model {
    case Focus, X5, Forester, Polo
}
enum ColorCar {
    case Red, Blue, Black, Green
}
enum CarStateWindows {
    case open, close
}
enum EngineState {
    case run, stop
}

struct Car {
    var brand: Brand = .Ford
    var model: Model = .Focus
    var color: ColorCar = .Black
    let year: UInt = 2015
    var trunkVolume: UInt = 400
    var usedVolumeTrunk: UInt = 0
    var freeVolumeTrunk: UInt {
        return trunkVolume - usedVolumeTrunk
    }
    var engineState: EngineState = .stop
    var stateWindows: CarStateWindows = .close

    init() {
    }

    init(brand: Brand, model: Model, color: ColorCar, year: UInt, trunkVolume: UInt) {
        self.brand = brand
        self.model = model
        self.color = color
        self.trunkVolume = trunkVolume
    }

    mutating func startEngine() {
        engineState = .run
    }
    mutating func stopEngine() {
        engineState = .stop
    }
    mutating func openWindows() {
        stateWindows = .open
    }
    mutating func closeWindows() {
        stateWindows = .close
    }
    mutating func loadInTrunk(volume: UInt) -> Bool {
        guard  volume <= freeVolumeTrunk && volume >= 0 else {
            return false
        }
        usedVolumeTrunk += volume
        return true
    }
    mutating func unloadFromTrunk(volume: UInt) -> Bool {
        guard volume <= usedVolumeTrunk && volume >= 0 else {
            return false
        }
        usedVolumeTrunk -= volume
        return true
    }
}

