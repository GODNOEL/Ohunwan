//
//  Record.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/05/01.
//

import SwiftUI

//기록 배열
struct Record: Identifiable {
    var id = UUID().uuidString
    var title : String
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

var records: [RecordMetaData] = [
    RecordMetaData(record: [
    
        Record(title: "운동기록1"),
        Record(title: "운동기록2운동기록2"),
        Record(title: "운동기록3운동기록3운동기록3"),
    ], recordDate: getSmpleDate(offset: 1)),
    RecordMetaData(record: [
    
        Record(title: "다른날운동기록")
    ], recordDate: getSmpleDate(offset: -3)),
    RecordMetaData(record: [
    
        Record(title: "운동기록이 있습니둥")
    ], recordDate: getSmpleDate(offset: -8)),
    RecordMetaData(record: [
    
        Record(title: "운동기록이있습니당")
    ], recordDate: getSmpleDate(offset: 10)),
    RecordMetaData(record: [
    
        Record(title: "샌드위치 만들어보자~")
    ], recordDate: getSmpleDate(offset: -22)),
    RecordMetaData(record: [
    
        Record(title: "가보자고~")
    ], recordDate: getSmpleDate(offset: 15)),
    RecordMetaData(record: [
    
        Record(title: "운동샌드위치")
    ], recordDate: getSmpleDate(offset: -20)),
]

