//
//  ContentView.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import SwiftUI


struct ContentView: View {
    
    // - MARK: Properties
    
    @StateObject var locationOperator = LocationOperator.shared
    
    
    var body: some View {
        ZStack {
            GradientView(colors: [Color(#colorLiteral(red: 0.8577369743, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))])
            
            if locationOperator.operatorStatus == .finished {
                WeatherView()
                
            }
            else {
                ProgressView()
                    .controlSize(.large)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
