////
////  ViewModel.swift
////  SimpleCal
////
////  Created by 엄철찬 on 2022/03/30.
////
////
////  ViewModel.swift
////  SimpleCalculator
////
////  Created by 엄철찬 on 2022/02/14.
////
//
//import Foundation
//import CoreMedia
//
//class ViewModel{
//    //MARK: - 변수
//    var history = [DataModel]()                                                         //계산된 값을 저장하는 Model이라는 구조체의 인스턴스 배열을 생성
//    var isEnterClicked = false                                                          //엔터 후 동작을 위한 변수
//    var input = String()
//    var message = false
//    var expression = [String]()
//    var numbers = [String]()
//    var operators = [String]()
//    let numArray : CharacterSet = ["1","2","3","4","5","6","7","8","9","0",".","%","-",","]
//    let opArray : CharacterSet = ["+","–","×","÷"]
//    var prepareForLastNumber : [String] {
//        return input.filter{ $0 != " "}.components(separatedBy: opArray)
//    }
//    var lastNumber : String {
//        return prepareForLastNumber[prepareForLastNumber.index(before: prepareForLastNumber.endIndex)]
//    }
//    var beyondSpaceFromEnd : Character {
//        return input[input.index(input.endIndex, offsetBy: -2)]
//    }
//    //MARK: - 입력창관련함수
//    func expressionLabel() -> String{               //소수점 이하 0을 입력할 때 보이게 할것
//        if input.isEmpty{
//            return ""
//        }
//        expression    = input.filter{ $0 != "H" }.filter{$0 != ","}.split(separator: " ").map{ String($0) }//.dotExpress() }
//        countInspector( expression[ expression.endIndex - 1 ] )//입력창에 표시될 문자열
//        return expression.map{$0.dotExpress()}.reduce("", +)                   //마지막 숫자 포함해서 입력창문자열 반환
//    }
//    func countInspector(_ input:String){
//        let limitCount = input.hasPrefix("-") ? 16 : 15
//        if input.split(separator: ".")[0].filter({$0 != ","}).filter({$0 != "H"}).count > limitCount{//숫자 15자리 이상은 입력 못한다고 알림 함수
//            message = true
//            self.input.removeLast()
//            expression[expression.endIndex-1].removeLast()
//        }
//        if input.split(separator: ".").count > 1 {//소수점 10자리 이상 입력 못한다고 알림 함수
//            var count = 1
//            for _ in input.split(separator: ".")[1]{
//                count += 1
//            }
//            if input.split(separator: ".")[1].contains("e"){
//                return
//            }
//            while( count > limitCount - 4 ){
//                message = true
//                self.input = String(self.input.dropLast())
//                expression[expression.endIndex-1].removeLast()
//                count -= 1
//            }//For Double Zero
//        }
//    }   // 숫자 15자리 이상 입력 제한, 소수점 10자리 이상 입력 제한
//    //MARK: - 결과창관련함수
//    func answerLabel() -> String{
//        calculate()   // -> numbers[0]이 결과값
//        return numbers.isEmpty ? "" : numbers[0].expression()
//    }
//    func calculate(){
//        operators = input.split(separator: " ").filter{["+","–","×","÷"].contains($0)}.map{String($0)}  //연산자배열에 연산자 대입
//        numbers = input.filter{$0 != "H"}.filter{$0 != ","}.split(separator: " ").filter{!["+","–","×","÷"].contains($0)}.map{String($0)}//.map{percent(String($0))}
//        percent()
//        cutLastOp()   //식의 마지막에 연산자가 있으면 삭제
//        fifo("×", "÷")
//        fifo("+", "–")
//    }
//    func percent() {
//        var percentIndex = [Int]()
//        for (index,value) in numbers.enumerated(){
//            if value == "%" {
//                numbers[index-1] = String(Double(numbers[index-1])!*0.01)
//                percentIndex.append(index)
//            }
//        }
//        percentIndex.sorted(by: >).forEach{ numbers.remove(at: $0)}
//
//    }          //퍼센트부호를 제거하고 0.01을 곱해주는 함수
//    func fifo(_ op1:String, _ op2:String){
//        repeat{
//            if let a = operators.firstIndex(where: { $0 == op1 || $0 == op2 }) {
//                if numbers.last == "-" || operators.count == numbers.count{
//                    return
//                }
//                reduceArrs(operators[a], index: a)
//            }
//        }while(operators.contains(where: { $0 == op1 || $0 == op2 }))
//    }               //곱셈과 나눗셈은 교환법칙이 성립하지 않으므로 선입선출
//    func reduceArrs(_ op:String, index:Int){
//        numbers.replaceSubrange(index...index+1, with: [ doMath(Double(numbers[index])!, Double(numbers[index+1])!, op) ] )
//        operators.remove(at: index)
//    }             //연산자에 해당되는 연산수행 후에 숫자배열과 연산자배열 제거
//    func doMath(_ value1:Double, _ value2:Double ,_ arithmetic:String) -> String{
//        switch arithmetic{
//        case "+":
//            return String(value1+value2)
//        case "–":
//            return String(value1-value2)
//        case "×":
//            return String(value1*value2)
//        case "÷":
//            return String(value1/value2)
//        default:
//            return ""
//        }
//    }//사칙연산
//    //MARK: - 편집함수
//    func cutLastOp(){
//        if !operators.isEmpty{
//            if input.last == " " && beyondSpaceFromEnd != "%"{
//                operators.removeLast()
//            }
//        }
//    }                                    //계산 시 식의 마지막에 연산자 있을 경우 제거
//    func changeLastOp(){
//        if input.hasSuffix(" ") && beyondSpaceFromEnd != "%"{
//            input.removeLast(3)
//        }else if input.last == "." {
//            input.removeLast()
//        }
//    }        //마지막 입력이 " "이고, " " 너머 마지막 입력이 "%"가 아니면 입력 3칸 제거(" " + "연산자" + " " 해서 3칸)
//    func isPercent(){
//        if input.count > 3 , beyondSpaceFromEnd == "%" {
//            input.append(" × ")
//        }
//        if input.last == "H" {
//            input.append(" × ")
//        }
//    }           //입력의 크기가 3 이상이고(뒤 조건의 index오류 방지), 입력의 두칸 앞에 %있으면 × 자동 입력
//    //MARK: - ButtonFuntions
//    func enterButton(){
//        calculate()
//        var output = numbers[0].expression()
//        output = "H" + numbers[0].expression() + "H"
//        history.append(DataModel(input: expressionLabel(), output: numbers.isEmpty ? "" : output, comment: ""))
//        HistoryFunctions.historySave(history)
//        isEnterClicked = true
//        input = output.filter{ $0 != "," }
//    }
//    func dotButton() -> Bool{
//        guard !input.isEmpty else { return false }
//        expression    = input.filter{ $0 != "H" }.split(separator: " ").map{ String($0) }//.dotExpress() }
//        let isExp = expression[expression.endIndex - 1]//입력창에 표시될 문자열
//        if isExp.contains("e"){
//            return false
//        }
//        if lastNumber.contains("."){//numbers[numbers.index(before: numbers.endIndex)].contains("."){
//            return false
//        }
//        if input.last == " " || input.last == "-"{
//            return false
//        }
//        return true
//    }   //입력이 없으면 false, 마지막 숫자에 이미 . 이 있으면 false, 마지막 입력이 " "이거나 마이너스 부호면 false, 그렇지 않은 경우에 . 입력
//    func percentButton(){
//        guard !input.isEmpty else { return }
//        switch input.last {
//        case " ","-" :
//            return
//        case "." :
//            input.removeLast()
//            input.append(" % ")
//        default :
//            input.append(" % ")
//        }
//    }       //입력이 없으면 넘어감, 마지막 입력이 " ",".","-" 중에 하나면 넘어감, 그렇지 않은 경우에 %입력
//    func signButton() {
//        if input.isEmpty{
//            input.append("-")
//            return
//        }
//        expression    = input.split(separator: " ").map{ String($0) }//.dotExpress() }
//        let isExp = expression[expression.endIndex - 1]
//        if input.last == " "{
//            input.append("-")
//            return
//        }
//        if isExp.contains("-"){
//            let index = isExp.contains("H") ? input.index(input.endIndex, offsetBy: -isExp.count+1) : input.index(input.endIndex, offsetBy: -isExp.count)
//            input.remove(at: index)
//        }else{
//            let index = isExp.contains("H") ? input.index(input.endIndex, offsetBy: -isExp.count+1) : input.index(input.endIndex, offsetBy: -isExp.count)
//            input.insert("-", at: index)
//        }
//
//    }         //입력이 없으면 마이너스 부호 입력, 마지막 숫자에 마이너스 부호 있으면 그 부호 삭제, 마지막 숫자에 마이너스 부호 없으면 부호 삽입
//}
//
//
//
//
//
//
//extension String {
//    func dotExpress()->String{
//        if self.contains(".") && self.last != "."{                        //expresionLabel은 소수점 이하 0도 표시해야하기 때문에
//            let result =  self.split(separator: ".")[0]
//            let afterFloating =  self.split(separator: ".")[1]
//            return Double(result)!.comma() + String(".") + afterFloating
//        }
//        if let num = Double(self) {
//        return num.comma()
//        }
//        return self
//    }
//
//
//    func expression()->String{
//        if let num = Double(self) {
//            if num > 999999999999999999.0{
//                return String(format: "%.10e", num)
//            }else if num < -999999999999999999.0{
//                return String(format: "%.10e", num)
//            }else{
//                return num.comma()
//            }
//        }else{
//            return self
//        }
//    }
//}
//
//extension Double {
//    func comma() -> String{
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        numberFormatter.maximumFractionDigits = 10
//        return numberFormatter.string(for: self)!
//    }
//}


//
//  ViewModel.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//
//
//  ViewModel.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/02/14.
//

import Foundation
import CoreMedia

class ViewModel{
    //MARK: - 변수
  //  var history = [DataModel]()                                                         //계산된 값을 저장하는 Model이라는 구조체의 인스턴스 배열을 생성
    var isEnterClicked = false                                                          //엔터 후 동작을 위한 변수
    var input = String()
    var message = false
    var expression = [String]()
    var numbers = [String]()
    var operators = [String]()
    let numArray : CharacterSet = ["1","2","3","4","5","6","7","8","9","0",".","%","-",","]
    let opArray : CharacterSet = ["+","–","×","÷"]
    var prepareForLastNumber : [String] {
        return input.filter{ $0 != " "}.components(separatedBy: opArray)
    }
    var lastNumber : String {
        return prepareForLastNumber[prepareForLastNumber.index(before: prepareForLastNumber.endIndex)]
    }
    var beyondSpaceFromEnd : Character {
        return input[input.index(input.endIndex, offsetBy: -2)]
    }
    
    var history = Histroy.shared

    
    //MARK: - 입력창관련함수
    func expressionLabel() -> String{               //소수점 이하 0을 입력할 때 보이게 할것
        if input.isEmpty{
            return ""
        }
        expression    = input.filter{ $0 != "H" }.filter{$0 != ","}.split(separator: " ").map{ String($0) }//.dotExpress() }
        countInspector( expression[ expression.endIndex - 1 ] )//입력창에 표시될 문자열
        return expression.map{$0.dotExpress()}.reduce("", +)                   //마지막 숫자 포함해서 입력창문자열 반환
    }
    func countInspector(_ input:String){
        let limitCount = input.hasPrefix("-") ? 16 : 15
        if input.split(separator: ".")[0].filter({$0 != ","}).filter({$0 != "H"}).count > limitCount{//숫자 15자리 이상은 입력 못한다고 알림 함수
            message = true
            self.input.removeLast()
            expression[expression.endIndex-1].removeLast()
        }
        if input.split(separator: ".").count > 1 {//소수점 10자리 이상 입력 못한다고 알림 함수
            var count = 1
            for _ in input.split(separator: ".")[1]{
                count += 1
            }
            if input.split(separator: ".")[1].contains("e"){
                return
            }
            while( count > limitCount - 4 ){
                message = true
                self.input = String(self.input.dropLast())
                expression[expression.endIndex-1].removeLast()
                count -= 1
            }//For Double Zero
        }
    }   // 숫자 15자리 이상 입력 제한, 소수점 10자리 이상 입력 제한
    //MARK: - 결과창관련함수
    func answerLabel() -> String{
        calculate()   // -> numbers[0]이 결과값
        return numbers.isEmpty ? "" : numbers[0].expression()
    }
    func calculate(){
        operators = input.split(separator: " ").filter{["+","–","×","÷"].contains($0)}.map{String($0)}  //연산자배열에 연산자 대입
        numbers = input.filter{$0 != "H"}.filter{$0 != ","}.split(separator: " ").filter{!["+","–","×","÷"].contains($0)}.map{String($0)}//.map{percent(String($0))}
        percent()
        cutLastOp()   //식의 마지막에 연산자가 있으면 삭제
        fifo("×", "÷")
        fifo("+", "–")
    }
    func percent() {
        var percentIndex = [Int]()
        for (index,value) in numbers.enumerated(){
            if value == "%" {
                numbers[index-1] = String(Double(numbers[index-1])!*0.01)
                percentIndex.append(index)
            }
        }
        percentIndex.sorted(by: >).forEach{ numbers.remove(at: $0)}

    }          //퍼센트부호를 제거하고 0.01을 곱해주는 함수
    func fifo(_ op1:String, _ op2:String){
        repeat{
            if let a = operators.firstIndex(where: { $0 == op1 || $0 == op2 }) {
                if numbers.last == "-" || operators.count == numbers.count{
                    return
                }
                reduceArrs(operators[a], index: a)
            }
        }while(operators.contains(where: { $0 == op1 || $0 == op2 }))
    }               //곱셈과 나눗셈은 교환법칙이 성립하지 않으므로 선입선출
    func reduceArrs(_ op:String, index:Int){
        numbers.replaceSubrange(index...index+1, with: [ doMath(Double(numbers[index])!, Double(numbers[index+1])!, op) ] )
        operators.remove(at: index)
    }             //연산자에 해당되는 연산수행 후에 숫자배열과 연산자배열 제거
    func doMath(_ value1:Double, _ value2:Double ,_ arithmetic:String) -> String{
        switch arithmetic{
        case "+":
            return String(value1+value2)
        case "–":
            return String(value1-value2)
        case "×":
            return String(value1*value2)
        case "÷":
            return String(value1/value2)
        default:
            return ""
        }
    }//사칙연산
    //MARK: - 편집함수
    func cutLastOp(){
        if !operators.isEmpty{
            if input.last == " " && beyondSpaceFromEnd != "%"{
                operators.removeLast()
            }
        }
    }                                    //계산 시 식의 마지막에 연산자 있을 경우 제거
    func changeLastOp(){
        if input.hasSuffix(" ") && beyondSpaceFromEnd != "%"{
            input.removeLast(3)
        }else if input.last == "." {
            input.removeLast()
        }
    }        //마지막 입력이 " "이고, " " 너머 마지막 입력이 "%"가 아니면 입력 3칸 제거(" " + "연산자" + " " 해서 3칸)
    func isPercent(){
        if input.count > 3 , beyondSpaceFromEnd == "%" {
            input.append(" × ")
        }
        if input.last == "H" {
            input.append(" × ")
        }
    }           //입력의 크기가 3 이상이고(뒤 조건의 index오류 방지), 입력의 두칸 앞에 %있으면 × 자동 입력
    //MARK: - ButtonFuntions
    func enterButton(){
        calculate()
        var output = numbers[0].expression()
        output = "H" + numbers[0].expression() + "H"
        history.history.append(DataModel(input: expressionLabel(), output: numbers.isEmpty ? "" : output, comment: ""))
        history.historySave()
        //HistoryFunctions.historySave(history)
        isEnterClicked = true
        input = output.filter{ $0 != "," }
    }
    func dotButton() -> Bool{
        guard !input.isEmpty else { return false }
        expression    = input.filter{ $0 != "H" }.split(separator: " ").map{ String($0) }//.dotExpress() }
        let isExp = expression[expression.endIndex - 1]//입력창에 표시될 문자열
        if isExp.contains("e"){
            return false
        }
        if lastNumber.contains("."){//numbers[numbers.index(before: numbers.endIndex)].contains("."){
            return false
        }
        if input.last == " " || input.last == "-"{
            return false
        }
        return true
    }   //입력이 없으면 false, 마지막 숫자에 이미 . 이 있으면 false, 마지막 입력이 " "이거나 마이너스 부호면 false, 그렇지 않은 경우에 . 입력
    func percentButton(){
        guard !input.isEmpty else { return }
        switch input.last {
        case " ","-" :
            return
        case "." :
            input.removeLast()
            input.append(" % ")
        default :
            input.append(" % ")
        }
    }       //입력이 없으면 넘어감, 마지막 입력이 " ",".","-" 중에 하나면 넘어감, 그렇지 않은 경우에 %입력
    func signButton() {
        if input.isEmpty{
            input.append("-")
            return
        }
        expression    = input.split(separator: " ").map{ String($0) }//.dotExpress() }
        let isExp = expression[expression.endIndex - 1]
        if input.last == " "{
            input.append("-")
            return
        }
        if isExp.contains("-"){
            let index = isExp.contains("H") ? input.index(input.endIndex, offsetBy: -isExp.count+1) : input.index(input.endIndex, offsetBy: -isExp.count)
            input.remove(at: index)
        }else{
            let index = isExp.contains("H") ? input.index(input.endIndex, offsetBy: -isExp.count+1) : input.index(input.endIndex, offsetBy: -isExp.count)
            input.insert("-", at: index)
        }

    }         //입력이 없으면 마이너스 부호 입력, 마지막 숫자에 마이너스 부호 있으면 그 부호 삭제, 마지막 숫자에 마이너스 부호 없으면 부호 삽입
}






extension String {
    func dotExpress()->String{
        if self.contains(".") && self.last != "."{                        //expresionLabel은 소수점 이하 0도 표시해야하기 때문에
            let result =  self.split(separator: ".")[0]
            let afterFloating =  self.split(separator: ".")[1]
            return Double(result)!.comma() + String(".") + afterFloating
        }
        if let num = Double(self) {
        return num.comma()
        }
        return self
    }
    
    
    func expression()->String{
        if let num = Double(self) {
            if num > 999999999999999999.0{
                return String(format: "%.10e", num)
            }else if num < -999999999999999999.0{
                return String(format: "%.10e", num)
            }else{
                return num.comma()
            }
        }else{
            return self
        }
    }
}

extension Double {
    func comma() -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 10
        return numberFormatter.string(for: self)!
    }
}
