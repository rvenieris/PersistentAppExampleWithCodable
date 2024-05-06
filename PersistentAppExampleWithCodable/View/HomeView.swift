//
//  ContentView.swift
//  Teste SwiftUI
//
//  Created by Ricardo Almeida Venieris on 18/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @Bindable var application:ApplicationData
    
    var body: some View {
        
        NavigationStack {
            List($application.pets, editActions: .delete) {pet in
                NavigationLink(pet.name.wrappedValue)
                {PetDetailView(pet: pet)}
            }
            
            .navigationTitle("Pets")
            .toolbar {
                Button("➕🐶") { addAPet() }
                
            }
        }
//        .onAppear {print(Date.ISO8601FormatStyle().format(Date()))}
    }
    
    func addAPet() {
    }
    
    func delete(at offsets: IndexSet) {
        application.pets.remove(atOffsets: offsets)
    }
}

#Preview {
    HomeView(application: ApplicationData.instance)
}
