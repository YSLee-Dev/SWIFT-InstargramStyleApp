//
//  ContentsDataView.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/19.
//

import UIKit

import SnapKit
import Then

class ContentsDataView : UIView{
    var title : String
    var count : String
    
    lazy var titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 13)
        $0.text = self.title
        $0.textColor = .black
    }
    
    lazy var countLabel = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 15)
        $0.text = self.count
        $0.textColor = .black
    }
    
    init(title : String, count : String){
        self.title = title
        self.count = count
        super.init(frame: .zero)
        self.viewSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewSet(){
        let stackView = UIStackView(arrangedSubviews: [self.countLabel, self.titleLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 5
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
