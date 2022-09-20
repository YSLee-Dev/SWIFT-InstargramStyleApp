//
//  MainVC.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/06.
//

import UIKit

import SnapKit
import Then
import PhotosUI

class MainVC: UIViewController {
    
    lazy var plusBtn = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: #selector(plusBtnClick(_ :)))
    
    lazy var tableView = UITableView().then{
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCell")
        $0.backgroundColor = .systemBackground
        $0.separatorStyle = .none
        $0.dataSource = self
    }
    
    lazy var picker : PHPickerViewController = {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSet()
    }
}

extension MainVC : PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        self.dismiss(animated: true)
        
        if !results.isEmpty{
            let img = results[0].itemProvider
            if img.canLoadObject(ofClass: UIImage.self){
                img.loadObject(ofClass: UIImage.self){[weak self] loadImg ,_ in
                    DispatchQueue.main.async {
                        let vc = UINavigationController(rootViewController: UploadVC(image: loadImg as? UIImage))
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                    }
                }
            }else{
                let alert = UIAlertController(title: "오류", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .destructive))
                self.present(alert, animated: true)
            }
        }
    }
}

extension MainVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as? MainTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}

private extension MainVC {
    func viewSet(){
        self.navigationItem.title = "Instargram"
        self.navigationItem.rightBarButtonItem = self.plusBtn
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @objc
    private func plusBtnClick(_ sender:Any){
        self.present(self.picker, animated: true)
    }
}
