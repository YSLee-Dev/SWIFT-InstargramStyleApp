//
//  CustomBtn.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/06.
//

import UIKit

extension UIButton{
    func setImage(systemName : String){
        self.contentHorizontalAlignment = .fill
        self.contentVerticalAlignment = .fill
        
        self.imageView?.contentMode = .scaleAspectFit
        
        self.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    func setProfileBtn(bgColor : UIColor, textColor : UIColor){
        self.layer.cornerRadius = 5
        self.titleLabel?.font = .systemFont(ofSize: 12)
        self.backgroundColor = bgColor
        self.setTitleColor(textColor, for: .normal)
        self.layer.borderColor = UIColor.quaternaryLabel.cgColor
        self.layer.borderWidth = 0.5
    }
}
