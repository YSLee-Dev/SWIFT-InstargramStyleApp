//
//  ProfileVC.swift
//  Five_InstargramStyleApp
//
//  Created by 이윤수 on 2022/09/06.
//

import UIKit

import SnapKit
import Then

class ProfileVC : UIViewController{
    
    lazy var moreBtn = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: nil)
    
    lazy var colletionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then{
        $0.register(ContentsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentsHeader")
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCell")
        $0.backgroundColor = .systemBackground
        $0.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSet()
    }
}

extension ProfileVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContentsHeader", for: indexPath) as? ContentsHeader else {return UICollectionReusableView()}
            return cell
        }else{
            return UICollectionReusableView()
        }
    }
}

private extension ProfileVC{
    func viewSet(){
        self.navigationItem.title = "USER NAME"
        self.navigationItem.rightBarButtonItem = self.moreBtn
        
        self.view.addSubview(self.colletionView)
        self.colletionView.snp.makeConstraints{
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        self.colletionView.collectionViewLayout = self.collectionViewLayout()
    }
    
    func collectionViewLayout() -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalWidth(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [self.headerSize()]
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    func headerSize() -> NSCollectionLayoutBoundarySupplementaryItem{
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}
