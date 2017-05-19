//
//  DataModelExtensions.swift
//  protobuf-server
//
//  Created by Michał Cichoń on 19/05/2017.
//
//

extension City {
    public init(id: UInt64? = nil, name: String? = nil, latitude: Double? = nil, longitude: Double? = nil, population: UInt32? = nil) {
        if let v = id {
            self.id = v
        }
        
        if let v = name {
            self.name = v
        }
        
        if let v = latitude {
            self.latitude = v
        }
        
        if let v = longitude {
            self.longitude = v
        }
        
        if let v = population {
            self.population = v
        }
    }
}

extension Country {
    public init(id: UInt64? = nil, name: String? = nil, cities: [City] = [], population: UInt64? = nil) {
        if let v = id {
            self.id = v
        }
        
        if let v = name {
            self.name = v
        }
        
        if !cities.isEmpty {
            self.cities = cities
        }
        
        if let v = population {
            self.population = v
        }
    }
}
