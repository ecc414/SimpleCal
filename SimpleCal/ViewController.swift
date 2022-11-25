////
////  ViewController.swift
////  SimpleCal
////
////  Created by 엄철찬 on 2022/03/30.
////
//
////
////  Buttons.swift
////  SimpleCalculator
////
////  Created by 엄철찬 on 2022/03/05.
////
//
//import Foundation
//import UIKit
//import SnapKit
//import AVKit
//
//
///// MainView
//class ViewController: UIViewController{
//    var viewModel = ViewModel()
//    var audioPlayer   = AVAudioPlayer()
//    //BackGroundColor
//    let numberKeyBackGroundColor : UIColor = .init(hue: 213/360, saturation: 0.09, brightness: 0.41, alpha: 1)
//    let functionKeyBackGroundColor : UIColor = .init(hue: 206/360, saturation: 0.11, brightness: 0.26, alpha: 1)
//    let enterKeyBackGroundColor : UIColor = .init(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1)
//    //iPhone or iPad
//    let deviceModel = UIDevice.current.model
//
//    //MARK: - Buttons
//    lazy var doubleZeroBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "00", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(doubleZeroBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var zeroBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "0", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(zeroBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var oneBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "1", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(oneBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var twoBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "2", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(twoBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var threeBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "3", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(threeBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var fourBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "4", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(fourBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var fiveBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "5", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(fiveBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var sixBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "6", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(sixBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var sevenBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "7", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(sevenBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var eightBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "8", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(eightBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var nineBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "9", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(nineBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var dotBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: ".", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
//        button.addTarget(self, action: #selector(dotBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var enterBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "=", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: enterKeyBackGroundColor)
//        button.addTarget(self, action: #selector(enterBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var additionBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "+", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(additionBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var subtractionBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "–", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(subtractionBtnClicked), for: .touchDown)
//
//        return button
//    }()
//    lazy var multiplyBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "×", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(multiplyBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var divisionBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "÷", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(divisionBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var percentBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "%", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(percentBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var clearBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "C", titleColor: .init(hue: 359/360, saturation: 0.58, brightness: 0.83, alpha: 1), titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(clearBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var signBtn : UIButton = {
//        let button = UIButton()
//        buttonGenerator(button: button, title: "+/–", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
//        button.addTarget(self, action: #selector(signBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var deleteBtn : UIButton = {
//        let button = UIButton()
//        let boldConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
//        let boldSearch = UIImage(systemName: "delete.left", withConfiguration: boldConfig)
//        button.setImage(boldSearch, for: .normal)
//        button.tintColor = .white // change the color of the icon
//        button.addTarget(self, action: #selector(deleteBtnClicked), for: .touchDown)
//        return button
//    }()
//    lazy var historyBtn : UIButton = {
//        let button = UIButton()
//        let historyConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .large)
//        let history    = UIImage(systemName: "clock.arrow.circlepath", withConfiguration: historyConfiguration)
//        button.setImage(history, for: .normal)
//        button.tintColor = .white
//        button.addTarget(self, action: #selector(historyBtnClicked), for: .touchDown)
//        return button
//    }()
//    //MARK: - Labels
//    var expressionLabel : UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 40 )
//        label.textAlignment = .right
//        label.text = ""
//        label.numberOfLines = 0
//        return label
//    }()
//    var answerLabel : UILabel  = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 30 )
//        label.textAlignment = .right
//        label.text = ""
//        label.numberOfLines = 0
//        return label
//    }()
//    //autoFontSize
//    var turningPoint = 0
//    var toggle       = true
//    var turningPointForThirdLine = 0
//    var toggleForThirdLine = true
//    //MARK: - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewModel.history = HistoryFunctions.historyLoad()
//        self.view.backgroundColor = .black
//
//        addButtons()
//        buttonSize()
//        buttonConstraints()
//        //buttonSizeInitialize()
//
//
//        addLabels(view: self.view)
//        labelSize(view: self.view)
//        labelConstrains(bottomButton: deleteBtn, topButton: historyBtn)
//    }
//
//
//
//
//    //MARK: - Functions
//    func basicFeatures(_ button:UIButton){
//        afterLabelAnimation()
//        //labelFont(expressionLabel)
//        //        labelFont(answerLabel)
//        soundEffect()
//        animationForButton(button: button)
//    }
//    func toast(){
//        if viewModel.message {
//            ToastMessage.showToast(message: "Too many inputs".localized, view: self.view)
//            viewModel.message = false
//        }
//    }
//    func expressionUpdate(){
//        expressionLabel.text = viewModel.expressionLabel()
//        labelFont(expressionLabel)
//        expressionLabel.attributedExpression(expressionLabel.text!)
//    }
//    func answerUpdate(){
//        answerLabel.text = viewModel.answerLabel()
//        labelFont(answerLabel)
//        answerLabel.attributedAnswer(answerLabel.text ?? "")
//        //attributedAnswer(answerLabel.text ?? "", answerLabel)
//    }
//    func afterEnter(){
//        if viewModel.isEnterClicked{
//            viewModel.input.removeAll()
//            expressionLabel.text?.removeAll()
//            answerLabel.text?.removeAll()
//            viewModel.isEnterClicked = false
//        }
//    }
//}
////MARK: - Objc Methods
//extension ViewController {
//    @objc func doubleZeroBtnClicked(){
//        afterEnter()
//        basicFeatures(doubleZeroBtn
//        )
//        viewModel.isPercent()
//        viewModel.input.append( "00" )
//        if viewModel.input == "00"{
//            viewModel.input = "0"
//        }
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func zeroBtnClicked(){
//        afterEnter()
//        basicFeatures(zeroBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "0" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func oneBtnClicked(){
//        afterEnter()
//        basicFeatures(oneBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "1" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func twoBtnClicked(){
//        afterEnter()
//        basicFeatures(twoBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "2" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func threeBtnClicked(){
//        afterEnter()
//        basicFeatures(threeBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "3" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func fourBtnClicked(){
//        afterEnter()
//        basicFeatures(fourBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "4" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func fiveBtnClicked(){
//        afterEnter()
//        basicFeatures(fiveBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "5" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func sixBtnClicked(){
//        afterEnter()
//        basicFeatures(sixBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "6" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func sevenBtnClicked(){
//        afterEnter()
//        basicFeatures(sevenBtn)
//        viewModel.isPercent()
//        viewModel.input.append( "7" )
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func eightBtnClicked(){
//        afterEnter()
//        basicFeatures(eightBtn)
//        viewModel.isPercent()
//        viewModel.input.append("8")
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func nineBtnClicked(){
//        afterEnter()
//        viewModel.isPercent()
//        viewModel.input.append("9")
//        basicFeatures(nineBtn)
//        expressionUpdate()
//        answerUpdate()
//        toast()
//    }
//    @objc func dotBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(dotBtn)
//        if viewModel.dotButton(){
//            viewModel.input.append(".")
//            expressionLabel.text?.append(".")
//            answerUpdate()
//        }
//    }
//    @objc func additionBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(additionBtn)
//        viewModel.changeLastOp()
//        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
//            viewModel.input.append(" + ")
//        }
//        expressionUpdate()
//        answerUpdate()
//
//    }
//    @objc func subtractionBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(subtractionBtn)
//        viewModel.changeLastOp()
//        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
//            viewModel.input.append(" – ")
//        }
//        expressionUpdate()
//        answerUpdate()
//
//    }
//    @objc func multiplyBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(multiplyBtn)
//        viewModel.changeLastOp()
//        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
//            viewModel.input.append(" × ")
//        }
//        expressionUpdate()
//        answerUpdate()
//
//    }
//    @objc func divisionBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(divisionBtn)
//        viewModel.changeLastOp()
//        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
//            viewModel.input.append(" ÷ ")
//        }
//        expressionUpdate()
//        answerUpdate()
//
//    }
//    @objc func percentBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(percentBtn)
//        viewModel.percentButton()
//        expressionUpdate()
//        answerUpdate()
//    }
//    @objc func clearBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(clearBtn)
//        viewModel.input.removeAll()
//        expressionLabel.text?.removeAll()
//        answerLabel.text?.removeAll()
//    }
//    @objc func deleteBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(deleteBtn)
//        if viewModel.input.last == " "{
//            viewModel.input.removeLast(3)
//        }else if viewModel.input.last == "H"{
//            repeat{
//                _ = viewModel.input.popLast()
//            }while(viewModel.input.last != "H")
//            _ = viewModel.input.popLast()
//        }else{
//            _ = viewModel.input.popLast()
//        }
//        expressionUpdate()
//        if viewModel.input.last == "."{
//            expressionLabel.text?.append(".")
//        }
//        answerUpdate()
//    }
//    @objc func enterBtnClicked(){
//        basicFeatures(enterBtn)
//        if viewModel.input.isEmpty{ return }
//        performLabelAnimation()
//        viewModel.enterButton()
//        answerUpdate()
//        //expressionLabel.text = answerLabel.text
//    }
//    @objc func historyBtnClicked(){
//        soundEffect()
//        animationForButton(button: historyBtn)
//        let vc = HistoryViewController()
//        present(vc, animated: true, completion: nil)
//    }
//    @objc func signBtnClicked(){
//        viewModel.isEnterClicked = false
//        basicFeatures(signBtn)
//        viewModel.signButton()
//        expressionUpdate()
//        answerUpdate()
//    }
//}
////MARK: - Methods related to Buttons
//extension ViewController {
//    func buttonGenerator(button:UIButton,title:String,titleColor:UIColor,titleColorWhenHighlighted:UIColor,titleFontSize:CGFloat,cornerRadius:CGFloat,backGroundColor:UIColor){
//        button.backgroundColor =  backGroundColor
//        button.layer.cornerRadius = cornerRadius
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(titleColor, for: .normal)
//        button.setTitleColor(titleColorWhenHighlighted, for: .highlighted)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
//    }
//    //Add buttons on view
//    func addButtons(){
//        let buttonArray : [UIButton] = [dotBtn,zeroBtn,oneBtn,twoBtn,threeBtn,fourBtn,fiveBtn,sixBtn,sevenBtn,eightBtn,nineBtn,enterBtn,additionBtn,subtractionBtn,multiplyBtn,divisionBtn,percentBtn,clearBtn,deleteBtn,historyBtn,signBtn,doubleZeroBtn]
//        _ = buttonArray.map{ view.addSubview($0)}
//    }
//    //AutoLayout for buttons
//    func buttonConstraints(){
//        let gap = UIScreen.main.bounds.width * 0.06/3               //Landscape상태에서 실행하면 Layout 엉망 방지
//
//        doubleZeroBtn.snp.makeConstraints{ make in
//            make.trailing.equalTo(zeroBtn.snp.leading).offset(-gap)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-gap)
//        }
//        zeroBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-gap)
//            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
//        }
//        dotBtn.snp.makeConstraints{ make in
//            make.leading.equalTo(view.snp.centerX).offset(gap/2)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-gap)
//        }
//        enterBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-gap)
//            make.leading.equalTo(dotBtn.snp.trailing).offset(gap)
//        }
//        oneBtn.snp.makeConstraints{ make in
//            make.trailing.equalTo(twoBtn.snp.leading).offset(-gap)
//            make.bottom.equalTo(doubleZeroBtn.snp.top).offset(-gap)
//        }
//        twoBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(zeroBtn.snp.top).offset(-gap)
//            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
//        }
//        threeBtn.snp.makeConstraints{ make in
//            make.leading.equalTo(view.snp.centerX).offset(gap/2)
//            make.bottom.equalTo(dotBtn.snp.top).offset(-gap)
//        }
//        additionBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(enterBtn.snp.top).offset(-gap)
//            make.leading.equalTo(threeBtn.snp.trailing).offset(gap)
//        }
//        fourBtn.snp.makeConstraints{ make in
//            make.trailing.equalTo(fiveBtn.snp.leading).offset(-gap)
//            make.bottom.equalTo(oneBtn.snp.top).offset(-gap)
//        }
//        fiveBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(twoBtn.snp.top).offset(-gap)
//            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
//        }
//        sixBtn.snp.makeConstraints{ make in
//            make.leading.equalTo(view.snp.centerX).offset(gap/2)
//            make.bottom.equalTo(threeBtn.snp.top).offset(-gap)
//        }
//        subtractionBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(additionBtn.snp.top).offset(-gap)
//            make.leading.equalTo(sixBtn.snp.trailing).offset(gap)
//        }
//        sevenBtn.snp.makeConstraints{ make in
//            make.trailing.equalTo(eightBtn.snp.leading).offset(-gap)
//            make.bottom.equalTo(fourBtn.snp.top).offset(-gap)
//        }
//        eightBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(fiveBtn.snp.top).offset(-gap)
//            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
//        }
//        nineBtn.snp.makeConstraints{ make in
//            make.leading.equalTo(view.snp.centerX).offset(gap/2)
//            make.bottom.equalTo(sixBtn.snp.top).offset(-gap)
//        }
//        multiplyBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(subtractionBtn.snp.top).offset(-gap)
//            make.leading.equalTo(nineBtn.snp.trailing).offset(gap)
//        }
//        clearBtn.snp.makeConstraints{ make in
//            make.trailing.equalTo(signBtn.snp.leading).offset(-gap)
//            make.bottom.equalTo(sevenBtn.snp.top).offset(-gap)
//        }
//        signBtn.snp.makeConstraints{ make in
//            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
//            make.bottom.equalTo(eightBtn.snp.top).offset(-gap)
//        }
//        percentBtn.snp.makeConstraints{ make in
//            make.leading.equalTo(view.snp.centerX).offset(gap/2)
//            make.bottom.equalTo(nineBtn.snp.top).offset(-gap)
//        }
//        divisionBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(multiplyBtn.snp.top).offset(-gap)
//            make.leading.equalTo(percentBtn.snp.trailing).offset(gap)
//        }
//        deleteBtn.snp.makeConstraints{ make in
//            make.bottom.equalTo(divisionBtn.snp.top).offset(-gap)
//            make.centerX.equalTo(divisionBtn.snp.centerX)
//        }
//        historyBtn.snp.makeConstraints{ make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(clearBtn.snp.centerX)
//        }
//    }
//    //Set buttons size
//    func buttonSize(){
//        let buttonArray : [UIButton] = [dotBtn,zeroBtn,oneBtn,twoBtn,threeBtn,fourBtn,fiveBtn,sixBtn,sevenBtn,eightBtn,nineBtn,enterBtn,additionBtn,subtractionBtn,multiplyBtn,divisionBtn,percentBtn,clearBtn,signBtn,doubleZeroBtn]
//        _ = buttonArray.map{ button in
//            button.snp.makeConstraints{ make in
//                make.height.equalToSuperview().multipliedBy(0.11)
//                make.width.equalToSuperview().multipliedBy(0.225)
//            }
//        }
//        //TwoExceptions
//        deleteBtn.snp.makeConstraints{ make in
//            make.height.equalToSuperview().multipliedBy(0.05)
//            make.width.equalToSuperview().multipliedBy(0.2)
//        }
//        historyBtn.snp.makeConstraints{ make in
//            make.height.equalToSuperview().multipliedBy(0.03)
//            make.width.equalTo(historyBtn.snp.height)
//        }
//    }
//    //Button sound
//    func soundEffect(){
//        AudioServicesPlaySystemSound(SystemSoundID(1104))
//    }
//    //Button animation
//    func animationForButton( button : UIButton ){
//        UIView.animate(withDuration: 0.05, delay: 0, options: .allowUserInteraction, animations: {
//            button.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
//        }, completion: {
//            finished in UIView.animate(withDuration: 0.05, animations: {
//                button.transform = CGAffineTransform.identity
//            })}
//        )
//    }
//}
////MARK: - Methods related to Labels
//extension ViewController {
//    func addLabels(view:UIView){
//        view.addSubview(answerLabel)
//        view.addSubview(expressionLabel)
//    }
//    func labelSize(view:UIView){
//        expressionLabel.snp.makeConstraints{ make in
//            make.width.leading.trailing.equalToSuperview()
//        }
//        answerLabel.snp.makeConstraints{ make in
//            make.width.leading.trailing.equalToSuperview()
//            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.1 )
//        }
//    }
//    func labelConstrains(bottomButton:UIButton,topButton:UIButton){
//        expressionLabel.snp.makeConstraints{ make in
//            make.bottom.equalTo(answerLabel.snp.top)
//            make.top.equalTo(topButton.snp.bottom)
//        }
//        answerLabel.snp.makeConstraints{ make in
//            make.bottom.equalTo(bottomButton.snp.top)
//        }
//    }
//    func afterLabelAnimation(){
//        expressionLabel.transform = CGAffineTransform.identity
//        answerLabel.transform = CGAffineTransform.identity
//        answerLabel.textColor = .init(hue: 213/360, saturation: 0.09, brightness: 0.41, alpha: 1)//회색
//    }
//    func performLabelAnimation(){
//        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowUserInteraction, animations: {   self.expressionLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
//            self.answerLabel.transform = CGAffineTransform(translationX: 0, y: -self.answerLabel.bounds.height/2-self.expressionLabel.bounds.height/2)
//            self.answerLabel.textColor =  .init(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1)//파란색
//        }, completion: nil)
//    }
//    func labelFont(_ inputLabel:UILabel){
//        var FontSize : CGFloat = inputLabel.bounds.width * 0.1
//        if lineNumber(label: inputLabel, labelWidth: inputLabel.bounds.width) == 2 && toggle{
//            if let point = inputLabel.text?.count{
//                turningPoint = point
//            }
//            toggle = false
//        }
//        if lineNumber(label: inputLabel, labelWidth: inputLabel.bounds.width) == 3 && toggleForThirdLine{
//            if let point = inputLabel.text?.count{
//                turningPointForThirdLine = point
//            }
//            toggleForThirdLine = false
//        }
//        if let a = inputLabel.text?.count {
//            if a >= turningPointForThirdLine && !toggleForThirdLine{
//                FontSize = inputLabel.bounds.width * 0.05
//            }else if a > turningPoint && !toggle{
//                FontSize = inputLabel.bounds.width * 0.075
//            }else if a < turningPoint && !toggle{
//                FontSize = inputLabel.bounds.width * 0.1
//            }
//        }
//        inputLabel.font = .systemFont(ofSize: FontSize)
//    }
//    func lineNumber(label: UILabel, labelWidth: CGFloat) -> Int {
//        let boundingRect = label.text!.boundingRect(with: .zero, options: [.usesFontLeading], attributes: [.font: label.font!], context: nil)
//        return Int( (40 + boundingRect.width ) / labelWidth + 1)    // 25 보통
//    } //레이블 텍스트 줄 수
//}
////MARK: - ButtonGenerator
//extension UIButton {
//    func buttonGenerator(button:UIButton,title:String,titleColor:UIColor,titleColorWhenHighlighted:UIColor,titleFontSize:CGFloat,cornerRadius:CGFloat,backGroundColor:UIColor){
//        button.backgroundColor =  backGroundColor
//        button.layer.cornerRadius = cornerRadius
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(titleColor, for: .normal)
//        button.setTitleColor(titleColorWhenHighlighted, for: .highlighted)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
//    }
//}
////MARK: - Localized
//extension String {
//    var localized: String {
//        return NSLocalizedString(self, tableName: "InfoPlist", value: self, comment: "")
//    }
//}
//
//extension UILabel{
//    func attributedExpression(_ text:String){
//        var substituted = text
//        let entireLength = text.count
//        var expLength = Int()
//        var expRanges = [NSRange]()
//        var expStartIndices = [Int]()
//        var correction = 0
//        let opArray : [String] = ["–","+","×","÷"]
//        var range = NSRange(location: 0, length: entireLength)
//        var rangeArray = [NSRange]()
//
//        for (index,value) in substituted.enumerated(){
//            if value == "e"{
//                expStartIndices.append(index)
//            }
//        }
//        for i in expStartIndices{
//            let expIndex = substituted.index(substituted.startIndex, offsetBy: i)
//            for i in 2...5{
//                if  ["–","+","×","÷","%"].contains(substituted[substituted.index(expIndex, offsetBy: i)]){
//                    expLength = i-2
//                    break
//                }
//                if substituted.index(expIndex, offsetBy: i) == substituted.index(before: substituted.endIndex){
//                    expLength = i-1
//                    break
//                }
//            }
//            let distance = substituted.distance(from: substituted.startIndex, to: expIndex)
//            expRanges.append(NSRange(location: distance+3+correction, length: expLength))
//            correction += 1
//        }
//        while ( substituted.contains("e+")){
//            if let replaceRange = substituted.range(of: "e+"){
//                substituted.replaceSubrange(replaceRange, with: "×10")
//            }
//        }
//        for op in opArray {                         //사칙연산기호
//            while (range.location != NSNotFound){
//                range = (substituted as NSString).range(of: op, options: .caseInsensitive, range: range)
//                rangeArray.append(range)
//                if ( range.location != NSNotFound ){
//                    range = NSRange(location: range.location + range.length, length: entireLength - ( range.location + range.length ) )
//                }
//            }
//            range = NSRange(location: 0, length: entireLength)
//        }
//        let attributedString = NSMutableAttributedString(string: substituted)
//        let font = UIFont.systemFont(ofSize: self.font.pointSize * 0.5 )
//        expRanges.forEach{ range in
//            attributedString.addAttribute(.font, value: font, range: range)
//            attributedString.addAttribute(.baselineOffset, value: self.font.lineHeight*0.5, range: range)
//        }
//        rangeArray.forEach{ range in
//            attributedString.addAttribute(.foregroundColor, value: UIColor(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1) , range: range)
//        }
//        self.attributedText = attributedString
//    }
//    func attributedAnswer(_ text:String ){
//        var substituted = text
//        if let replaceRange = substituted.range(of: "e+"){
//            substituted.replaceSubrange(replaceRange, with: "×10")
//        }
//        let attributedString = NSMutableAttributedString(string: substituted)
//        if let a = substituted.firstIndex(of: "×"){
//            let start = substituted.index(a, offsetBy: 3)
//            let end   = substituted.endIndex
//            let color = NSRange(a...a,in: substituted)
//            let  a = NSRange(start..<end, in: substituted)
//            let font = UIFont.systemFont(ofSize: self.font.pointSize * 0.5 )
//            attributedString.addAttribute(.foregroundColor, value: UIColor(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1), range: color)
//            attributedString.addAttribute(.font, value: font, range: a)
//            attributedString.addAttribute(.baselineOffset, value: self.font.lineHeight*0.5, range: a)//아이패드 72가 적당(132). 아이폰 25가 적당(76). 아이패드미니 49적당(109)
//        }
//        self.attributedText = attributedString
//    }
//}
//


//
//  ViewController.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//

//
//  Buttons.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/03/05.
//

import Foundation
import UIKit
import SnapKit
import AVKit


/// MainView
class ViewController: UIViewController{
    
    var viewModel = ViewModel()
    
    var audioPlayer   = AVAudioPlayer()
    //BackGroundColor
    let numberKeyBackGroundColor : UIColor = .init(hue: 213/360, saturation: 0.09, brightness: 0.41, alpha: 1)
    
    let functionKeyBackGroundColor : UIColor = .init(hue: 206/360, saturation: 0.11, brightness: 0.26, alpha: 1)
    
    let enterKeyBackGroundColor : UIColor = .init(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1)
    
    //iPhone or iPad
    let deviceModel = UIDevice.current.model
    
    var hisView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        //tableView.register(UITableViewHeaderFooterView.self, forCellReuseIdentifier: "customHeader")
        tableView.backgroundColor = .init(hue: 300/360, saturation: 0.05, brightness: 0.05, alpha: 1)
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    var history = Histroy.shared
    
    //MARK: - Buttons
    lazy var doubleZeroBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "00", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(doubleZeroBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var zeroBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "0", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(zeroBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var oneBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "1", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(oneBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var twoBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "2", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(twoBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var threeBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "3", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(threeBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var fourBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "4", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(fourBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var fiveBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "5", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(fiveBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var sixBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "6", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(sixBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var sevenBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "7", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(sevenBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var eightBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "8", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(eightBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var nineBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "9", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(nineBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var dotBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: ".", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: numberKeyBackGroundColor)
        button.addTarget(self, action: #selector(dotBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var enterBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "=", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: enterKeyBackGroundColor)
        button.addTarget(self, action: #selector(enterBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var additionBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "+", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(additionBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var subtractionBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "–", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(subtractionBtnClicked), for: .touchDown)

        return button
    }()
    
    lazy var multiplyBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "×", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(multiplyBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var divisionBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "÷", titleColor: enterKeyBackGroundColor, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(divisionBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var percentBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "%", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(percentBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var clearBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "C", titleColor: .init(hue: 359/360, saturation: 0.58, brightness: 0.83, alpha: 1), titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(clearBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var signBtn : UIButton = {
        let button = UIButton()
        buttonGenerator(button: button, title: "+/–", titleColor: .white, titleColorWhenHighlighted: .gray, titleFontSize: 40, cornerRadius: 25, backGroundColor: functionKeyBackGroundColor)
        button.addTarget(self, action: #selector(signBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var deleteBtn : UIButton = {
        let button = UIButton()
        let boldConfig = UIImage.SymbolConfiguration(pointSize: deviceModel == "iPad" ? 40 : 30, weight: .regular, scale: .default)
        let boldSearch = UIImage(systemName: "delete.left", withConfiguration: boldConfig)
        button.setImage(boldSearch, for: .normal)
        button.tintColor = .white // change the color of the icon
        button.addTarget(self, action: #selector(deleteBtnClicked), for: .touchDown)
        return button
    }()
    
    lazy var historyBtn : UIButton = {
        let button = UIButton()
        let historyConfiguration = UIImage.SymbolConfiguration(pointSize: deviceModel == "iPad" ? 40 : 30, weight: .regular, scale: .default)
        let history    = UIImage(systemName: "clock.arrow.circlepath", withConfiguration: historyConfiguration)
        button.setImage(history, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(historyBtnClicked), for: .touchDown)
        return button
    }()
    
    //MARK: - Labels
    var expressionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40 )
        label.textAlignment = .right
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    var answerLabel : UILabel  = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30 )
        label.textAlignment = .right
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    //autoFontSize
    var turningPoint = 0
    
    var toggle       = true
    
    var turningPointForThirdLine = 0
    
    var toggleForThirdLine = true
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        hisView.delegate = self
        hisView.dataSource = self

        addButtons()

        addLabels(view: self.view)
        
        //viewDidAppear에서 실행 시 버튼 크기가 약간 어긋남. 이유는 모르겠음
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        //safeArea 적용 위해서 viewDidAppear에서 실행
        if deviceModel == "iPhone"{
            buttonConstraints(view.safeAreaLayoutGuide.layoutFrame.size)
            labelConstrains(view.safeAreaLayoutGuide.layoutFrame.size)
        }
        
        if deviceModel == "iPad" {
            putLayoutAccordingToOrientation(view.frame.size)
        }
        
    }
    
    


    //MARK: - Functions
    func basicFeatures(_ button:UIButton){
        afterLabelAnimation()
        soundEffect()
        animationForButton(button: button)
    }
    
    func toast(){
        if viewModel.message {
            ToastMessage.showToast(message: "Too many inputs".localized, view: self.view)
            viewModel.message = false
        }
    }
    
    func expressionUpdate(){
        expressionLabel.text = viewModel.expressionLabel()
        labelFont(expressionLabel)
        expressionLabel.attributedExpression(expressionLabel.text!)
    }
    
    func answerUpdate(){
        answerLabel.text = viewModel.answerLabel()
        labelFont(answerLabel)
        answerLabel.attributedAnswer(answerLabel.text ?? "")
        //attributedAnswer(answerLabel.text ?? "", answerLabel)
    }
    
    func afterEnter(){
        if viewModel.isEnterClicked{
            viewModel.input.removeAll()
            expressionLabel.text?.removeAll()
            answerLabel.text?.removeAll()
            viewModel.isEnterClicked = false
        }
    }
}

//MARK: - Objc Methods
extension ViewController {
    @objc func doubleZeroBtnClicked(){
        afterEnter()
        basicFeatures(doubleZeroBtn
        )
        viewModel.isPercent()
        viewModel.input.append( "00" )
        if viewModel.input == "00"{
            viewModel.input = "0"
        }
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func zeroBtnClicked(){
        afterEnter()
        basicFeatures(zeroBtn)
        viewModel.isPercent()
        viewModel.input.append( "0" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func oneBtnClicked(){
        afterEnter()
        basicFeatures(oneBtn)
        viewModel.isPercent()
        viewModel.input.append( "1" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func twoBtnClicked(){
        afterEnter()
        basicFeatures(twoBtn)
        viewModel.isPercent()
        viewModel.input.append( "2" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func threeBtnClicked(){
        afterEnter()
        basicFeatures(threeBtn)
        viewModel.isPercent()
        viewModel.input.append( "3" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func fourBtnClicked(){
        afterEnter()
        basicFeatures(fourBtn)
        viewModel.isPercent()
        viewModel.input.append( "4" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func fiveBtnClicked(){
        afterEnter()
        basicFeatures(fiveBtn)
        viewModel.isPercent()
        viewModel.input.append( "5" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func sixBtnClicked(){
        afterEnter()
        basicFeatures(sixBtn)
        viewModel.isPercent()
        viewModel.input.append( "6" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func sevenBtnClicked(){
        afterEnter()
        basicFeatures(sevenBtn)
        viewModel.isPercent()
        viewModel.input.append( "7" )
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func eightBtnClicked(){
        afterEnter()
        basicFeatures(eightBtn)
        viewModel.isPercent()
        viewModel.input.append("8")
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func nineBtnClicked(){
        afterEnter()
        viewModel.isPercent()
        viewModel.input.append("9")
        basicFeatures(nineBtn)
        expressionUpdate()
        answerUpdate()
        toast()
    }
    
    @objc func dotBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(dotBtn)
        if viewModel.dotButton(){
            viewModel.input.append(".")
            expressionLabel.text?.append(".")
            answerUpdate()
        }
    }
    
    @objc func additionBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(additionBtn)
        viewModel.changeLastOp()
        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
            viewModel.input.append(" + ")
        }
        expressionUpdate()
        answerUpdate()

    }
    
    @objc func subtractionBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(subtractionBtn)
        viewModel.changeLastOp()
        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
            viewModel.input.append(" – ")
        }
        expressionUpdate()
        answerUpdate()

    }
    
    @objc func multiplyBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(multiplyBtn)
        viewModel.changeLastOp()
        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
            viewModel.input.append(" × ")
        }
        expressionUpdate()
        answerUpdate()

    }
    
    @objc func divisionBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(divisionBtn)
        viewModel.changeLastOp()
        if !viewModel.input.isEmpty && !viewModel.input.hasSuffix("-"){
            viewModel.input.append(" ÷ ")
        }
        expressionUpdate()
        answerUpdate()

    }
    
    @objc func percentBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(percentBtn)
        viewModel.percentButton()
        expressionUpdate()
        answerUpdate()
    }
    
    @objc func clearBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(clearBtn)
        viewModel.input.removeAll()
        expressionLabel.text?.removeAll()
        answerLabel.text?.removeAll()
    }
    
    @objc func deleteBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(deleteBtn)
        if viewModel.input.last == " "{
            viewModel.input.removeLast(3)
        }else if viewModel.input.last == "H"{
            repeat{
                _ = viewModel.input.popLast()
            }while(viewModel.input.last != "H")
            _ = viewModel.input.popLast()
        }else{
            _ = viewModel.input.popLast()
        }
        expressionUpdate()
        if viewModel.input.last == "."{
            expressionLabel.text?.append(".")
        }
        answerUpdate()
    }
    
    @objc func enterBtnClicked(){
        basicFeatures(enterBtn)
        if viewModel.input.isEmpty{ return }
        performLabelAnimation()
        viewModel.enterButton()
        answerUpdate()
        //expressionLabel.text = answerLabel.text
       // hisView.reloadData()
        let IndexPathOfLastRow = IndexPath(row: history.history.count - 1, section: 0)
        self.hisView.insertRows(at: [IndexPathOfLastRow], with: UITableView.RowAnimation.left)
        hisView.scrollToRow(at: IndexPathOfLastRow, at: .bottom, animated: true)
    }
    
    @objc func historyBtnClicked(){
        soundEffect()
        animationForButton(button: historyBtn)
        let vc = HistoryViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func signBtnClicked(){
        viewModel.isEnterClicked = false
        basicFeatures(signBtn)
        viewModel.signButton()
        expressionUpdate()
        answerUpdate()
    }
    
    @objc func noteBtnClicked(_ sender: UIButton){
        //     historyLoad()
        let nextViewController = TextViewController()
        nextViewController.modalTransitionStyle = .crossDissolve
        nextViewController.modalPresentationStyle = .overFullScreen
        
        let contentView = sender.superview
        let cell = contentView?.superview as! UITableViewCell
        let a = hisView.indexPath(for: cell)
        nextViewController.index = a!
        nextViewController.currentBtn = sender
        
        //nextViewController.updateTextView(viewModel.history[a!.row].comment)
        nextViewController.updateTextView(history.history[a!.row].comment)
        present(nextViewController, animated: true, completion: nil)
    }
    
    @objc func trashButtonClicked(){
        soundEffect()
        let alert = UIAlertController(title: "Alert!".localized, message: "Are you sure to delete all history?".localized, preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes".localized, style: .destructive ) { (action) in
            //self.viewController().viewModel.history.removeAll()
            self.history.history.removeAll()
            UserDefaults.standard.removeObject(forKey: "notes")
            self.hisView.reloadData()
        }
        
        let no = UIAlertAction(title: "No".localized, style: .default, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(no)
        
        if !history.history.isEmpty{//!viewController().viewModel.history.isEmpty{
            present(alert, animated: true, completion: nil)
        }
    }
}


//MARK: - Constraints
extension ViewController {

    func buttonConstraints(_ size : CGSize){
            
        let gap = size.width * 0.06/3
        
        let width = (size.width - gap*5)*0.25
        
        //let height = (size.height*6/10-gap*5)*0.2
        
       // let height = (size.height * 2/3 - gap*5)*0.2
        
        let height = deviceModel == "iPad" ? ((size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)*0.75 - gap * 6 ) / 7 : (size.height*2/3-gap*5)*0.2

        doubleZeroBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(zeroBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        zeroBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        dotBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.centerX).offset(gap/2)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        enterBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(dotBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        oneBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(twoBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(doubleZeroBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        twoBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(zeroBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        threeBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.centerX).offset(gap/2)
            make.bottom.equalTo(dotBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        additionBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(enterBtn.snp.top).offset(-gap)
            make.leading.equalTo(threeBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        fourBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(fiveBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(oneBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        fiveBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(twoBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        sixBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.centerX).offset(gap/2)
            make.bottom.equalTo(threeBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        subtractionBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(additionBtn.snp.top).offset(-gap)
            make.leading.equalTo(sixBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        sevenBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(eightBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(fourBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        eightBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(fiveBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        nineBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.centerX).offset(gap/2)
            make.bottom.equalTo(sixBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        multiplyBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(subtractionBtn.snp.top).offset(-gap)
            make.leading.equalTo(nineBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        clearBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(signBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(sevenBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        signBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(view.snp.centerX).offset(-gap/2)
            make.bottom.equalTo(eightBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        percentBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.centerX).offset(gap/2)
            make.bottom.equalTo(nineBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        divisionBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(multiplyBtn.snp.top).offset(-gap)
            make.leading.equalTo(percentBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        //TwoExceptions
        deleteBtn.snp.remakeConstraints{ make in
            make.centerX.equalTo(divisionBtn.snp.centerX)
            make.height.equalTo(height/2)
            make.width.equalTo(width)
            make.bottom.equalTo(divisionBtn.snp.top).offset(-gap)
        }
        
        historyBtn.snp.remakeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(clearBtn.snp.centerX)
            make.height.equalTo(height/2)
            make.width.equalTo(historyBtn.snp.height)
            make.bottom.equalTo(expressionLabel.snp.top).offset(-gap)
        }
    }
    
    func buttonConstraintsLandscapeForIpad(_ size:CGSize){

        let gap = size.width * 0.01
        
        let deviceWidth = size.width
        
        let width = (size.width * 0.5 - gap*5)*0.25
        
      //  let height = ((size.height)*2/3-gap*5)*0.2
        //let height = ((size.height)*6/10-gap*5)*0.2
        let height = ((size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)*0.75 - gap * 6 ) / 6
        
        doubleZeroBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(zeroBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        zeroBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.snp.trailing).offset(-deviceWidth/4-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        dotBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.trailing).offset(-deviceWidth/4+gap/2)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        enterBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(dotBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        oneBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(twoBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(doubleZeroBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        twoBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(zeroBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.trailing).offset(-deviceWidth/4-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        threeBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.trailing).offset(-deviceWidth/4+gap/2)
            make.bottom.equalTo(dotBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        additionBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(enterBtn.snp.top).offset(-gap)
            make.leading.equalTo(threeBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        fourBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(fiveBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(oneBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        fiveBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(twoBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.trailing).offset(-deviceWidth/4-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        sixBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.trailing).offset(-deviceWidth/4+gap/2)
            make.bottom.equalTo(threeBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        subtractionBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(additionBtn.snp.top).offset(-gap)
            make.leading.equalTo(sixBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        sevenBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(eightBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(fourBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        eightBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(fiveBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.trailing).offset(-deviceWidth/4-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        nineBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.trailing).offset(-deviceWidth/4+gap/2)
            make.bottom.equalTo(sixBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        multiplyBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(subtractionBtn.snp.top).offset(-gap)
            make.leading.equalTo(nineBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        clearBtn.snp.remakeConstraints{ make in
            make.trailing.equalTo(signBtn.snp.leading).offset(-gap)
            make.bottom.equalTo(sevenBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        signBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(eightBtn.snp.top).offset(-gap)
            make.trailing.equalTo(view.snp.trailing).offset(-deviceWidth/4-gap/2)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        percentBtn.snp.remakeConstraints{ make in
            make.leading.equalTo(view.snp.trailing).offset(-deviceWidth/4+gap/2)
            make.bottom.equalTo(nineBtn.snp.top).offset(-gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        divisionBtn.snp.remakeConstraints{ make in
            make.bottom.equalTo(multiplyBtn.snp.top).offset(-gap)
            make.leading.equalTo(percentBtn.snp.trailing).offset(gap)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        //TwoExceptions
        deleteBtn.snp.remakeConstraints{ make in
            make.centerX.equalTo(divisionBtn.snp.centerX)
            make.bottom.equalTo(divisionBtn.snp.top).offset(-gap)
            make.height.equalTo(height/2)
            make.width.equalTo(width)
        }
    }
    
    func labelConstrains(_ size:CGSize){
    
        let gap = size.width * 0.06/3
    
        let height = deviceModel == "iPad" ? (size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)*0.2 : size.height * 1/3 * 3/4 * 0.5

        let width = size.width - gap*2

        expressionLabel.snp.remakeConstraints{ make in
            make.trailing.equalToSuperview().inset(gap)
            make.bottom.equalTo(answerLabel.snp.top)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        answerLabel.snp.remakeConstraints{ make in
            make.width.equalTo(width)
            make.height.equalTo(height*0.5)
            make.bottom.equalTo(deleteBtn.snp.top).offset(-gap)
            make.trailing.equalToSuperview().inset(gap)
        }
        
    }
    
    func labelSizeLandscapeForIpad(_ size:CGSize){
        
        let gap = size.width * 0.01
        
       // let height = (size.height * 4/10 - deleteBtn.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom) / 2
        
        let height = (size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)*0.2

        
        let width = size.width * 0.5 - gap*2

        expressionLabel.snp.remakeConstraints{ make in
            make.trailing.equalToSuperview().inset(gap)
            make.bottom.equalTo(answerLabel.snp.top)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        answerLabel.snp.remakeConstraints{ make in
            make.width.equalTo(width)
            make.height.equalTo(height*0.5)
            make.trailing.equalToSuperview().inset(gap)
        }
        
    }
    
    func setTableViewConstraints() {
        hisView.snp.makeConstraints{ make in
            make.top.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }

}


//MARK: - Methods related to Buttons
extension ViewController {
    func buttonGenerator(button:UIButton,title:String,titleColor:UIColor,titleColorWhenHighlighted:UIColor,titleFontSize:CGFloat,cornerRadius:CGFloat,backGroundColor:UIColor){
        button.backgroundColor =  backGroundColor
        button.layer.cornerRadius = cornerRadius
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColorWhenHighlighted, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
    }
    //Add buttons on view
    func addButtons(){
        let buttonArray : [UIButton] = [dotBtn,zeroBtn,oneBtn,twoBtn,threeBtn,fourBtn,fiveBtn,sixBtn,sevenBtn,eightBtn,nineBtn,enterBtn,additionBtn,subtractionBtn,multiplyBtn,divisionBtn,percentBtn,clearBtn,deleteBtn,historyBtn,signBtn,doubleZeroBtn]
        _ = buttonArray.map{ view.addSubview($0)}
    }
    
    //Button sound
    func soundEffect(){
        AudioServicesPlaySystemSound(SystemSoundID(1104))
    }
    //Button animation
    func animationForButton( button : UIButton ){
        UIView.animate(withDuration: 0.05, delay: 0, options: .allowUserInteraction, animations: {
            button.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: {
            finished in UIView.animate(withDuration: 0.05, animations: {
                button.transform = CGAffineTransform.identity
            })}
        )
    }
}


//MARK: - Methods related to Labels
extension ViewController {
    
    func addLabels(view:UIView){
        view.addSubview(answerLabel)
        view.addSubview(expressionLabel)
    }
    
    func afterLabelAnimation(){
        expressionLabel.transform = CGAffineTransform.identity
        answerLabel.transform = CGAffineTransform.identity
        answerLabel.textColor = .init(hue: 213/360, saturation: 0.09, brightness: 0.41, alpha: 1)//회색
    }
    
    func performLabelAnimation(){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .allowUserInteraction, animations: {   self.expressionLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.answerLabel.transform = CGAffineTransform(translationX: 0, y: (-self.expressionLabel.bounds.height/2 - self.answerLabel.bounds.height/2 ))
            self.answerLabel.textColor =  .init(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1)//파란색
        }, completion: nil)
    }
    
    func labelFont(_ inputLabel:UILabel){
        var FontSize : CGFloat = inputLabel.bounds.width * 0.1
        if lineNumber(label: inputLabel, labelWidth: inputLabel.bounds.width) == 2 && toggle{
            if let point = inputLabel.text?.count{
                turningPoint = point
            }
            toggle = false
        }
        if lineNumber(label: inputLabel, labelWidth: inputLabel.bounds.width) == 3 && toggleForThirdLine{
            if let point = inputLabel.text?.count{
                turningPointForThirdLine = point
            }
            toggleForThirdLine = false
        }
        if let a = inputLabel.text?.count {
            if a >= turningPointForThirdLine && !toggleForThirdLine{
                FontSize = inputLabel.bounds.width * 0.05
            }else if a > turningPoint && !toggle{
                FontSize = inputLabel.bounds.width * 0.075
            }else if a < turningPoint && !toggle{
                FontSize = inputLabel.bounds.width * 0.1
            }
        }
        inputLabel.font = .systemFont(ofSize: FontSize)
    }
    
    func lineNumber(label: UILabel, labelWidth: CGFloat) -> Int {
        let boundingRect = label.text!.boundingRect(with: .zero, options: [.usesFontLeading], attributes: [.font: label.font!], context: nil)
        return deviceModel == "iPad" ?  Int( ( 20+boundingRect.width ) / labelWidth + 1) : Int( (40 + boundingRect.width ) / labelWidth + 1)    // 25 보통
    } //레이블 텍스트 줄 수
}
//MARK: - ButtonGenerator
extension UIButton {
    func buttonGenerator(button:UIButton,title:String,titleColor:UIColor,titleColorWhenHighlighted:UIColor,titleFontSize:CGFloat,cornerRadius:CGFloat,backGroundColor:UIColor){
        button.backgroundColor =  backGroundColor
        button.layer.cornerRadius = cornerRadius
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColorWhenHighlighted, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
    }
}
//MARK: - Localized
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "InfoPlist", value: self, comment: "")
    }
}

extension UILabel{
    
    func attributedExpression(_ text:String){
        var substituted = text
        let entireLength = text.count
        var expLength = Int()
        var expRanges = [NSRange]()
        var expStartIndices = [Int]()
        var correction = 0
        let opArray : [String] = ["–","+","×","÷"]
        var range = NSRange(location: 0, length: entireLength)
        var rangeArray = [NSRange]()

        for (index,value) in substituted.enumerated(){
            if value == "e"{
                expStartIndices.append(index)
            }
        }
        for i in expStartIndices{
            let expIndex = substituted.index(substituted.startIndex, offsetBy: i)
            for i in 2...5{
                if  ["–","+","×","÷","%"].contains(substituted[substituted.index(expIndex, offsetBy: i)]){
                    expLength = i-2
                    break
                }
                if substituted.index(expIndex, offsetBy: i) == substituted.index(before: substituted.endIndex){
                    expLength = i-1
                    break
                }
            }
            let distance = substituted.distance(from: substituted.startIndex, to: expIndex)
            expRanges.append(NSRange(location: distance+3+correction, length: expLength))
            correction += 1
        }
        while ( substituted.contains("e+")){
            if let replaceRange = substituted.range(of: "e+"){
                substituted.replaceSubrange(replaceRange, with: "×10")
            }
        }
        for op in opArray {                         //사칙연산기호
            while (range.location != NSNotFound){
                range = (substituted as NSString).range(of: op, options: .caseInsensitive, range: range)
                rangeArray.append(range)
                if ( range.location != NSNotFound ){
                    range = NSRange(location: range.location + range.length, length: entireLength - ( range.location + range.length ) )
                }
            }
            range = NSRange(location: 0, length: entireLength)
        }
        let attributedString = NSMutableAttributedString(string: substituted)
        let font = UIFont.systemFont(ofSize: self.font.pointSize * 0.5 )
        expRanges.forEach{ range in
            attributedString.addAttribute(.font, value: font, range: range)
            attributedString.addAttribute(.baselineOffset, value: self.font.lineHeight*0.5, range: range)
        }
        rangeArray.forEach{ range in
            attributedString.addAttribute(.foregroundColor, value: UIColor(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1) , range: range)
        }
        self.attributedText = attributedString
    }
    
    func attributedAnswer(_ text:String ){
        var substituted = text
        if let replaceRange = substituted.range(of: "e+"){
            substituted.replaceSubrange(replaceRange, with: "×10")
        }
        let attributedString = NSMutableAttributedString(string: substituted)
        if let a = substituted.firstIndex(of: "×"){
            let start = substituted.index(a, offsetBy: 3)
            let end   = substituted.endIndex
            let color = NSRange(a...a,in: substituted)
            let  a = NSRange(start..<end, in: substituted)
            let font = UIFont.systemFont(ofSize: self.font.pointSize * 0.5 )
            attributedString.addAttribute(.foregroundColor, value: UIColor(hue: 217/360, saturation: 0.44, brightness: 0.97, alpha: 1), range: color)
            attributedString.addAttribute(.font, value: font, range: a)
            attributedString.addAttribute(.baselineOffset, value: self.font.lineHeight*0.5, range: a)//아이패드 72가 적당(132). 아이폰 25가 적당(76). 아이패드미니 49적당(109)
        }
        self.attributedText = attributedString
    }
}


//MARK: - ViewOrientation Constraints
extension ViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)

        putLayoutAccordingToOrientation(size)
                
    }
    
    func putLayoutAccordingToOrientation(_ size : CGSize){
        
        if deviceModel == "iPad"{
            if size.width > size.height{
                historyBtn.removeFromSuperview()
                view.addSubview(hisView)
                setTableViewConstraints()
                buttonConstraintsLandscapeForIpad(size)
                labelSizeLandscapeForIpad(size)
            }else{
                hisView.removeFromSuperview()
                view.addSubview(historyBtn)
                buttonConstraints(size)
                labelConstrains(size)
            }
        }
    }
    
    func setupTableView(){
        hisView.backgroundColor = .init(hue: 300/360, saturation: 0.05, brightness: 0.05, alpha: 1)
        hisView.delegate = self
        hisView.dataSource = self
    }
    
}

//MARK: - TableViewDataSource
extension ViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        //cell.update(info:viewModel.history[indexPath.row])
        cell.update(info:history.history[indexPath.row])
        cell.setConstraint()
        cell.button.addTarget(self, action: #selector(noteBtnClicked(_:)), for: .touchUpInside)
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
//MARK: - TableViewDelegate
extension ViewController : UITableViewDelegate{
    //헤더뷰
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 100))
        headerView.backgroundColor = .init(hue: 300/360, saturation: 0.05, brightness: 0.05, alpha: 1)
    
        let label : UILabel = {
            let label = UILabel()
            label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width-70, height: headerView.frame.height)
            label.text = "History".localized
            label.font = .systemFont(ofSize:25)
            label.textColor = .white
            return label
        }()

        lazy var trashButton : UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: label.frame.width, y: 0, width: headerView.frame.width - label.frame.width-10, height: headerView.frame.height)
            button.setImage(UIImage(systemName: "trash"), for: .normal)
            button.setPreferredSymbolConfiguration(.init(pointSize: 30, weight: .regular, scale: .default), forImageIn: .normal)
            button.tintColor = .white
            button.imageView?.contentMode = .scaleAspectFit
            button.addTarget(self, action: #selector(trashButtonClicked), for: .touchUpInside)
            return button
        }()


        headerView.addSubview(label)
        headerView.addSubview(trashButton)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    //셀 클릭했을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let answer = viewController().viewModel.history[indexPath.row].output
        let answer = history.history[indexPath.row].output
        if expressionLabel.text!.isEmpty {
            viewModel.input.append( answer )
        }else {                                                //입력창에 뭐 있을 때
            let last = expressionLabel.text?.last
            if last == "-" && answer.contains("-"){
               viewModel.input.removeLast()
                //answer.removeFirst()
                viewModel.input.append(answer.filter{$0 != "-"})
            }else if last == "×" || last == "÷" || last == "+" || last == "–" || last == "-" {
                viewModel.input.append(answer)
            }else if last == "."{
                viewModel.input.removeLast()
                viewModel.input.append(" × " + answer)
            }else{
                viewModel.input.append(" × " + answer)
            }
        }
        viewModel.isEnterClicked = false
        answerLabel.text?.removeAll()
        expressionLabel.transform = CGAffineTransform.identity //클릭했을 때 애니메이션으로 위치가 달라진 레이블 복귀, afteranimation은 색깔까지 answerLabel의 색까지 바꿔버리기 때문에
        answerLabel.transform = CGAffineTransform.identity
        expressionUpdate()
        answerUpdate()
    }
}
