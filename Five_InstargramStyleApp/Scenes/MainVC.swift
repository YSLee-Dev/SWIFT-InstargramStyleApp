//
//  MainVC.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/06.
//

import UIKit

import SnapKit
import Then

class MainVC: UIViewController {

    lazy var plusBtn = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: #selector(plusBtnClick(_ :)))
    
    lazy var tableView = UITableView().then{
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCell")
        $0.backgroundColor = .systemBackground
        $0.separatorStyle = .none
        $0.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSet()
    }
    
    @objc private func plusBtnClick(_ sender:Any){
        print("눌림")
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
}
