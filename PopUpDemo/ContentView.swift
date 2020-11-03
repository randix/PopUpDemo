//
//  ContentView.swift
//  PopUpDemo
//
//  Created by Rand on 11/1/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var shared: Shared
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    print("Top")
                    
                }) {
                    Text("Top").bold()
                }
                .disabled(shared.showPopup)
                Spacer()
                
                Text("Hello, world!")
                    .padding()
                
                
                Button(action: {
                    print("PopUp")
                    self.shared.showPopup = true
                }) {
                    Text("Show pop up").bold()
                }
                .disabled(shared.showPopup)
                .frame(width: 120)
                Spacer()
                
                Button(action: {
                    print("Bottom")
                    
                }) {
                    Text("Bottom").bold()
                }
           
                .disabled(shared.showPopup)
                Spacer()
            }
            
            if shared.showPopup {
                ZStack {
                    Color.white
                    VStack {
                        Text("Pop Up")
                        Spacer()
                        Button(action: {
                            print("Close")
                            self.shared.showPopup = false
                        }, label: {
                            Text("Close")
                        })
                    }
                    .padding()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(20).shadow(radius:20)
            }
        }
        .onAppear(perform: {
            print("View appeard")
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(shared: Shared())
    }
}
