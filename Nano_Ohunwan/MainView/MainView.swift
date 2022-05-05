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
            //달력들어올자리
//                CustomDataPicker(currentDate: $currentData, foodList: $foodList, currentMonth: Record(foodName: "닭가슴살", ImgURL: "food_1", foodText: "근력위주의운동", summaryText: "짱잼", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: 3))),
//
//                testData: NavigationLink(destination: AddRecordView(AddDate: currentData, foodList: self.$foodList, recordData: Record(foodName: "토마토", ImgURL: "food_2", foodText: "열정적 운동", summaryText: "요약", exerciseText: "설명", todayCondition: "☺️", todayWeather: "sun.max", drinkWater: 4, exerciseTime: 30.0, recordDate: getSmpleDate(offset: 10)){
//                    Image(systemName: "plus")
//                        .resizable()
//                        .foregroundColor(Color.white)
//                        .font(.system(size: 10))
//                        .padding(15)
//                        .frame(width: 60, height: 60)
//                        .background(Color.black)
//                        .clipShape(Circle())
            CustomDataPicker(currentDate: $currentData, foodList: $foodList)
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
