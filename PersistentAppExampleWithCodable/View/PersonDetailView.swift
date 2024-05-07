//
//  PetDetailView.swift
//  PersistentAppExampleWithCodable
//
//  Created by Victor Martins on 07/05/24.
//

import SwiftUI

struct PersonDetailView: View {
    
//    let petName: String
    @Binding var person: Person
    
    var body: some View {
        Form {
            LabeledContent("Nome") {
                TextField("Nome", text: $person.name)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: 180)
            }
            LabeledContent("Nascimento") {
                DatePicker("Nascimento", selection: $person.birthday, displayedComponents: .date)
                    .labelsHidden()
            }
        }
        .navigationTitle(person.type.rawValue)
//        .toolbar {
//            ToolbarItem(placement: .navigation) {
//                Text(petName)
//                    .font(.title3.weight(.semibold))
//                    .foregroundStyle(.secondary)
//            }
//        }
    }
}

#Preview {
    let pet = ApplicationData.instance.pets.first!
    return NavigationStack {
        PersonDetailView(/*petName: pet.name, */person: .constant(pet.tutor))
    }
}
