//
//  ContentsHeader.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/19.
//

import UIKit

import SnapKit
import Then

class ContentsHeader : UICollectionReusableView{
    
    var profileImg = UIImageView().then{
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 40
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    var userName = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 13)
        $0.textColor = .black
    }
    
    var userTitle = UILabel().then{
        $0.font = .systemFont(ofSize: 12)
        $0.numberOfLines = .max
        $0.textColor = .black
    }
    
    //DATA
    var photoCount = ContentsDataView(title: "게시물", count: "100")
    var follwerData = ContentsDataView(title: "팔로워", count: "100")
    var followingData = ContentsDataView(title: "팔로잉", count: "100")
    
    var dataStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 5
        $0.alignment = .center
        $0.distribution = .fillEqually
    }
    
    // BTN
    var followBtn = UIButton().then{
        $0.setTitle("팔로우", for: .normal)
        $0.setProfileBtn(bgColor: .systemBlue, textColor: .white)
    }
    
    var msgBtn = UIButton().then{
        $0.setTitle("메세지", for: .normal)
        $0.setProfileBtn(bgColor: .white, textColor: .black)
    }
    
    var btnStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 5
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellSet(){
        [self.profileImg, self.userName, self.userTitle, self.btnStack, self.dataStack].forEach{
            self.addSubview($0)
        }
        
        self.profileImg.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
            $0.size.equalTo(80)
        }
        
        self.userName.snp.makeConstraints{
            $0.leading.equalTo(self.profileImg.snp.leading)
            $0.trailing.equalTo(self.snp.trailing).inset(15)
            $0.top.equalTo(self.profileImg.snp.bottom).inset(-10)
        }
        
        self.userTitle.snp.makeConstraints{
            $0.leading.equalTo(self.profileImg.snp.leading)
            $0.trailing.equalTo(self.userName.snp.trailing)
            $0.top.equalTo(self.userName.snp.bottom).inset(-5)
        }
        
        self.btnStack.addArrangedSubview(self.followBtn)
        self.btnStack.addArrangedSubview(self.msgBtn)
        self.btnStack.snp.makeConstraints{
            $0.leading.equalTo(self.userName)
            $0.trailing.equalTo(self.snp.trailing).inset(15)
            $0.top.equalTo(self.userTitle.snp.bottom).inset(-5)
        }
        
        self.dataStack.addArrangedSubview(self.photoCount)
        self.dataStack.addArrangedSubview(self.follwerData)
        self.dataStack.addArrangedSubview(self.followingData)
        self.dataStack.snp.makeConstraints{
            $0.leading.equalTo(self.profileImg.snp.trailing).inset(-15)
            $0.trailing.equalTo(self.snp.trailing).inset(15)
            $0.centerY.equalTo(self.profileImg)
        }
    }
}
