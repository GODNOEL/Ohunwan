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
    var time : Date = Date()
}

 //Total task Meta View
struct RecordMetaData: Identifiable{
    var id = UUID().uuidString
    var record : [Record]
    // []는 배열을 의미
    var recordDate : Date
}

 //샘플데이터라는뎅,,,
func getSmpleDate(offset: Int)->Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// 어디서든 쓸 수 있는 함수로 만들기 위해 extension 사용, all()을 입력하면 return에 들어있는 리스트 값을 불러옴
//extension 사용 하려면 쓰려는 페이지 상단에 선언해줘야함
extension RecordMetaData{
    static func all()-> [RecordMetaData]{
    return [
        RecordMetaData(record: [
            Record(foodName: "닭가슴살", ImgURL: "food_1", foodText: "근력 위주의 단단한 운동!"),
        ], recordDate: getSmpleDate(offset: 1)),
        
        RecordMetaData(record: [
            Record(foodName: "양상추", ImgURL: "food_2", foodText: "양상추,,설명,,,")
        ], recordDate: getSmpleDate(offset: -3)),
        
        RecordMetaData(record: [
            Record(foodName: "토마토", ImgURL: "food_3", foodText: "얼굴이 빨개질 만큼 열정 넘치는 운동!")
        ], recordDate: getSmpleDate(offset: -8)),
        
        RecordMetaData(record: [
            Record(foodName: "치즈", ImgURL: "food_4", foodText: "치즈 설명..")
        ], recordDate: getSmpleDate(offset: 10)),
            
        RecordMetaData(record: [
            Record(foodName: "햄", ImgURL: "food_5", foodText: "햄..설명")
        ], recordDate: getSmpleDate(offset: -22)),
            
        RecordMetaData(record: [
            Record(foodName: "계란", ImgURL: "food_6", foodText: "계란설명,,")
        ], recordDate: getSmpleDate(offset: 15)),
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
