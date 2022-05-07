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
    
    @State var dataStruct = Record(foodName: "노푸드", ImgURL: "default", foodText: "", summaryText: "오늘의 운동을 한마디로!", exerciseText: "오늘 하신 운동이나 소감을 적어보세요!", todayCondition: "", todayWeather: "", drinkWater: 0, exerciseTime: 00.0, recordDate: Date())
    //Struct는 붕어빵틀, 다른 뷰에서 불러와 사용할 수 있음
    //초기에 보여줄 값을 세팅하는 코드
    
    //    @State private var summaryText = ""
    @State private var summarytextColor = Color.gray
    //    @State private var exerciseText = "오늘 한 운동이나 소감을 적어보세요!"
    @State private var exercisetextColor = Color.gray
    @Binding var foodList: [Record]
//    var recordData: Record
    //    @Binding var recordData: RecordMetaData
    
    var body: some View{
        VStack{
            //재료선택
            AddFood(dataStruct: $dataStruct)
            
            //날짜
            Text("\(AddDate, formatter: AddRecordView.dateformat)")
                .padding(.vertical, 20)
            
            //한줄평 작성
            TextField("오늘의 운동을 한마디로!", text: $dataStruct.summaryText)
                .padding(.horizontal, 20)
                .font(.system(size: 20).bold())
                .onTapGesture {
                    dataStruct.summaryText = ""
                    summarytextColor = Color.black
                }
                .foregroundColor(summarytextColor)
                .multilineTextAlignment(.center)
            //기타 요소 선택
            AddEtc()
                .padding(.vertical, 10)
            
            //택스트 작성
            TextEditor(text: $dataStruct.exerciseText)
                .padding(.horizontal, 20)
                .onTapGesture {
                    dataStruct.exerciseText = ""
                    exercisetextColor = Color.black
                    //플레이스 홀더와 입력 텍스트를 구분하기 위해
                    //textColor 변수를 줘서 변경 값을 탭 제스쳐에 넣어줌
                }
                .foregroundColor(exercisetextColor)
            
            
            Spacer()
        }
        .toolbar {
            Button(action: {
                //print(dataStruct)
                //dataStruct 값 확인하기 위해 추가한 코드
                
                dataStruct.recordDate = AddDate
                foodList.append(dataStruct)
                //dataStruct안의 recordDate 값을 AddDate(추가한 날짜)로 바꿔라
                //foodList = Recode 데이터가 모여있는 배열인데 버튼을 누르는 순간
                //사용자가 입력한 데이터(=dataStruct)가 foodList에 추가 됨 (append는 추가하는 함수)
                // 근데 foodList는 Main.Veiw에도 바인딩 되었기때문에 추가하는 순가 바로 달력에 아이콘이 노출 되는 것
                
            }, label: {Text("완료")})
            //append : 리스트에 추가할 수 있는 함수 (타입애 맞개 써야 함)
            //RecordMetaData(record: [dataStruct]) = 이미 record는 배열이기 때문에 []를 써줘야함
            //근데 오류오지게 나서 배열 지움 > 근데 Recode도 안에 여러개 들어갈 수 있어서 배열로 줌 ( [] 쓰면 배열)
        }
        // toolbar는 네비게이션 뷰 안에서만 보암
        // toolbar를 주면 네비게이션 우측 상단에 들어간다.
        
    }

}

struct AddFood: View{
    //    @State private var foodIndex: String = "default"
    @State var showSheet = false
    @Binding var dataStruct: Record
    // : 뒤에  view 같은 프로토콜로 스트럭트를 불러올 수 잇따
    
    var body: some View{
        Button(action: {
            showSheet.toggle()
        }){
            Image(dataStruct.ImgURL)
                .resizable()
                .frame(width: 250, height: 250)
                .fullScreenCover(isPresented: $showSheet, content: {
                    AddFoodScreen(dataStruct: $dataStruct)
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
    //    @State private var waterIndex: Bool = false
    //    @State private var timeIndex: Bool = false
    @State var dataStruct = Record(foodName: "음식없음", ImgURL: "default", foodText: "설명", summaryText: "", exerciseText: "오늘 한 운동이나 소감을 적어보세요!", todayCondition: "face.smiling", todayWeather: "sun.min", drinkWater: 0, exerciseTime: 0.0, recordDate: getSmpleDate(offset: 8))
    
    var body: some View{
        
        Button(action: {
            self.showModal = true
        }, label: {
            HStack(spacing: 30){
                
                if dataStruct.todayCondition == "face.smiling" {
                    Image(systemName: "face.smiling")
                        .foregroundColor(.gray)
                } else {
                    Text(dataStruct.todayCondition)
                }//컨디션
                //디폴트 이미지는 sf 심볼인데 선택지는 텍스트라서 IF문을 사용해 표현하기로함
                
                if dataStruct.todayWeather == "sun.min" {
                    Image(systemName: "sun.min")
                        .foregroundColor(.gray)
                } else {
                    Image(systemName: dataStruct.todayWeather)
                } //날씨
                
                
                if dataStruct.drinkWater > 0 {
                    Image(systemName: "drop.fill")
                        .foregroundColor(.blue)
                } else{
                    Image(systemName: "drop")
                        .foregroundColor(.gray)
                } //마신물
                
                if dataStruct.exerciseTime > 0.0 {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                }//운동시간
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
                //                weatherIndex: $weatherIndex,
                //                conditionrIndex:$conditionrIndex,
                //                waterIndex: $waterIndex,
                //                timeIndex: $timeIndex,
                dataStruct: $dataStruct
            )
        }
        
        
    }
}

//struct AddRecord_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRecordView(AddDate: Date.now)
//    }
//}
