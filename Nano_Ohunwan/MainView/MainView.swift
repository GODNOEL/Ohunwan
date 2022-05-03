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

            VStack{
                //달력들어올자리
                CustomDataPicker(currentDate: $currentData)
                Spacer()
                NavigationLink(destination: AddRecordView(AddDate: currentData)){
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color.white)
                        .font(.system(size: 10))
                        .padding(15)
                        .frame(width: 60, height: 60)
                        .background(Color.black)
                        .clipShape(Circle())
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
