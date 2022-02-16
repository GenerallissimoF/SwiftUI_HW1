//
//  ContentView.swift
//  SwiftUI_HW1
//
//  Created by Ivan Adoniev on 14.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var buttonTitle = "Start"
    @State var nextColorState: TrafficLights = .red
    
    enum TrafficLights {
        case red
        case yellow
        case green
    }
   
    
    var body: some View {
        VStack {
        VStack {
            switchTheLight()
        }
        VStack {
            Button(action: { changeLights() }) {
                Text(buttonTitle)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(width: 200, height: 40, alignment: .center)
        .background(Color.indigo)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
    }
    
    func changeLights() {
     
        buttonTitle = "Next"
        
        switch nextColorState {
        case .red:
            nextColorState = .yellow
        case .yellow:
            nextColorState = .green
        case .green:
            nextColorState = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension ContentView {
    
    func switchTheLight() -> some View {
        Group {
            switch nextColorState {
            case .red:
                ColorCircle(color: .red)
                    .opacity(1.0)
                ColorCircle(color: .yellow)
                    .opacity(0.1)
                ColorCircle(color: .green)
                    .opacity(0.1)
                    .padding(.bottom, 40)
            case .yellow:
                ColorCircle(color: .red)
                    .opacity(0.1)
                ColorCircle(color: .yellow)
                    .opacity(1.0)
                ColorCircle(color: .green)
                    .opacity(0.1)
                    .padding(.bottom, 40)
            case .green:
                ColorCircle(color: .red)
                    .opacity(0.1)
                ColorCircle(color: .yellow)
                    .opacity(0.1)
                ColorCircle(color: .green)
                    .opacity(1.0)
                    .padding(.bottom, 40)
            }
        }
    }
}

