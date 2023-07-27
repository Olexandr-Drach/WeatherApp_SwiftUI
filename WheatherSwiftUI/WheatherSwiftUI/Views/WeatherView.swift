//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import SwiftUI

struct WeatherView: View {
    
    // - MARK: Properties
    @StateObject var modelView = WeatherViewModel()
    
    @State var searchCity = "Lviv"
    @State var searchColor: Color = .gray
    
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            GradientView(colors: [Color(#colorLiteral(red: 0.8577369743, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))])
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 10) {
                    
                    HStack {
                        TextField("Search", text: $searchCity)
                            .frame(height: 40)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .background(.white)
                            .foregroundColor(searchColor)
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .disableAutocorrection(true)
                            .submitLabel(.search)
                        
                        
                            .onSubmit {
                                searchColor = .gray
                                self.endEditing()
                                modelView.searchCity = searchCity
                                modelView.loadWeather {}
                            }
                            .onTapGesture {
                                if !isEditing {
                                    isEditing = true
                                    searchCity = ""
                                    searchColor = .black
                                }
                            }
                        
                        Button(action: {
                        searchColor = .gray
                            self.endEditing()
                            modelView.searchCity = searchCity
                            modelView.loadWeather {}
                        }) {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(5)
                        }
                        .frame(width: 40, height: 40)
                        
                    }
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    
                    Text(modelView.cityName)
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .semibold, design: .rounded))
                        .padding(.top, 20)
                    
                }
                .padding(.top, 10)
                
                VStack(alignment: .center, spacing: 10){
                    ForEach(modelView.forecasts, id:\.description){ items in
                        
                        RowView(items: items)
                    }
                }
                .padding(.leading, 5)
                
            }
            .background(Color.clear)
            
            
        }
        
    }
    
    
    // - MARK: Actions
    
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
    }
    
    
}

struct WheatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
