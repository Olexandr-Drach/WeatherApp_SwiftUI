//
//  RowView.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 26.07.2023.
//

import SwiftUI

struct RowView: View {
    
    // - MARK: Properties
    var items: [Forecast.ForecastModel]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 10){
                ForEach(items, id:\.dt_txt){ item in
                    ItemView(item: item)
                }
            }
            
        }
        .frame(height: 180)
        .background(Color.clear)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(items: [])
    }
}
