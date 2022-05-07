//
//  CustomDataPicker.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/29.
//

import SwiftUI

struct CustomDataPicker: View {
    @Binding var currentDate: Date
    //main.view애서 준 현재 날짜 변수를 가져옴
    @Binding var foodList: [Record]
    // foodList에 Record가 여러개가 들어갈 수 있어서 Record를 배열타입으로 불러옴
    
    // 달력 화살표를 눌렀을 떄 날짜 이동하도록 하기
    @State var currentMonth: Int = 0
    let days: [String] = ["S", "M", "T", "W", "T", "F", "S"]

    func CardView(value: DateValue) -> some View {
        //함수 뒤에 쓰는 건 매개변수, 함수를 줄때 매개 변수룰 꼭 입력해야함
        //매개변수를 모아놓은 스트럭트를 만들어서 불러올 수 있음 (매개변수가 많을떄 사용)
        // -> 뒤에 오는건 반환 타입 view로 불러올 거라는 의미

        VStack {
            if value.day != -1 {
                // != 같지 않다라는 의미

                if let recordData = $foodList.first(where: { rec in
                    return isSameday(date1: rec.recordDate.wrappedValue, date2: value.date)
                    //if let은 Optional 값을 Unwrapping 하는 과정
                        // if문 안의 조건문의 값이 nil인가 아닌가를 체크하고 nil이 아니면 if안의 구문 실행
                    //first(where) : 주어진 조건에 만족하는 첫번째 요소를 찾는 코드
                        //where: { 이름 in 반복이름 }을 스면 반복하는 것 같음
                    //isSameday : date1과 date2가 같으면 참, 다른날이면 거짓
                    //return : 반환값 (함수를 실행 시 나오게 만들 값)
                    //해석 : recordData = recordDate와 value.date 같은 날인(참) foodList의 첫번쨰 값이 비어있지(nil) 않으면
                    //켐이의 해석 : 푸드리스트에서 추가 날짜와 그냥 날짜를 비교해서 값이 있으면 참 조건을 실행해라

                }) {
                    ZStack { //값이 있을 경우
                        Text("\(value.day)")
                            .frame(height: 40)
                        
                        NavigationLink(destination: AddRecordView(AddDate: recordData.recordDate.wrappedValue, foodList: $foodList)) {
                            //페이지 뒤 ()에 "변수 : value.타입"을 입력하면 해당 페이지에 값을 넘겨줄 수 있음
                            //대신 넘겨받는 페이지에도 변수(데이터를 받을 빈깡통)을 만들어야함
                            //wrappedValue : 바인딩된 거의 껍데기를 벗기는 코드
                            Image(
                                recordData.ImgURL.wrappedValue
                            )
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }

                }
                else { //값이 없을 경우
                    NavigationLink(destination: AddRecordView(AddDate: value.date, foodList: $foodList)) {
                        Text("\(value.day)")
                            .foregroundColor(.black)
                            .frame(height: 40)
                    }
                }
            }
            //-1이 아니면 날짜를 표시해라(날짜 요일부터 나타내기)
        }
    }

    //운동 기록 날짜 확인
    func isSameday(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        //Calendar.current을 선언하면 현재 달의 달력을 확인할 수 있음
        return calendar.isDate(date1, inSameDayAs: date2)
        //isDate = 캘린더의 두 날짜를 비교해 참, 거짓을 판단하는 함수
        //현재 캘린더의 두 날짜를 비교해 참,거짓 판단
    }
    //(함수)isSameday = 입력받은 date1,date2를 비교해 같으면 참, 틀리면 거짓

    //년,월 정보 extrating해서 나타내기
    func extraDate() -> [String] {
        //extraDate는 문자 배열로 나타낼거라는 뜻!

        let formatter = DateFormatter()
        // 데이트 포멧을 하고싶으면 DateFormatter() 타입의 변수를 선언 후 사용해야함
        formatter.dateFormat = "YYYY MM"
        // 년, 월을 데이터의 포멧 정의
        let date = formatter.string(from: currentDate)
        //현재 시간의 Date를 포멧에 맞춰 String 타입으로 변환

        return date.components(separatedBy: " ")
        //문자열.components(separatedBy:) = separateBy에 속한 문자열을 제거한 배열로 만들어줌
        // 해석 : date 문자열에서 " "(스페이스)를 뺴고 배열로 만들어라 ["1", "2", "3" ... ]
    }
    //(함수)extraDate = 현재 날짜를 받아 "YYYY MM" 형태의 string 배열을 만들거임

    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        //현재 월 정보 가져오기
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        //guard 안의 조건문이 참(true)이 아니면 else문이 실행되는 문법
        //date(byAdding: to: options: ) = 지정된 날짜에 지정된 구성 요소를 추가하여 계산된 절대 시간을 나타내는 날짜를 반환
            //byAdding : 계산에 사용하는 단위(년,월,일,시간등) / value : 주어진 단위의 값(INT) / to : 계산을 하는데 사용할 날짜
        //해석 : currentMonth = 현재 캘린더의 날짜를 달단위로 현재
    
        return currentMonth
        //func에 대한 리턴값
        
    }

    func extractDate() -> [DateValue] {
        //DateValue에는 day와 date가 들어있음
        
        let calendar = Calendar.current

        //현재 월 정보 가져오기
        let currentMonth = getCurrentMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            // 날짜 받아오기
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }

        //해당 월의 시작 요일(1일의 요일)을 정하는 코드
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }//해당월의 시작일이 아닌면 -1로 노출


    var body: some View {
        VStack(spacing: 40) {
            //2.요일

            //1.년,월 및 화살표
            HStack {
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(Color.black)
                } //왼쪽 버튼
                Spacer()

                VStack {

                    Text(extraDate()[0])
                        .font(.system(size: 16))
                    Text(extraDate()[1])
                        .font(.title.bold())
                        .bold()
                }//날짜
                Spacer()

                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(Color.black)
                }
            }.padding(.horizontal, 16)

            //3.요일 반복문 작성
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity)
                }
            }

            //4.날짜데이터
            // 그리드
            let columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns, spacing: 30) {

                ForEach(extractDate()) { value in
                    CardView(value: value)
                }
                //LazyVGrid는 columns를 사용하여 반드시 GridItem이라는 매개변수를 같은 변수를 생성해야함
            }
        }
            .onChange(of: currentMonth) { newValue in
            // 달 업데이트하기
            currentDate = getCurrentMonth()
        }
    }
}


struct CustomDataPicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//현재 월을 가져오기 위한 날짜 연장...!
extension Date {

    func getAllDates() -> [Date] {
        //getAllDates = 날짜 타입의 배열로 나올거임!

        let calendar = Calendar.current

        //시작 날짜 가져오기
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        //date(from : 현재 날짜에
        //dateComponents : 날짜요소를 저장하는 타입(년,월,일,주,요일,시,분,초 등)
        //해석 : startDate = 현재 캘린더의 년,월 배열 중에서의 날짜정보가 담긴 것?

        let range = calendar.range(of: .day, in: .month, for: startDate)!
        //range.removeLast()
        //마지막 날까지 노출 (1일 부터 없어지게 범위를 잡음)
        //range = 월부터 일까지


        //gatting Data
        return range.compactMap { day -> Date in

            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            //byAdding : 형식, To : 앞의 형삭으로 표현할 날짜,
        }
    }
}
