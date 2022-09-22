//
//  UploadVC.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/20.
//

import UIKit

import SnapKit
import Then

class UploadVC : UIViewController{
    var image : UIImage?
    
    lazy var cancelBtn = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(cancelBtnClick))
    lazy var okBtn = UIBarButtonItem(title: "공유", style: .done, target: self, action: #selector(okBtnClick))
    
    lazy var imageView = UIImageView().then{
        $0.image = self.image
    }
    
    lazy var textView = UITextView().then{
        $0.font = .systemFont(ofSize: 15)
        $0.text = "문구 입력..."
        $0.textColor = .secondaryLabel
        $0.delegate = self
    }
    
    init(image : UIImage?){
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSet()
    }
}

extension UploadVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .secondaryLabel{
            textView.textColor = .label
            textView.text = ""
        }
    }
}


private extension UploadVC {
    func viewSet(){
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "새 게시물"
        self.navigationItem.leftBarButtonItem = self.cancelBtn
        self.navigationItem.rightBarButtonItem = self.okBtn
        
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.textView)
        
        self.imageView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            $0.size.equalTo(100)
        }
        
        self.textView.snp.makeConstraints{
            $0.top.equalTo(self.imageView)
            $0.bottom.equalTo(self.imageView)
            $0.leading.equalTo(self.imageView.snp.trailing)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
        }
    }
    
    @objc
    private func cancelBtnClick(){
        self.dismiss(animated: true)
    }
    
    @objc
    private func okBtnClick(){
        let alert = UIAlertController(title: "공유하시겠습니까?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        self.present(alert, animated: true)
    }
}
