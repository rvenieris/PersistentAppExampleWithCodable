//
//  PetDetailView.swift
//  PersistentAppExampleWithCodable
//
//  Created by Ricardo Almeida Venieris on 06/05/24.
//

import SwiftUI

struct PetDetailView: View {
    
    @Binding var pet:Pet
    
    var body: some View {
    
            List {
                Section("Tutor") {
                    NavigationLink(destination: PersonDetailView(person: $pet.tutor),
                                   label: {PersonDescriptionlView(person: $pet.tutor)})
                }
                Section("Vet") {
                    NavigationLink(destination: PersonDetailView(person: $pet.vet),
                                   label: {PersonDescriptionlView(person: $pet.vet)})
                }
            }
            .navigationTitle(pet.name)
        
    }
}

struct PetDetailView_Previews: PreviewProvider {
    @State static var pet: Pet = allPets.first!
    static var previews: some View {
        NavigationStack {
            PetDetailView(pet: $pet)
        }
    }
}



struct PersonDescriptionlView: View {
    
    @Binding var person: Person
    var body: some View {
        HStack {
            Text(person.name)
            Spacer()
            Text(person.birthday.formatted(date: .abbreviated, time: .omitted))
        }
    }
}

struct PersonDetailView: View {
    
    @Binding var person: Person
    @State var editing:Bool = false
    
    var body: some View {
        VStack {
            TextField("Nome", text: $person.name)
                .padding(.bottom)
            DatePicker("Nascimento", selection: $person.birthday, displayedComponents: .date)
        }
        .padding()
        .navigationTitle("\(person.type.rawValue): \(person.name)")
    }
}
