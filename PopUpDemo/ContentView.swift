//
//  ContentView.swift
//  PopUpDemo
//
//  Created by Rand on 11/1/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showPopUp = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    print("Top")
                    
                }) {
                    Text("Top").bold()
                }
                .disabled(showPopUp)
                Spacer()
                
                Text("Hello, world!")
                    .padding()
                
                
                Button(action: {
                    print("PopUp")
                    self.showPopUp = true
                }) {
                    Text("Show pop up").bold()
                }
                .disabled($showPopUp.wrappedValue)
                .frame(width: 120)
                Spacer()
                
                Button(action: {
                    print("Bottom")
                    
                }) {
                    Text("Bottom").bold()
                }
           
                .disabled(showPopUp)
                Spacer()
            }
            
            
            if showPopUp {
                ZStack {
                    Color.white
                    VStack {
                        Text("Pop Up")
                        Spacer()
                        Button(action: {
                            print("Close")
                            self.showPopUp = false
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
        ContentView()
    }
}
