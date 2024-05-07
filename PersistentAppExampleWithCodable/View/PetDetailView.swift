//
//  PetDetailView.swift
//  PersistentAppExampleWithCodable
//
//  Created by Ricardo Almeida Venieris on 06/05/24.
//

import SwiftUI

struct PetDetailView: View {
    
    @Binding var pet: Pet
    
    @State private var isRenaming = false
    
    var body: some View {
        List {
            Section("Tutor") {
                NavigationLink {
                    PersonDetailView(person: $pet.tutor)
                } label: {
                    PersonDescriptionRow(person: pet.tutor)
                }
            }
            
            Section("Vet") {
                NavigationLink {
                    PersonDetailView(person: $pet.vet)
                } label: {
                    PersonDescriptionRow(person: pet.vet)
                }
            }
            .listSectionSpacing(0)
        }
        .navigationTitle(pet.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isRenaming = true
                } label: {
                    Text("Rename")
                }
            }
        }
        .alert("Rename Pet", isPresented: $isRenaming) {
            let originalName = pet.name
            
            TextField("Pet Name", text: $pet.name)
            Button("Rename") { }
            Button("Cancel", role: .cancel) {
                pet.name = originalName
            }
        }
        
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

struct PersonDescriptionRow: View {
    let person: Person
    var body: some View {
        HStack {
            Text(person.name)
            Spacer()
            Text(person.birthday.formatted(date: .abbreviated, time: .omitted))
        }
    }
}

