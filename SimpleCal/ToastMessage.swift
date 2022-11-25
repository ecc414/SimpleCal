//
//  ToastMessage.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//

//
//  ToastMessage.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/03/28.
//

import Foundation
import UIKit

class ToastMessage {
    //alertMessage
    static func showToast(message : String , view : UIView) {
        let width_variable:CGFloat = 80
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: view.frame.size.height-150, width: view.frame.size.width-2*width_variable, height: 35))
        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(1)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 2 , delay: 0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
