//
//  CustomDataPicker.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/29.
//

import SwiftUI

struct CustomDataPicker: View {
    @Binding var currentDate: Date
//    @State var foodList = RecordMetaData.all()
    @Binding var foodList: [Record]
    // 달력 화살표를 눌렀을 떄 날짜 이동하도록 하기
    @State var currentMonth: Int = 0
//    @State var testData: Record
    let days: [String] = ["S", "M", "T", "W", "T", "F", "S"]

    //
    @ViewBuilder
    func CardView(value: DateValue) -> some View {

        VStack {
            if value.day != -1 {

                if let recordData = $foodList.first(where: { rec in
                    return isSameday(date1: rec.recordDate.wrappedValue, date2: value.date)
                    //isSameday : date1과 date2가 같으면 참, 다른날이면 거짓
                    //first(where) : 주어진 조건에 만족하는 첫번째 요소를 찾는 코드


                }) {
//                    Button(action: {}, label: {Text("\(value.date)")})
                    ZStack {
                        Text("\(value.day)")
                            .frame(height: 40)
                        NavigationLink(destination: AddRecordView(AddDate: recordData.recordDate.wrappedValue, foodList: $foodList)) {
                            //페이지 뒤 ()에 "변수 : value.타입"을 입력하면 해당 페이지에 값을 넘겨줄 수 있음
                            //대신 넘겨받는 페이지에도 변수(데이터를 받을 빈깡통)을 만들어야함

                            Image(
                                recordData.ImgURL.wrappedValue
                            )
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        //★★★★★운동기록에 선택한 이미지를 불러와야함 이건 어케하면 될가?
                        //if문하고 바인딩 써서 하면될것같은뎅
                    }

                }
                else {
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

        return calendar.isDate(date1, inSameDayAs: date2)
    }

    //년,월 정보 extrating해서 나타내기
    func extraDate() -> [String] {

        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MM"

        let date = formatter.string(from: currentDate)

        return date.components(separatedBy: " ")
    }

    func getCurrentMonth() -> Date {
        let calendar = Calendar.current

        //현재 월 정보 가져오기
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }

    func extractDate() -> [DateValue] {
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

        let calendar = Calendar.current

        //시작 날짜 가져오기
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)!
        //range.removeLast()
        //마지막 날까지 노출 (1일 부터 없어지게 범위를 잡음)


        //gatting Data
        return range.compactMap { day -> Date in

            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
