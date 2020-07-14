//
//  Lesson5_protocols.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 12.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

// Create protocol and extension, superclass and subclass.

enum StateTank {
    case full, empty
}

protocol Cars {
    var vin: String { get set }
    var color: ColorCar { get set }
    var stateEngine: Bool { get set }
    var stateWindows: CarStateWindows { get set }
    
    func rePaint(to newColor: ColorCar) -> ColorCar    
}

class CarBase: Cars {
    var vin: String
    var color: ColorCar
    var stateEngine: Bool = false
    var stateWindows: CarStateWindows = .close
    
    func rePaint(to newColor: ColorCar) -> ColorCar {
        color = newColor
        return color
    }
    
    init(vin: String, color: ColorCar) {
        self.vin = vin
        self.color = color
    }
}

class MuscleCar: CarBase {
    var name: Brand
    var stateSportMode: Bool = false
    
    func enableSportMode() -> Bool {
        stateSportMode = true
        return stateSportMode
    }
    func disableSportMode() -> Bool {
        stateSportMode = false
        return stateSportMode
    }
    init(name: Brand, muscleCarVin: String, muscleCarColor: ColorCar) {
        self.name = name
        super.init(vin: muscleCarVin, color: muscleCarColor)
    }
}

class TankCar: CarBase {
    var name: TruckBrand
    var stateTank: StateTank = .empty
    
    func loadTank () -> StateTank {
        stateTank = .full
        return stateTank
    }
    func unloadTank () -> StateTank {
        stateTank = .empty
        return stateTank
    }
    init(name: TruckBrand, tankCarVin: String, tankCarColor: ColorCar) {
        self.name = name       
        super.init(vin: tankCarVin, color: tankCarColor)
    }
}

extension Cars {
    mutating func startEngine() -> Bool {
        stateEngine = true
        return stateEngine
    }
    mutating func stopEngine() -> Bool {
        stateEngine = false
        return stateEngine
    }
    mutating func openWindow() -> CarStateWindows {
        stateWindows = .open
        return stateWindows
    }
    mutating func closeWindow() -> CarStateWindows {
        stateWindows = .close
        return stateWindows
    }
}

extension MuscleCar: CustomStringConvertible {
    var description: String {
        return "Name: \(name)\n VIN: \(vin)\n Color: \(color)\n StateSportMode: \(stateSportMode)"
    }
}

extension TankCar: CustomStringConvertible {
    var description: String {
        return "Name: \(name)\n VIN: \(vin)\n Color: \(color)\n StateTank: \(stateTank)"
    }
}


