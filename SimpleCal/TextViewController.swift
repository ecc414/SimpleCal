////
////  TextViewController.swift
////  SimpleCal
////
////  Created by 엄철찬 on 2022/03/30.
////
//
////
////  TextView.swift
////  SimpleCalculator
////
////  Created by 엄철찬 on 2022/03/20.
////
//
//import Foundation
//import UIKit
//import CoreMedia
//
//class TextViewController : UIViewController {
//    let placeHolder = "Make a note".localized
//    let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer()
//    lazy var dimView : UIView = {
//        let view = UIView(frame: self.view.frame)
//        view.backgroundColor = .black.withAlphaComponent(0.6)
//        view.addGestureRecognizer(tapGesture)
//        return view
//    }()                                //텍스트뷰이외의 공간으로 탭 했을 때 키보드를 내리기 위한 뷰
//    let textView : UITextView = {
//        let textView = UITextView()
//        textView.layer.cornerRadius = 10
//        textView.font = UIFont.systemFont(ofSize: 20)
//        textView.backgroundColor = .lightGray
//        return textView
//    }()
//    var gestureFlag = true                                              //dimView를 탭했을때 두가지의 경우를 만들기 위해서
//    var index = IndexPath()                                             //현재 클릭된 버튼이 있는 테이블뷰의 index
//    var currentBtn = UIButton()                                         //현재 클릭된 버튼
//    //MARK: - Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .clear
//        textView.addDoneBtnOnKeyboard()
//        tapGesture.delegate = self
//        view.addSubview(dimView)
//        setupTextView()
//    }
//    func historyViewController() -> HistoryViewController{
//        let mainVc = self.presentingViewController
//        guard let vc = mainVc as? HistoryViewController else{
//            return HistoryViewController()
//        }
//        return vc
//    }
//    func viewController() -> ViewController{
//        let mainVc = self.presentingViewController?.presentingViewController
//        guard let vc = mainVc as? ViewController else{
//            return ViewController()
//        }
//        return vc
//    }
//    func chagneBtnImage(){
//        if !textView.text.isEmpty{
//            currentBtn.setImage(UIImage(systemName: "circle.fill"), for: .normal)
//            currentBtn.setPreferredSymbolConfiguration(.init(pointSize: 15, weight: .medium, scale: .small), forImageIn: .normal)
//            currentBtn.tintColor = .orange
//        }
//    }   //comment가 있으면 버튼 색이 가득 차고 comment가 없으면 버튼이 빈다
//    func historySave(){
//        do {
//            viewController().viewModel.history[index.row].comment =  textView.text
//            let encoder = JSONEncoder()                                 // Create JSON Encoder
//            let data = try encoder.encode(viewController().viewModel.history)// Encode Note
//            UserDefaults.standard.set(data, forKey: "notes")            // Write/Set Data
//        } catch {
//            print("Unable to Encode Array of Notes (\(error))")
//        }
//    }
//    func setupTextView(){
//        view.addSubview(textView)
//        textView.delegate = self // 이 구문이 없다면 아래 extension에서 구현한 코드들이 적용이 되지 않는다
//        if textView.text.isEmpty{
//            textView.text = placeHolder
//            textView.textColor = .gray
//        }else{
//            textView.textColor = .black
//        }
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -50),
//            textView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.6),
//            textView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.3)
//        ])
//    }
//    func updateTextView(_ input : String){
//        textView.text = input
//    }
//}
////MARK: - Objc Methods
//extension TextViewController {
//    @objc func dismissClicked(){
//        historySave()
//        chagneBtnImage()
//        historyViewController().tableView.reloadData()
//        dismiss(animated: true, completion: nil)
//    }
//}
////MARK: - UITextViewDelegate
//extension TextViewController : UITextViewDelegate {
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        gestureFlag = false
//        if textView.text == placeHolder {
//            textView.text = nil
//            textView.textColor = .black
//        }
//    }
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textView.text == placeHolder {
//            textView.text = placeHolder
//            textView.textColor = .gray
//        }
//    }
//}
////MARK: - UIGestureRecognizerDelegate
//extension TextViewController : UIGestureRecognizerDelegate{
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        if gestureFlag {
//            if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textView.text == placeHolder {
//                textView.text = nil
//            }
//            dismissClicked()
//        }else{
//            self.view.endEditing(true)
//            gestureFlag = true
//        }
//        return true
//    }
//}
////MARK: - Add 'Done' button on keyboard
//extension UITextView {
//    func addDoneBtnOnKeyboard(){
//        let doneToolBar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//        doneToolBar.barStyle = .default
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let done : UIBarButtonItem = UIBarButtonItem(title: "Done".localized, style: .done, target: self, action: #selector(doneButtonAction))
//        done.tintColor = .systemBlue
//        let items = [flexSpace,done]
//        doneToolBar.items = items
//        doneToolBar.sizeToFit()
//        self.inputAccessoryView = doneToolBar
//    }
//    @objc func doneButtonAction(){
//        self.resignFirstResponder()
//    }
//}
//
//
//
//
//


//
//  TextViewController.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//

//
//  TextView.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/03/20.
//

import Foundation
import UIKit
import CoreMedia

class TextViewController : UIViewController {
    var history = Histroy.shared
    let placeHolder = "Make a note".localized
    let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer()
    lazy var dimView : UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.addGestureRecognizer(tapGesture)
        return view
    }()                                //텍스트뷰이외의 공간으로 탭 했을 때 키보드를 내리기 위한 뷰
    let textView : UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = .lightGray
        return textView
    }()
    var gestureFlag = true                                              //dimView를 탭했을때 두가지의 경우를 만들기 위해서
    var index = IndexPath()                                             //현재 클릭된 버튼이 있는 테이블뷰의 index
    var currentBtn = UIButton()                                         //현재 클릭된 버튼
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        textView.addDoneBtnOnKeyboard()
        tapGesture.delegate = self
        view.addSubview(dimView)
        setupTextView()
    }
    func historyViewController() -> HistoryViewController{
        let mainVc = self.presentingViewController
        guard let vc = mainVc as? HistoryViewController else{
            return HistoryViewController()
        }
        return vc
    }
    func viewController() -> ViewController{
        let mainVc = self.presentingViewController?.presentingViewController
        guard let vc = mainVc as? ViewController else{
            return ViewController()
        }
        return vc
    }
    func chagneBtnImage(){
        if !textView.text.isEmpty{
            currentBtn.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            currentBtn.setPreferredSymbolConfiguration(.init(pointSize: 15, weight: .medium, scale: .small), forImageIn: .normal)
            currentBtn.tintColor = .orange
        }
    }   //comment가 있으면 버튼 색이 가득 차고 comment가 없으면 버튼이 빈다
//    func historySave(){
//        do {
//            //viewController().viewModel.history[index.row].comment =  textView.text
//            history.history[index.row].comment =  textView.text
//            let encoder = JSONEncoder()                                 // Create JSON Encoder
//            let data = try encoder.encode(viewController().viewModel.history)// Encode Note
//            UserDefaults.standard.set(data, forKey: "notes")            // Write/Set Data
//        } catch {
//            print("Unable to Encode Array of Notes (\(error))")
//        }
//    }
    func setupTextView(){
        view.addSubview(textView)
        textView.delegate = self // 이 구문이 없다면 아래 extension에서 구현한 코드들이 적용이 되지 않는다
        if textView.text.isEmpty{
            textView.text = placeHolder
            textView.textColor = .gray
        }else{
            textView.textColor = .black
        }
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -50),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.6),
            textView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.3)
        ])
    }
    func updateTextView(_ input : String){
        textView.text = input
    }
}
//MARK: - Objc Methods
extension TextViewController {
    @objc func dismissClicked(){
        //historySave()
        history.textSave(textView.text, at: index)
        chagneBtnImage()
        historyViewController().tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
//MARK: - UITextViewDelegate
extension TextViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        gestureFlag = false
        if textView.text == placeHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textView.text == placeHolder {
            textView.text = placeHolder
            textView.textColor = .gray
        }
    }
}
//MARK: - UIGestureRecognizerDelegate
extension TextViewController : UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureFlag {
            if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textView.text == placeHolder {
                textView.text = nil
            }
            dismissClicked()
        }else{
            self.view.endEditing(true)
            gestureFlag = true
        }
        return true
    }
}
//MARK: - Add 'Done' button on keyboard
extension UITextView {
    func addDoneBtnOnKeyboard(){
        let doneToolBar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done : UIBarButtonItem = UIBarButtonItem(title: "Done".localized, style: .done, target: self, action: #selector(doneButtonAction))
        done.tintColor = .systemBlue
        let items = [flexSpace,done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        self.inputAccessoryView = doneToolBar
    }
    @objc func doneButtonAction(){
        self.resignFirstResponder()
    }
}





