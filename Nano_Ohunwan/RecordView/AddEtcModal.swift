//
//  AddEtcModal.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/05/02.
//

import SwiftUI

struct AddEtcModal: View{
    @Binding var weatherIndex: String
    @Binding var conditionrIndex: String
    @Binding var waterIndex: Bool
    
    var body: some View{
        AddCondition(conditionrIndex: $conditionrIndex)
        Divider().padding(.vertical, 15)
        AddWeather(weatherIndex: $weatherIndex)
        Divider().padding(.vertical, 15)
        DrinkWater(waterIndex: $waterIndex)
        Divider().padding(.vertical, 15)
    }
    
}

struct AddCondition: View{
    @State var conditionrList = ["circle.dashed", "😀", "🥲", "😎", "😔", "😡", "😰", "🤮"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var conditionrIndex: String
    @State var currentCondition = 0
    
    var body: some View{
        VStack{
            Text("컨디션")
                .font(.system(size: 14))
            
            LazyVGrid(columns: columns, spacing: 30){
                ForEach(conditionrList, id:\.self){ value in
                    
                    Button(action: {
                        if value == "circle.dashed" {
                            conditionrIndex = "face.smiling"
                        }
                        else {
                            conditionrIndex = value
                        }
                        currentCondition = conditionrList.firstIndex(of: value)!
                    }, label: {
                        if value == "circle.dashed" {
                            Image(systemName: value)
                                .font(.system(size: 26))
                                .foregroundColor(currentCondition == conditionrList.firstIndex(of: value)! ? Color.blue : Color.gray)
                        } else{
                            Text(value)
                                .font(.system(size: 26))
                                .opacity(currentCondition == conditionrList.firstIndex(of: value)! ? 1 : 0.3)
                        }
                    })
                }
            }.padding(.horizontal, 30)
        }
    }
}


struct AddWeather: View{
    @State var weatherList = ["circle.dashed", "sun.max", "cloud.sun", "wind", "cloud.rain", "cloud.bolt.rain", "tornado", "snowflake"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var weatherIndex: String
    //AddRecord > AddEtc에 선언한 weatherIndex를 선택값을 반영하기 위해 가져옴
    
    @State var currentWeather = 0
    //선택한 아이콘만 다른 색상을 주기위해서 변수설정
    
    var body : some View{
        VStack{
            Text("날씨")
                .font(.system(size: 14))
            
            LazyVGrid(columns: columns, spacing: 30){
                ForEach(weatherList, id:\.self){ value in
                    
                    Button(action: {
                        if value == "circle.dashed" {
                            weatherIndex = "sun.min"
                        } else {
                            weatherIndex = value
                        }
                        currentWeather = weatherList.firstIndex(of: value)!
                    }, label: {
                        Image(systemName: value)
                            .font(.system(size: 26))
                            .foregroundColor(
                                currentWeather == weatherList.firstIndex(of: value)! ? Color.blue : Color.gray)
                    })
                    
                }
            }.padding(.horizontal, 30)
        }
    }
}


struct DrinkWater: View{
    @State var waterList = [Water(id: 0, selected: false), Water(id: 1, selected: false), Water(id: 2, selected: false), Water(id: 3, selected: false), Water(id: 4, selected: false), Water(id: 5, selected: false)]
    @Binding var waterIndex: Bool
    @State var temp = -1
    
    var body: some View{
        
        Text("마신 물")
            .font(.system(size: 14))
        Text("\(temp+1)잔")
        
            .font(.system(size: 18).bold())
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
        HStack(spacing: 15){
            ForEach(waterList, id: \.id){ check in
                    Button(action: {
                        for index in 0..<waterList.count {
                            waterList[index].selected = false
                            //index = 리스트의 전체 갯수 => waterList 전체를 초기화 시켜라는 뜻
                        }
                        for num in 0...check.id {
                            waterList[num].selected = true
                            //num = 산택된 ID(인데스 번호)까지 bool값을 true로 만들어라
                            temp = waterList[num].id
                            waterIndex = true
                        }
                        // for in 은 반복문 : for "이름" in "반복시킬 목록" { "반복시킬 행위" }
                        // List.count를 하면 안의 리스트의 갯수를 세어줌, 근데 Array는 0부터 시작해서 "for 이름 in 0...목록.count" 를 쓰면 오류가 남
                        // (EX : water 의 목록이 5개인 경우, array index = 4(0 부터 사적해서)지만, water.count = 5개임)
                        // 그레서 0..<waterList.count 이라고 적어야함 (5전까지 루프돌게 해라)
                        
                    }, label: {
                        if check.selected == true {
                            Image(systemName: "drop.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.blue)
                        }else{
                            Image(systemName: "drop")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                        }
                    })
            }
        }
        
    }
}

//struct ExerciseTime: View{
//    @State var 
//    
//    var body: some View{
//        Text("마신 물")
//            .font(.system(size: 14))
//        
//    }
//}

//struct AddEtcModal_Previews: PreviewProvider {
//    static var previews: some View {
//        AddEtcModal(weatherIndex: "sun.max")
//    }
//}
//
