//
//  ContentView.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
            MainView()
            }
                .navigationBarItems(
//                    leading:
//                        Text("🥪2, ✍️10")
//                        .bold(),
                    trailing:
                    NavigationLink(
                    destination: SandwichView(),
                    label: {
                        Image(systemName: "tray.full.fill")
                            .foregroundColor(Color.black)
                    })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
