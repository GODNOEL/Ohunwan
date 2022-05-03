//
//  AddFoodScreen.swift
//  Nano_Ohunwan
//
//  Created by Yu ahyeon on 2022/05/01.
//

import SwiftUI

struct AddFoodScreen: View {
    @Environment(\.presentationMode) var presentationMode
    //팝업 닫기 버튼 구현을 위해 Environment 변수를 가져와야함
    @Binding var foodIndex: String
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    //LazyVGird를 사용하기위해 colums를 변수로 지정,
    //gridItem을 추가에 따라 뷰에 보여지는 갯수가 변함(지금은 2개라서 2단이 나타남)
    
    @State var foodImgList = ["food_1", "food_2", "food_3", "food_4","food_5"]
    @State var foodNameList = ["닭가슴살", "양상추", "토마토", "치즈","햄","계란"]
    @State var foodTextList = ["근력 위주의 운동", "설명2", "얼굴이 빨개질만큼 열정적 운동", "설명3","설명4","설명5"]
    
    //    let FoodName = Array(1...5).map{"목록 \($0)"}
    //    let colums = [
    //        GridItem(.adaptive(minimum: 100))
    //    ]
    
    var body: some View{
        VStack{
            HStack{
                Text("오늘의 재료를 선택해주세요!")
                    .font(.system(size:20).bold())
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                }
            }
            .padding(.bottom, 20)
            
            
            .foregroundColor(.black)
            .font(.system(size: 30))
            
            LazyVGrid(columns: columns, spacing: 50){
                ForEach(Array(zip(foodImgList, foodNameList)), id: \.0) { value in
                    Button(action: {
                        foodIndex = value.0
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        VStack(){
                            Image(value.0)
                                .resizable()
                                .frame(width: 150, height: 150)
                            VStack{
                                Text(value.1)
                                    .font(.system(size: 18).bold())
                                    .foregroundColor(.black)
                                Text(foodTextList[foodNameList.firstIndex(of: value.1)!])
                                    .font(.system(size: 14).bold())
                                    .foregroundColor(.gray)
                                //array[0]으로 해야지 0번째 인덱스를 받아오는데 인덱스를 순서대로 돌리기 위해
                                //다른 array의 인덱스값을 뽑아주는.firstIndex(of: value.1)를 사용 (value 뒤에 1 붙은거는 zip때문에)
                                // 그리고 스위프트는 인덱스가 없는 경우도 생각하기때문에 강제 언랩핑을 해줘야함
                            }
                        }
                    })
                }
            }
            
            
        }
    }
}

//struct AddFoodScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFoodScreen()
//    }
//}
