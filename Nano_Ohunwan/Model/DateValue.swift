//
//  DateValue.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/04/30.
//

import SwiftUI

//Date Value Model
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day : Int
    var date : Date
}

//Identifiable 프로토콜 : 단순히 id 프로퍼티를 가지고 있는 형태
//어떤 struct, class를 정의할 때 ID값이 필요한 경우 해당 protocol을 conform
//데이터를 받아오는 스트럭트를 만들 만들때는 해당 프로토콜 사용

//UUID는 범용 고유 식별자, 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
//UUID를 String 타입으로 주고싶으면 "UUID().uuidString" 사용
