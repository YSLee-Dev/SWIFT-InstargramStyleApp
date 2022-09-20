//
//  ContentsCell.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/20.
//

import UIKit

import SnapKit
import Then

class ContentsCell : UICollectionViewCell{
    
    var imageView = UIImageView().then{
        $0.backgroundColor = .tertiaryLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewSet(){
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
