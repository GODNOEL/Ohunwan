//
//  MainView.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/29.
//

import SwiftUI

struct MainView: View {
    @State var currentData: Date = Date()
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            
            VStack{
                //달력들어올자리
                CustomDataPicker(currentDate: $currentData)
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
