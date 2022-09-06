//
//  TabbarController.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/06.
//

import UIKit

import SnapKit
import Then

class TabbarController : UITabBarController{
    lazy var mainVC = MainVC().then{
        $0.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
    }
    
    lazy var profileVC = ProfileVC().then{
        $0.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabbarSet()
    }
}

private extension TabbarController{
    func tabbarSet(){
        self.viewControllers = [UINavigationController(rootViewController: self.mainVC), self.profileVC]
    }
}
