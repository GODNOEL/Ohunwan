//
//  CustomDataPicker.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/29.
//

import SwiftUI

struct CustomDataPicker: View {
    @Binding var currentDate: Date
    
    // 달력 화살표를 눌렀을 떄 날짜 이동하도록 하기
    @State var currentMonth: Int = 0
    let days: [String] = ["S","M","T","W","T","F","S"]
    
    //년,월 정보 extrating해서 나타내기
    func extraDate()->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        
        //현재 월 정보 가져오기
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate()->[DateValue]{
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
            for _ in 0..<firstWeekday - 1{
                days.insert(DateValue(day: -1 , date: Date()), at: 0)
            }
            return days
        }

    
    var body: some View {
        VStack(spacing: 40){
            //2.요일
            
            //1.년,월 및 화살표
            HStack{
                Button {
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                } //왼쪽 버튼
                Spacer()
                
                VStack{
                    
                    Text(extraDate()[0])
                        .font(.system(size: 16))
                    Text(extraDate()[1])
                        .font(.title.bold())
                        .bold()
                }//날짜
                Spacer()
                
                Button {
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }.padding(.horizontal, 16)
            
            //3.요일 반복문 작성
            HStack{
                ForEach(days, id:\.self){day in
                    Text(day)
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity)
                }
            }
            
            //4.날짜데이터
            // 그리드
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns , spacing: 40) {
                
                ForEach(extractDate()){ value in
//                    Text("\(value.day)")
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
extension Date{
    
    func getAllDates()->[Date] {
        
        let calendar = Calendar.current
        
        //시작 날짜 가져오기
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calendar.range(of: .day, in : .month, for: startDate)!
//        range.removeLast()
        //마지막 날까지 노출 (1일 부터 없어지게 범위를 잡음)
         
        
        //gatting Data
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1 , to: startDate)!
        }
    }
}
