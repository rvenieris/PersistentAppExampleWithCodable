//
//  Item.swift
//  Teste SwiftUI
//
//  Created by Ricardo Almeida Venieris on 03/05/24.
//

import Foundation


@Observable class Pet: Codable, Identifiable {
    private(set) var id = UUID()
    var name: String
    var tutor: Person
    var vet: Person
    
    init(name: String, tutor: Person, vet: Person) {
        self.name = name
        self.tutor = tutor
        self.vet = vet
    }
}
