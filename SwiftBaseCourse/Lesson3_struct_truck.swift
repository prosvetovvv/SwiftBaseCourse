//
//  Lesson3_struct_truck.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 10.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

// Create structure truck

enum TruckBrand {
    case Scania, Volvo, Man
}
enum TruckStateWindows {
    case open, close
}
enum TruckEngineState {
    case run, stop
}

struct Truck {
    let brand: TruckBrand = .Scania
    let year: UInt = 2015
    var bodyworkVolume: UInt = 10000
    var usedVolumeBodywork: UInt = 0
    var freeVolumeBodywork: UInt {
        return bodyworkVolume - usedVolumeBodywork
    }
    var engineState: TruckEngineState = .stop
    var stateWindows: TruckStateWindows = .close

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
    mutating func loadInBodywork(volume: UInt) -> Bool {
        guard  volume <= freeVolumeBodywork && volume >= 0 else {
            return false
        }
        usedVolumeBodywork += volume
        return true
    }
    mutating func unloadFromBodywork(volume: UInt) -> Bool {
        guard volume <= usedVolumeBodywork && volume >= 0 else {
            return false
        }
        usedVolumeBodywork -= volume
        return true
    }
}

