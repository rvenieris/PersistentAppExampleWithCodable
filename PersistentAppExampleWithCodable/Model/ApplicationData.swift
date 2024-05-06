//
//  ApplicationData.swift
//  Teste SwiftUI
//
//  Created by Ricardo Almeida Venieris on 03/05/24.
//

import Foundation
import Combine
import CodableExtensions

@Observable 
class ApplicationData: Codable {

    static var instance = (try? ApplicationData.load()) ?? ApplicationData()

    var pets:[Pet] = []

    private init(){
        self.pets = ApplicationData.defaultPets
    }
    
    
    @discardableResult
    func cachePeopleFromPets()->Self {
        pets.forEach{pet in
//            Person.all.insert(pet.tutor)
//            Person.all.insert(pet.vet)
        }
        return self
    }
    
}


// global to make access easier
var applicationData = ApplicationData.instance
var allPets:[Pet] {applicationData.pets}

// Default Data
extension ApplicationData {
    private static var defaultPets:[Pet] {
        let b1 = try! Date("1973-01-21T15:00:00Z", strategy: .iso8601)
        let b2 = try! Date("1973-08-30T22:00:00Z", strategy: .iso8601)
        let b3 = try! Date("1980-01-01T00:00:00Z", strategy: .iso8601)

        let t1 = Person(type: .tutor, name: "Papai Rick", birthday: b1)
        let t2 = Person(type: .tutor, name: "Mamãe Silv", birthday: b2)
        let v1 = Person(type: .tutor, name: "Victo Fran", birthday: b3)
        
        let p1 = Pet(name: "Doguinho", tutor: t1, vet: v1)
        let p2 = Pet(name: "Gatinho", tutor: t2, vet: v1)

        return [p1, p2]
    }
}
