////
////  HistoryViewController.swift
////  SimpleCal
////
////  Created by 엄철찬 on 2022/03/30.
////
//
////
////  HistoryViewController.swift
////  SimpleCalculator
////
////  Created by 엄철찬 on 2022/02/15.
////
//
//import UIKit
//import SnapKit
//import AVKit
//import Foundation
//
//class HistoryViewController: UIViewController {
//    //MARK: - TableView
//    let tableView : UITableView = {
//        let tableView = UITableView()
//        tableView.rowHeight = UITableView.automaticDimension
//        return tableView
//    }()
//    func setupTableView(){
//        view.addSubview(tableView)
//        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//        tableView.backgroundColor = .init(hue: 300/360, saturation: 0.05, brightness: 0.05, alpha: 1)
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//    func setTableViewConstraints(atTop trashButton:UIButton,atBottom closeButton:UIButton) {
//        tableView.snp.makeConstraints{ make in
//            make.leading.trailing.equalToSuperview()
//            make.top.equalTo(trashButton.snp.bottom).offset(10)
//            make.bottom.equalTo(closeButton.snp.top).offset(-10)
//        }
//    }
//    // var height = 1
//    var audioPlayer   = AVAudioPlayer()
//    func viewController() -> ViewController{
//        let mainVc = self.presentingViewController
//        guard let vc = mainVc as? ViewController else{
//            return ViewController()
//        }
//        return vc
//    }
//    //MARK: - Buttons
//    lazy var closeButton : UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .init(hue: 213/360, saturation: 0.09, brightness: 0.41, alpha: 1)
//        button.layer.cornerRadius = 10
//        button.setTitle( "Close".localized , for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.setTitleColor(.darkGray, for: .highlighted)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.addTarget(self, action: #selector(closeButtonClicked), for: .touchUpInside)
//        return button
//    }()
//    lazy var trashButton : UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "trash"), for: .normal)
//        button.setPreferredSymbolConfiguration(.init(pointSize: 25, weight: .regular, scale: .default), forImageIn: .normal)
//        button.tintColor = .white
//        button.imageView?.contentMode = .scaleAspectFit
//        button.addTarget(self, action: #selector(trashButtonClicked), for: .touchUpInside)
//        return button
//    }()
//    //MARK: - Label
//    let titleLabel : UILabel = {
//        let label = UILabel()
//        label.text = "History".localized
//        label.font = UIFont.systemFont(ofSize: 25)
//        label.textColor = .white
//        label.backgroundColor = .black
//        label.textAlignment = .left
//        return label
//    }()
//    //MARK: - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .black
//
//        setupTableView()
//        addButtons()
//        addLabel()
//
//        setLabelConstraints()
//        setButtonsConstraints()
//        setTableViewConstraints(atTop: trashButton, atBottom: closeButton)
//    }
//}
////MARK: - Objc Methods
//extension HistoryViewController {
//    @objc func closeButtonClicked(_ sender : UIButton){
//        soundEffect()
//        self.dismiss(animated: true, completion: nil)
//    }
//    @objc func trashButtonClicked(){
//        soundEffect()
//        let alert = UIAlertController(title: "Alert!".localized, message: "Are you sure to delete all history?".localized, preferredStyle: .alert)
//
//        let yes = UIAlertAction(title: "Yes".localized, style: .destructive ) { (action) in
//            self.viewController().viewModel.history.removeAll()
//            UserDefaults.standard.removeObject(forKey: "notes")
//            self.tableView.reloadData()
//        }
//        let no = UIAlertAction(title: "No".localized, style: .default, handler: nil)
//
//        alert.addAction(yes)
//        alert.addAction(no)
//
//        if !viewController().viewModel.history.isEmpty{
//            present(alert, animated: true, completion: nil)
//        }
//    }
//    @objc func btnClicked(_ sender: UIButton){
//        //     historyLoad()
//        let nextViewController = TextViewController()
//        nextViewController.modalTransitionStyle = .crossDissolve
//        nextViewController.modalPresentationStyle = .overFullScreen
//
//        let contentView = sender.superview
//        let cell = contentView?.superview as! UITableViewCell
//        let a = tableView.indexPath(for: cell)
//        nextViewController.index = a!
//        nextViewController.currentBtn = sender
//
//        nextViewController.updateTextView(viewController().viewModel.history[a!.row].comment)
//        present(nextViewController, animated: true, completion: nil)
//    }
//}
////MARK: - Methods related to Labels
//extension HistoryViewController {
//    func addLabel(){
//        view.addSubview(titleLabel)
//    }
//    func setLabelConstraints(){
//        titleLabel.snp.makeConstraints{ make in
//            make.top.leading.equalToSuperview().inset(10)
//            make.width.equalToSuperview().multipliedBy(0.3)
//            make.height.equalToSuperview().multipliedBy(0.05)
//        }
//    }
//}
////MARK: - Methods related to Buttons
//extension HistoryViewController {
//    func setButtonsConstraints(){
//        closeButton.snp.makeConstraints{ make in
//            make.bottom.equalToSuperview().offset(-10)
//            make.leading.trailing.equalToSuperview().inset(10)
//            make.height.equalToSuperview().multipliedBy(0.075)
//        }
//        trashButton.snp.makeConstraints{ make in
//            make.top.trailing.equalToSuperview().inset(10)
//            make.width.equalToSuperview().multipliedBy(0.1)
//            make.height.equalToSuperview().multipliedBy(0.05)
//        }
//    }
//    func addButtons(){
//        view.addSubview(closeButton)
//        view.addSubview(trashButton)
//    }
//    func soundEffect(){
//        AudioServicesPlaySystemSound(SystemSoundID(1104))
//    }
//}
////MARK: - UITableViewDataSource
//extension HistoryViewController : UITableViewDataSource{
//    //테이블 셀 몇개 보여줄 건지
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewController().viewModel.history.count
//    }
//    //테이블 셀 어떤 내용 보여줄건지
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
//        cell.backgroundColor = .clear
//        cell.update(info:viewController().viewModel.history[indexPath.row])
//        cell.setConstraint()
//        cell.button.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
//        // 셀 클릭됬을 때 색 변경 ( 제거 : cell.selectionStyle = .none )
//        let selectedColor = UIView()
//        selectedColor.backgroundColor = .init(hue: 252/360, saturation: 0.19, brightness: 0.40, alpha: 0.6)
//        cell.selectedBackgroundView = selectedColor
//        return cell
//    }
//    //오른쪽에서 스와이프 -> 삭제
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
//            //remove from dataSource
//            self.viewController().viewModel.history.remove(at: indexPath.row)
//            //remove from tableView
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            //remove from UserDefault
//            HistoryFunctions.historySave(self.viewController().viewModel.history)
//            completionHandler(true)
//        }
//        //change the text 'delete' to the icon trashCan
//        deleteAction.image = UIImage(systemName: "trash")
//        deleteAction.backgroundColor = .systemRed
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        return configuration
//    }
//    //왼쪽에서 스와이프 -> 복사
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let copyAction = UIContextualAction(style: .normal, title: nil) { (_, _, success: @escaping (Bool) -> Void) in
//            UIPasteboard.general.string = self.viewController().viewModel.history[indexPath.row].input + "=" + self.viewController().viewModel.history[indexPath.row].output.filter{$0 != "H"}
//            ToastMessage.showToast(message: "Copied!".localized,view: self.view)
//            success(true)
//        }
//        copyAction.image = UIImage(systemName: "square.and.pencil")
//        copyAction.backgroundColor = .systemYellow
//        let configuration = UISwipeActionsConfiguration(actions: [copyAction])
//        return configuration
//    }
//}
////MARK: - UITableViewDelegate
//extension HistoryViewController : UITableViewDelegate{
//    //셀 클릭했을 때
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let answer = viewController().viewModel.history[indexPath.row].output
//        if viewController().expressionLabel.text!.isEmpty {
//            viewController().viewModel.input.append( answer )
//        }else {                                                //입력창에 뭐 있을 때
//            let last = viewController().expressionLabel.text?.last
//            if last == "-" && answer.contains("-"){
//                print("Here")
//                viewController().viewModel.input.removeLast()
//                //answer.removeFirst()
//                viewController().viewModel.input.append(answer.filter{$0 != "-"})
//            }else if last == "×" || last == "÷" || last == "+" || last == "–" || last == "-" {
//                viewController().viewModel.input.append(answer)
//            }else if last == "."{
//                viewController().viewModel.input.removeLast()
//                viewController().viewModel.input.append(" × " + answer)
//            }else{
//                viewController().viewModel.input.append(" × " + answer)
//            }
//        }
//        viewController().viewModel.isEnterClicked = false
//        viewController().answerLabel.text?.removeAll()
//        viewController().expressionLabel.transform = CGAffineTransform.identity //클릭했을 때 애니메이션으로 위치가 달라진 레이블 복귀, afteranimation은 색깔까지 answerLabel의 색까지 바꿔버리기 때문에
//        viewController().answerLabel.transform = CGAffineTransform.identity
//
//        viewController().expressionUpdate()
//        viewController().answerUpdate()
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
//    }
//    //alertMessage
//    func showToast(message : String , view : UIView) {
//        let width_variable:CGFloat = 80
//        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-150, width: view.frame.size.width-2*width_variable, height: 35))
//        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
//        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(1)
//        toastLabel.textColor = UIColor.white
//        toastLabel.textAlignment = .center;
//        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
//        toastLabel.text = message
//        toastLabel.alpha = 1
//        toastLabel.layer.cornerRadius = 10;
//        toastLabel.clipsToBounds  =  true
//        self.view.addSubview(toastLabel)
//        UIView.animate(withDuration: 2 , delay: 0, options: .curveEaseOut, animations: {
//            toastLabel.alpha = 0.0
//        }, completion: {(isCompleted) in
//            toastLabel.removeFromSuperview()
//        })
//    }
//}
////MARK: - UITableViewCell
//class CustomCell: UITableViewCell {
//    let inputLabel : UILabel = {
//        let label = UILabel()
//        // label.clipsToBounds = true
//        // label.layer.cornerRadius = 10
//        label.textColor = .white
//        label.textAlignment = .right
//        label.numberOfLines = 0
//        label.text = ""
//        return label
//    }()
//    let outputLabel : UILabel = {
//        let label = UILabel()
//        //  label.clipsToBounds = true
//        label.textColor = .init(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1)
//        // label.layer.cornerRadius = 10
//
//        label.textAlignment = .right
//        label.numberOfLines = 0
//        return label
//    }()
//    let button : UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .clear
//        // button.addTarget(self, action: #selector(HistoryViewController().btnClicked), for: .touchUpInside)
//        return button
//    }()
//    func update(info:DataModel){
//       // inputLabel.text = info.input.filter{$0 != "H"}
//        inputLabel.font = .systemFont(ofSize: 25)
//        inputLabel.attributedExpression(info.input.filter{$0 != "H"})
//        //outputLabel.text = info.output.filter{$0 != "H"}
//        outputLabel.font = .systemFont(ofSize: 25)
//        outputLabel.attributedAnswer(info.output.filter{$0 != "H"})
//      //  exponential(outputLabel.text ?? "", outputLabel)
//        //        //코멘트
//        if info.comment == "" {
//            button.setImage(UIImage(systemName: "circle"), for: .normal)
//        }else{
//            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
//        }
//        button.setPreferredSymbolConfiguration(.init(pointSize: 15, weight: .medium, scale: .small), forImageIn: .normal)
//        button.tintColor = .white
//    }
//    func setConstraint() {
//        contentView.addSubview(inputLabel)
//        contentView.addSubview(outputLabel)
//        contentView.addSubview(button)
//
//        inputLabel.snp.makeConstraints{ make in
//            make.leading.equalTo(button.snp.trailing)
//            make.trailing.equalToSuperview()
//            make.top.equalToSuperview().inset(15)
//            make.bottom.equalTo(outputLabel.snp.top).offset(-5)
//        }
//        outputLabel.snp.makeConstraints{ make in
//            make.leading.equalTo(button.snp.trailing)
//            make.trailing.equalToSuperview()
//            make.top.equalTo(inputLabel.snp.bottom)
//            make.bottom.equalToSuperview().inset(15)
//        }
//        button.snp.makeConstraints{ make in
//            make.size.height.width.equalTo(50)
//            make.leading.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
//    }
//    //레이블 텍스트 줄 수
//    func lineNumber(label: UILabel, labelWidth: CGFloat) -> Int {
//        let boundingRect = label.text!.boundingRect(with: .zero, options: [.usesFontLeading], attributes: [.font: label.font!], context: nil)
//        return Int( (boundingRect.width //contentView.bounds.width*0.5
//                    ) / labelWidth + 1)
//    }
//    func exponential(_ text:String,_ label:UILabel){                                                //연산기호 색
//    var substituted = text
//    if let replaceRange = substituted.range(of: "e+"){
//        substituted.replaceSubrange(replaceRange, with: "×10")
//    }
//    let attributedString = NSMutableAttributedString(string: substituted)
//    if let a = substituted.firstIndex(of: "×"){
//    let start = substituted.index(a, offsetBy: 3)
//    let end   = substituted.endIndex
//    let  a = NSRange(start..<end, in: substituted)
//    let font = UIFont.systemFont(ofSize: 15)
//    attributedString.addAttribute(.font, value: font, range: a)
//    attributedString.addAttribute(.baselineOffset, value: 15, range: a)
//    }
//    label.attributedText = attributedString
//}
//}
//


//
//  HistoryViewController.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//

//
//  HistoryViewController.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/02/15.
//

import UIKit
import SnapKit
import AVKit
import Foundation

class HistoryViewController: UIViewController {
    
    var history = Histroy.shared

    //MARK: - TableView
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    func setupTableView(){
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .init(hue: 300/360, saturation: 0.05, brightness: 0.05, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
    }
    func setTableViewConstraints(atTop trashButton:UIButton,atBottom closeButton:UIButton) {
        tableView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(trashButton.snp.bottom).offset(10)
            make.bottom.equalTo(closeButton.snp.top).offset(-10)
        }
    }
    // var height = 1
    var audioPlayer   = AVAudioPlayer()
    func viewController() -> ViewController{
        let mainVc = self.presentingViewController
        guard let vc = mainVc as? ViewController else{
            return ViewController()
        }
        return vc
    }
    //MARK: - Buttons
    lazy var closeButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(hue: 213/360, saturation: 0.09, brightness: 0.41, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle( "Close".localized , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(closeButtonClicked), for: .touchUpInside)
        return button
    }()
    lazy var trashButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 25, weight: .regular, scale: .default), forImageIn: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(trashButtonClicked), for: .touchUpInside)
        return button
    }()
    //MARK: - Label
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "History".localized
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .left
        return label
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupTableView()
        addButtons()
        addLabel()
        
        setLabelConstraints()
        setButtonsConstraints()
        setTableViewConstraints(atTop: trashButton, atBottom: closeButton)
    }
}
//MARK: - Objc Methods
extension HistoryViewController {
    @objc func closeButtonClicked(_ sender : UIButton){
        soundEffect()
        self.dismiss(animated: true, completion: nil)
    }
    @objc func trashButtonClicked(){
        soundEffect()
        let alert = UIAlertController(title: "Alert!".localized, message: "Are you sure to delete all history?".localized, preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes".localized, style: .destructive ) { (action) in
            //self.viewController().viewModel.history.removeAll()
            self.history.history.removeAll()
            UserDefaults.standard.removeObject(forKey: "notes")
            self.tableView.reloadData()
            self.viewController().hisView.reloadData()
        }
        let no = UIAlertAction(title: "No".localized, style: .default, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(no)
        
        if !history.history.isEmpty{//!viewController().viewModel.history.isEmpty{
            present(alert, animated: true, completion: nil)
        }
    }
    @objc func btnClicked(_ sender: UIButton){
        //     historyLoad()
        let nextViewController = TextViewController()
        nextViewController.modalTransitionStyle = .crossDissolve
        nextViewController.modalPresentationStyle = .overFullScreen
        
        let contentView = sender.superview
        let cell = contentView?.superview as! UITableViewCell
        let a = tableView.indexPath(for: cell)
        nextViewController.index = a!
        nextViewController.currentBtn = sender
        
       // nextViewController.updateTextView(viewController().viewModel.history[a!.row].comment)
        nextViewController.updateTextView(history.history[a!.row].comment)
        present(nextViewController, animated: true, completion: nil)
    }
}
//MARK: - Methods related to Labels
extension HistoryViewController {
    func addLabel(){
        view.addSubview(titleLabel)
    }
    func setLabelConstraints(){
        titleLabel.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
    }
}
//MARK: - Methods related to Buttons
extension HistoryViewController {
    func setButtonsConstraints(){
        closeButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.075)
        }
        trashButton.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.1)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
    }
    func addButtons(){
        view.addSubview(closeButton)
        view.addSubview(trashButton)
    }
    func soundEffect(){
        AudioServicesPlaySystemSound(SystemSoundID(1104))
    }
}
//MARK: - UITableViewDataSource
extension HistoryViewController : UITableViewDataSource{
    //테이블 셀 몇개 보여줄 건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewController().viewModel.history.count
        return history.history.count

    }
    //테이블 셀 어떤 내용 보여줄건지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        //cell.update(info:viewController().viewModel.history[indexPath.row])
        cell.update(info:history.history[indexPath.row])
        cell.setConstraint()
        cell.button.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        // 셀 클릭됬을 때 색 변경 ( 제거 : cell.selectionStyle = .none )
        let selectedColor = UIView()
        selectedColor.backgroundColor = .init(hue: 252/360, saturation: 0.19, brightness: 0.40, alpha: 0.6)
        cell.selectedBackgroundView = selectedColor
        return cell
    }
    //오른쪽에서 스와이프 -> 삭제
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            //remove from dataSource
            //self.viewController().viewModel.history.remove(at: indexPath.row)
            self.history.history.remove(at: indexPath.row)
            //remove from tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
            //remove from UserDefault
           // HistoryFunctions.historySave(self.viewController().viewModel.history)
            self.history.historySave()
            completionHandler(true)
        }
        //change the text 'delete' to the icon trashCan
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    //왼쪽에서 스와이프 -> 복사
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let copyAction = UIContextualAction(style: .normal, title: nil) { (_, _, success: @escaping (Bool) -> Void) in
           // UIPasteboard.general.string = self.viewController().viewModel.history[indexPath.row].input + "=" + self.viewController().viewModel.history[indexPath.row].output.filter{$0 != "H"}
            UIPasteboard.general.string = self.history.history[indexPath.row].input + "=" + self.history.history[indexPath.row].output.filter{$0 != "H"}
            ToastMessage.showToast(message: "Copied!".localized,view: self.view)
            success(true)
        }
        copyAction.image = UIImage(systemName: "square.and.pencil")
        copyAction.backgroundColor = .systemYellow
        let configuration = UISwipeActionsConfiguration(actions: [copyAction])
        return configuration
    }
}
//MARK: - UITableViewDelegate
extension HistoryViewController : UITableViewDelegate{
    //셀 클릭했을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let answer = viewController().viewModel.history[indexPath.row].output
        let answer = history.history[indexPath.row].output
        if viewController().expressionLabel.text!.isEmpty {
            viewController().viewModel.input.append( answer )
        }else {                                                //입력창에 뭐 있을 때
            let last = viewController().expressionLabel.text?.last
            if last == "-" && answer.contains("-"){
                viewController().viewModel.input.removeLast()
                //answer.removeFirst()
                viewController().viewModel.input.append(answer.filter{$0 != "-"})
            }else if last == "×" || last == "÷" || last == "+" || last == "–" || last == "-" {
                viewController().viewModel.input.append(answer)
            }else if last == "."{
                viewController().viewModel.input.removeLast()
                viewController().viewModel.input.append(" × " + answer)
            }else{
                viewController().viewModel.input.append(" × " + answer)
            }
        }
        viewController().viewModel.isEnterClicked = false
        viewController().answerLabel.text?.removeAll()
        viewController().expressionLabel.transform = CGAffineTransform.identity //클릭했을 때 애니메이션으로 위치가 달라진 레이블 복귀, afteranimation은 색깔까지 answerLabel의 색까지 바꿔버리기 때문에
        viewController().answerLabel.transform = CGAffineTransform.identity
        viewController().expressionUpdate()
        viewController().answerUpdate()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
//MARK: - UITableViewCell
class CustomCell: UITableViewCell {
    let inputLabel : UILabel = {
        let label = UILabel()
        // label.clipsToBounds = true
        // label.layer.cornerRadius = 10
        label.textColor = .white
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    let outputLabel : UILabel = {
        let label = UILabel()
        //  label.clipsToBounds = true
        label.textColor = .init(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1)
        // label.layer.cornerRadius = 10
        
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        // button.addTarget(self, action: #selector(HistoryViewController().btnClicked), for: .touchUpInside)
        return button
    }()
    func update(info:DataModel){
       // inputLabel.text = info.input.filter{$0 != "H"}
        inputLabel.font = .systemFont(ofSize: 25)
        inputLabel.attributedExpression(info.input.filter{$0 != "H"})
        //outputLabel.text = info.output.filter{$0 != "H"}
        outputLabel.font = .systemFont(ofSize: 25)
        outputLabel.attributedAnswer(info.output.filter{$0 != "H"})
      //  exponential(outputLabel.text ?? "", outputLabel)
        //        //코멘트
        if info.comment == "" {
            button.setImage(UIImage(systemName: "circle"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        }
        button.setPreferredSymbolConfiguration(.init(pointSize: 15, weight: .medium, scale: .small), forImageIn: .normal)
        button.tintColor = .white
    }
    func setConstraint() {
        contentView.addSubview(inputLabel)
        contentView.addSubview(outputLabel)
        contentView.addSubview(button)
        
        inputLabel.snp.makeConstraints{ make in
            make.leading.equalTo(button.snp.trailing)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.top.equalToSuperview().inset(15)
            make.bottom.equalTo(outputLabel.snp.top).offset(-5)
        }
        outputLabel.snp.makeConstraints{ make in
            make.leading.equalTo(button.snp.trailing)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.top.equalTo(inputLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(15)
        }
        button.snp.makeConstraints{ make in
            make.size.height.width.equalTo(50)
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    //레이블 텍스트 줄 수
    func lineNumber(label: UILabel, labelWidth: CGFloat) -> Int {
        let boundingRect = label.text!.boundingRect(with: .zero, options: [.usesFontLeading], attributes: [.font: label.font!], context: nil)
        return Int( (boundingRect.width //contentView.bounds.width*0.5
                    ) / labelWidth + 1)
    }
    func exponential(_ text:String,_ label:UILabel){                                                //연산기호 색
        var substituted = text
        if let replaceRange = substituted.range(of: "e+"){
            substituted.replaceSubrange(replaceRange, with: "×10")
        }
        let attributedString = NSMutableAttributedString(string: substituted)
        if let a = substituted.firstIndex(of: "×"){
            let start = substituted.index(a, offsetBy: 3)
            let end   = substituted.endIndex
            let  a = NSRange(start..<end, in: substituted)
            let font = UIFont.systemFont(ofSize: 15)
            attributedString.addAttribute(.font, value: font, range: a)
            attributedString.addAttribute(.baselineOffset, value: 15, range: a)
        }
        label.attributedText = attributedString
    }
}

