//
//  Lesson7_Errors.swift
//  SwiftBaseCourse
//
//  Created by Vitaly Prosvetov on 20.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

enum TruckVehicleInitError: Error {
    case incorrectYear
    case incorrectVin
    case incorrectTrunkVolume
}

enum LoadUnloadTrunkError: Error {
    case overloadTrunk (value: UInt)
    case trunkIsEmpty
}

enum LoadUnloadResult {
    case error (LoadUnloadTrunkError)
    case freeVolume (value: UInt)
    case trunkUnloaded
}

class TruckVehicle: CustomStringConvertible {
    var description: String {
        return "\(brand) \(year) vin: \(vin) \(trunkVolume)m3 free volume: \(freeVolumeOfTrunk)m3"
    }
    let brand: TruckBrand
    let year: UInt
    let vin: String
    let trunkVolume: UInt
    var loadedVolumeOfTrunk: UInt = 0
    var freeVolumeOfTrunk: UInt {
        return trunkVolume - loadedVolumeOfTrunk
    }
    
    init(brand: TruckBrand, year: UInt, vin: String, trunkVolume: UInt) throws {
        guard year >= 2000, year <= 2020 else { throw TruckVehicleInitError.incorrectYear }
        
        let pattern = "[a-zA-Z0-9]{17}"
        
        guard vin.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil else { throw TruckVehicleInitError.incorrectVin }
        
        guard trunkVolume >= 0, trunkVolume <= 500 else { throw TruckVehicleInitError.incorrectTrunkVolume}
         
        self.brand = brand
        self.year = year
        self.vin = vin
        self.trunkVolume = trunkVolume
    }
    
    func loadToTrunk (cargo: UInt) -> LoadUnloadResult {
        guard cargo <= freeVolumeOfTrunk else { return LoadUnloadResult.error(.overloadTrunk(value: cargo - freeVolumeOfTrunk))}
        
        loadedVolumeOfTrunk += cargo
        return LoadUnloadResult.freeVolume(value: freeVolumeOfTrunk)
    }
    
    func unloadFromTrunk() -> LoadUnloadResult {
        guard loadedVolumeOfTrunk != 0 else { return LoadUnloadResult.error(.trunkIsEmpty)}
        
        loadedVolumeOfTrunk = 0
        return LoadUnloadResult.trunkUnloaded
    }
}
