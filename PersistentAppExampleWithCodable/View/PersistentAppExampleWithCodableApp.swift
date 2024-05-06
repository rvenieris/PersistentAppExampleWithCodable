//
//  PersistentAppExampleWithCodableApp.swift
//  PersistentAppExampleWithCodable
//
//  Created by Ricardo Almeida Venieris on 04/05/24.
//

import SwiftUI

@main
struct PersistentAppExampleWithCodableApp: App {
    
    @Environment(\.scenePhase) var scenePhase

    @State var application = ApplicationData.instance
    
    var body: some Scene {
        
        WindowGroup {
            HomeView(application: application)

                .onChange(of: scenePhase) {
                    switch scenePhase {
                    case .background:
                        do {
                            try application.save()
                        } catch {
                            // Avisa pro usuário que ele se ferrou
                            print("Se ferrou!", error)
                        }
                    case .inactive:
                        break
                    case .active:
                        break
                    @unknown default:
                        break
                    }
                }
        }
    }
}
