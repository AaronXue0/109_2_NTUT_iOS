//
//  ContentView.swift
//  HelloWorld
//
//  Created by Aaron Xue on 2021/4/26.
//

import SwiftUI

struct BtnRegister {
    var id = UUID()
}


struct ContentView: View {

    @State private var diceNum = 1
    @State private var diceNum1 = 1
    @State private var diceNum2 = 1
    
    @State private var resultStr: String = ""
    @State private var matchedStr: String = "猜測中"

    @State private var currencyAmount: Int32 = 1000
    
    var body: some View {
        VStack{
            Text("骰子遊戲")
                .font(.title).frame(height: 100)
            HStack{
                Image(systemName: "die.face.\(diceNum)")
                .resizable()
                .frame(width: 100, height: 100)
                Text("骰子 1 點數 : \(diceNum)")
                    .font(.system(size: 16, weight: .light, design: .serif))

            }
            HStack{
                Image(systemName: "die.face.\(diceNum1)")
                .resizable()
                .frame(width: 100, height: 100)
                Text("骰子 2 點數 : \(diceNum1)")
                    .font(.system(size: 16, weight: .light, design: .serif))

            }
            HStack{
                Image(systemName: "die.face.\(diceNum2)")
                .resizable()
                .frame(width: 100, height: 100)
                Text("骰子 3 點數 : \(diceNum2)")
                    .font(.system(size: 16, weight: .light, design: .serif))

            }
            HStack{
                TextField( "請輸入猜測總和", text: $resultStr).frame(width:200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                Button(action: {
                    diceNum=Int.random(in: 1...6)
                    diceNum1=Int.random(in: 1...6)
                    diceNum2=Int.random(in: 1...6)
                    if(Int(resultStr) ?? 0 >= diceNum + diceNum1+diceNum2)
                        {
                            currencyAmount += 100
                            matchedStr = "猜測成功加100元"
                    }else {
                        currencyAmount -= 100
                        matchedStr = "猜測失敗減100元"
                    }
                }, label: {
                    Text(" 猜測")
                })
            }
            HStack{
                Text("猜測結果 : \(matchedStr)")
                    .font(.system(size: 16, weight: .light, design: .serif)).frame(width:200, height: 50, alignment: .leading)
            }
            HStack{
                Text("目前金額 : \(currencyAmount)")
                    .font(.system(size: 16, weight: .light, design: .serif)).frame(width: 200, height: 50, alignment: .leading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
