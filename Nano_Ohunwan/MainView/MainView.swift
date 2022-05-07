//
//  MainView.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/29.
//

import SwiftUI

struct MainView: View {
    @State var currentData: Date = Date()
    @State var foodList = Record.all()

    var body: some View {

        VStack {
            CustomDataPicker(currentDate: $currentData, foodList: $foodList)
            
            Spacer()
            
            NavigationLink(destination: AddRecordView(AddDate: Date(), foodList: $foodList)){
                Text("오늘의 재료 담기😎")
                    .bold()
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 100.0).foregroundColor(.black).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            }
        }
            .padding(.horizontal, 20)
            .frame(maxHeight: .infinity)
    }

}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
