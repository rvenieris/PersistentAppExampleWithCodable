//
//  ContentView.swift
//  Teste SwiftUI
//
//  Created by Ricardo Almeida Venieris on 18/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @Bindable var application: ApplicationData
    
    var body: some View {
        NavigationStack {
            List {
                if filteredPets.isEmpty {
                    if searchText.isEmpty {
                        noPetsAddedPlaceholder
                    } else {
                        noPetsFoundPlaceholder
                    }
                } else {
                    ForEach(filteredPets) { $pet in
                        NavigationLink {
                            PetDetailView(pet: $pet)
                        } label: {
                            Text(pet.name)
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Pets")
            .toolbar {
                Button {
                    addAPet()
                } label: {
                    Label("Add a pet", systemImage: "plus")
                }
            }
        }
    }
    
    private var filteredPets: [Binding<Pet>] {
        var filtered: [Pet]
        // If there's nothing on the search text, return everything
        if searchText.isEmpty {
            filtered = application.pets
        } else {
            filtered = application.pets.filter { pet in
                // Check if the search text is in the name
                // Ignoring uppercase/lowercase and
                print(pet.name, searchText, pet.name.localizedCaseInsensitiveContains(searchText))
                return pet.name
                    .localizedCaseInsensitiveContains(searchText)
            }
        }
        return filtered.compactMap { application.bindingForPet(withID: $0.id) }
    }
    
    @ViewBuilder
    private var noPetsAddedPlaceholder: some View {
        ContentUnavailableView {
            ContentUnavailableView("No Pets Yet", systemImage: "pawprint.fill")
        } description: {
            Text("Your pets will appear here.")
        } actions: {
            Button(action: {addAPet()}) {
                Text("Add a New Pet")
            }
        }
    }
    
    @ViewBuilder
    private var noPetsFoundPlaceholder: some View {
        ContentUnavailableView {
            ContentUnavailableView("No Pets Found", systemImage: "exclamationmark.magnifyingglass")
        } actions: {
            Button(action: addAPet) {
                Text("Add a New Pet")
            }
        }
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
