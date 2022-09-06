//
//  MainTableViewCell.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/06.
//

import UIKit

import Then
import SnapKit

class MainTableViewCell : UITableViewCell{
    var photoImg = UIImageView().then{
        $0.backgroundColor = .systemGray5
    }
    
    var likeBtn = UIButton().then{
        $0.setImage(systemName: "heart")
    }
    
    var msgBtn = UIButton().then{
        $0.setImage(systemName: "message")
    }
    
    var shareBtn = UIButton().then{
        $0.setImage(systemName: "paperplane")
    }
    
    var bookmarkBtn = UIButton().then{
        $0.setImage(systemName: "bookmark")
    }
    
    var likeLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .label
        $0.text = "100명이 좋아합니다."
    }
    
    var mainLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .label
        $0.text = "이 게시물은 테스트 중인 게시물입니다. 잘 보이시나요?\nUIKIT을 통해 UI를 작업 중에 있습니다. 현재는 9월 6일 화요일입니다.\n오늘 날씨는 태풍이 지나간 이후로 맑습니다.\n내일 날씨는 모릅니다."
        $0.numberOfLines = 5
    }
    
    var dateLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .secondaryLabel
        $0.text = "1시간 전"
    }
    
    var btnStack = UIStackView().then{
        $0.alignment = .leading
        $0.distribution = .equalSpacing
        $0.spacing = 10
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellSet(){
        [
            self.photoImg, self.bookmarkBtn, self.likeLabel, self.mainLabel, self.dateLabel, self.btnStack
        ].forEach{
            self.addSubview($0)
        }
        
        self.photoImg.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(self.photoImg.snp.width)
        }
        
        self.btnStack.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalTo(self.photoImg.snp.bottom).offset(15)
        }
        
        [self.likeBtn, self.msgBtn, self.shareBtn].forEach{
            self.btnStack.addArrangedSubview($0)
            $0.snp.makeConstraints{ btn in
                btn.size.equalTo(25)
            }
        }
        
        self.bookmarkBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(15)
            $0.size.equalTo(25)
            $0.top.equalTo(self.btnStack)
        }
        
        self.likeLabel.snp.makeConstraints{
            $0.leading.equalTo(self.btnStack)
            $0.trailing.equalTo(self.bookmarkBtn)
            $0.top.equalTo(self.btnStack.snp.bottom).offset(15)
        }
        
        self.mainLabel.snp.makeConstraints{
            $0.leading.equalTo(self.btnStack)
            $0.trailing.equalTo(self.bookmarkBtn)
            $0.top.equalTo(self.likeLabel.snp.bottom).offset(7)
        }
        
        self.dateLabel.snp.makeConstraints{
            $0.leading.equalTo(self.btnStack)
            $0.trailing.equalTo(self.bookmarkBtn)
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(7)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
}
