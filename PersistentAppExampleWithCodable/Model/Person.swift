//
//  Evento.swift
//  Teste SwiftUI
//
//  Created by Ricardo Almeida Venieris on 03/05/24.
//

import Foundation


enum PersonType: String, Codable {
    case tutor = "Tutor"
    case vet = "Vet"
}

@Observable class Person: Codable, WeakWrappedType {
    private(set) var id = UUID()
    var type: PersonType
    var name: String
    var birthday:Date
    
    init(type: PersonType = .tutor, name: String = "* pet tutor whithout a name *",
         birthday: Date = Calendar.current.date(byAdding: .year, value: -20, to: .now) ?? .now) {
        
        self.type = type
        self.name = name
        self.birthday = birthday
        
//        Self.all.insert(self)
    }
    
    var myPets   :[Pet] {                    allPets.filter({$0.tutor === self})}
    var myPatiens:[Pet] {self.type == .vet ? allPets.filter({$0.vet   === self}) : []}

    

//    static var all = WeakObjectSet<Person>()
    
}
