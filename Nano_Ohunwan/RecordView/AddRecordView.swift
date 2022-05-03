//
//  AddRecord.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/05/01.
//

import SwiftUI

struct AddRecordView: View{
    var AddDate: Date
    //CustomDataPicker에서 날짜 선택 시 해당 데이터를 넘겨 받기 위해 만든 빈 깡통
    
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY. MM. dd (E)"
        formatter.locale = Locale(identifier:"ko_KR")
        return formatter
    }()
    //Date Formatter을 사용해서 날짜노출 형식을 지정
    
    var body: some View{
        VStack{
            AddFood()
            
            Text("\(AddDate, formatter: AddRecordView.dateformat)")
                .padding(.vertical, 20)
            
            AddEtc()
        }.toolbar {
            Text("완료")
        }
        // 네비게이션 뷰 안에서만 보암
        // 네비게이션 우측 상단에 들어간다.
    }
}

struct AddFood: View{
    @State private var foodIndex: String = "default"
    @State var showSheet = false
    
    var body: some View{
        Button(action: {
            showSheet.toggle()
        }){
            Image(foodIndex)
                .resizable()
                .frame(width: 250, height: 250)
                .fullScreenCover(isPresented: $showSheet, content: {
                    AddFoodScreen(foodIndex: $foodIndex)
                })
            //변수에 이미지 이름을 주고 이미지에 변수를 주면 해당 이미지 불러짐
            //재료 추가 버튼 디자인 나중에 바꾸기,,,
        }
        
    }
}

struct AddEtc: View{
    @State var showModal = false
    @State private var weatherIndex: String = "sun.min"
    @State private var conditionrIndex: String = "face.smiling"
    @State private var waterIndex: Bool = false
    
    var body: some View{
        
        Button(action: {
            self.showModal = true
        }, label: {
            HStack(spacing: 30){
                
                if conditionrIndex == "face.smiling" {
                    Image(systemName: "face.smiling")
                        .foregroundColor(.gray)
                } else {
                    Text(conditionrIndex)
                }
               //디폴트 이미지는 sf 심볼인데 선택지는 텍스트라서 IF문을 사용해 표현하기로함
                
                if weatherIndex == "sun.min" {
                    Image(systemName: "sun.min")
                        .foregroundColor(.gray)
                } else {
                    Image(systemName: weatherIndex)
                }
//
//                    .foregroundColor(weatherIndex == "sun.min" ? Color.gray : Color.blue)
                
                if waterIndex == true {
                    Image(systemName: "drop.fill")
                        .foregroundColor(.blue)
                } else{
                    Image(systemName: "drop")
                        .foregroundColor(.gray)
                }
                
                
                Image(systemName: "clock")
                    .foregroundColor(.gray)
            }
            .font(.system(size: 26))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            )
            .padding(.horizontal, 16)
        })
        .sheet(isPresented: self.$showModal) {
            AddEtcModal(
                weatherIndex: $weatherIndex,
                conditionrIndex:$conditionrIndex,
                waterIndex: $waterIndex
            )
        }
        
        
    }
}
//struct AddFoodScreen: View {
//    @Environment(\.presentationMode) var presentationMode
//    //팝업 닫기 버튼 구현을 위해 Environment 변수를 가져와야함
//
//    var body: some View{
//        @Binding var food: String
//
//        VStack{
//            HStack{
//                Spacer()
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                    //팝업 닫기 버튼
//                }) {
//                    Image("category_8")
//                }
//            }
//            Text("팝업")
//
//        }
//    }
//}

struct AddRecord_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView(AddDate: Date.now)
    }
}
