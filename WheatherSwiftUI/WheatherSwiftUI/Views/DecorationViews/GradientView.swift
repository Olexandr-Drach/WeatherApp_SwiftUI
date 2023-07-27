//
//  GradientView.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import SwiftUI

struct GradientView: View {
    
    var colors: [Color]
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: .bottomLeading, endPoint: .topLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView(colors: [Color(#colorLiteral(red: 0.8577369743, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))])
    }
}
