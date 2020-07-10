//
//  Lesson4_Classes.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 09.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.

// Lesson 4. Create a Superclass and Subclasses

enum Action {
    case startEngine, stopEngine
    case loadCargo, unloadCargo
    case enableSportMode, disableSportMode
}

class Car {
    let vin: String
    var color: String
    var km: UInt
    var state: Action
    
    init(vin: String, color: String, km: UInt, state: Action) {
        self.vin = vin
        self.color = color
        self.km = km
        self.state = state
    }
    
    func doAction(action: Action) {
        switch action {
        case .startEngine:
            state = .startEngine
        case .stopEngine:
            state = .stopEngine
        default:
            break
        }
    }
    func showMainProperty() -> UInt {
        return km
    }
}

class TrackCar: Car {
    var trunkVolume: UInt
    var specialState: Action
    
    init(trunkVolume: UInt) {
        self.trunkVolume = trunkVolume
        self.specialState = .unloadCargo
        super.init(vin: "123", color: "Green", km: 10000, state: .stopEngine)
    }
    override func showMainProperty() -> UInt {
        return trunkVolume
    }
    override func doAction(action: Action) {
        switch action {
        case .startEngine:
            state = .startEngine
        case .stopEngine:
            state = .stopEngine
        case .loadCargo:
            specialState = .loadCargo
        case .unloadCargo:
            specialState = .unloadCargo
        default:
            break
        }
    }
}

class SportCar: Car {
    var maxSpeed: UInt
    var specialState: Action
    init(maxSpeed: UInt) {
        self.maxSpeed = maxSpeed
        self.specialState = .disableSportMode
        super.init(vin: "5678", color: "Red", km: 5000, state: .stopEngine)
    }
    override func showMainProperty() -> UInt {
        return maxSpeed
    }
    override func doAction(action: Action) {
        switch action {
        case .startEngine:
            state = .startEngine
        case .stopEngine:
            state = .stopEngine
        case .enableSportMode:
            specialState = .enableSportMode
        case .disableSportMode:
            specialState = .disableSportMode
        default:
            break
        }
    }
}

