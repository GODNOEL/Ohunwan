//
//  Record.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/05/01.
//

import SwiftUI

//기록 배열
//struct Record: Identifiable {
//    var id = UUID().uuidString
//    var title : String
//    var time : Date = Date()
//}

struct Water {
    var id: Int
    var selected: Bool
}


struct Record: Identifiable {
    var id = UUID().uuidString
    var foodName : String
    var ImgURL : String
    var foodText : String
    var summaryText : String
    var exerciseText : String
    var todayCondition : String
    var todayWeather: String
    var drinkWater : Int
    var exerciseTime : Double
    var recordDate : Date
}
//운동기록 입력 값을 저장하는 struct!

 //Total task Meta View
//struct RecordMetaData: Identifiable{
//    var id = UUID().uuidString
//    var record : Record
    // []는 배열을 의미, 값을 여러개 넣을 수 있음
//    var recordDate : Date
//}

 //샘플데이터라는뎅,,,
func getSmpleDate(offset: Int)->Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// 어디서든 쓸 수 있는 함수로 만들기 위해 extension 사용, all()을 입력하면 return에 들어있는 리스트 값을 불러옴
//extension 사용 하려면 쓰려는 페이지 상단에 선언해줘야함
extension Record{
    static func all()-> [Record]{
    return [
        
        Record(foodName: "닭가슴살", ImgURL: "food_3", foodText: "근력 위주의 단단한 운동!", summaryText: "오늘 운동 짱잼", exerciseText: "너모재미있다", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -4)),
        
        Record(foodName: "토마토", ImgURL: "food_2", foodText: "얼굴이 빨개질만큼 열정적 운동", summaryText: "오늘 운동 개열심히햇다", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -1)),
        
        Record(foodName: "토마토", ImgURL: "food_1", foodText: "얼굴이 빨개질만큼 열정적 운동", summaryText: "오늘 운동 개열심히햇다", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -10)),
        
        Record(foodName: "토마토", ImgURL: "food_2", foodText: "얼굴이 빨개질만큼 열정적 운동", summaryText: "오늘 운동 개열심히햇다", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -15)),
        
        Record(foodName: "토마토", ImgURL: "food_3", foodText: "얼굴이 빨개질만큼 열정적 운동", summaryText: "오늘 운동 개열심히햇다", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -17)),
        
        Record(foodName: "토마토", ImgURL: "food_3", foodText: "얼굴이 빨개질만큼 열정적 운동", summaryText: "오늘 운동 개열심히햇다", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -20)),
        
        Record(foodName: "토마토", ImgURL: "food_4", foodText: "얼굴이 빨개질만큼 열정적 운동", summaryText: "오늘 운동 개열심히햇다", exerciseText: "꿀잼딱", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0, recordDate: getSmpleDate(offset: -22)),

//        RecordMetaData(record:
//        Record(foodName: "닭가슴살", ImgURL: "food_1", foodText: "근력 위주의 단단한 운동!", summaryText: "오늘 운동 짱잼", exerciseText: "너모재미있다", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 2, exerciseTime: 60.0),recordDate: getSmpleDate(offset: 1)),
//
//        RecordMetaData(record:
//            Record(foodName: "닭가슴살", ImgURL: "food_1", foodText: "근력 위주의 단단한 운동!", summaryText: "오늘 운동 짱잼", exerciseText: "너모재미있다", todayCondition: "😀", todayWeather: "sun.max", drinkWater: 1, exerciseTime: 30.0),recordDate: getSmpleDate(offset: 5)),
        
    ]
    }

}
//
//var records: [RecordMetaData] = [
//    RecordMetaData(record: [
//
//        Record(title: "운동기록1"),
//        Record(title: "운동기록2운동기록2"),
//        Record(title: "운동기록3운동기록3운동기록3"),
//    ], recordDate: getSmpleD`ate(offset: 1)),
//    RecordMetaData(record: [
//
//        Record(title: "다른날운동기록")
//    ], recordDate: getSmpleDate(offset: -3)),
//    RecordMetaData(record: [
//
//        Record(title: "운동기록이 있습니둥")
//    ], recordDate: getSmpleDate(offset: -8)),
//    RecordMetaData(record: [
//
//        Record(title: "운동기록이있습니당")
//    ], recordDate: getSmpleDate(offset: 10)),
//    RecordMetaData(record: [
//
//        Record(title: "샌드위치 만들어보자~")
//    ], recordDate: getSmpleDate(offset: -22)),
//    RecordMetaData(record: [
//
//        Record(title: "가보자고~")
//    ], recordDate: getSmpleDate(offset: 15)),
//    RecordMetaData(record: [
//
//        Record(title: "운동샌드위치")
//    ], recordDate: getSmpleDate(offset: -20)),
//]
//
