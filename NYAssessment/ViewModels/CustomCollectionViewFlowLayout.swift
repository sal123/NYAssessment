//
//  HomeListViewCell.swift
//  NYAssessment
//
//  Created by Umer Maqsood on 9/8/21.
//

import Foundation
import UIKit

enum CollectionDisplay {
    case inline
    case list
    case grid
}

class CustomCollectionViewFlowLayout : UICollectionViewFlowLayout {
    
    var viewController: String = ""
    var display : CollectionDisplay = .grid {
        didSet {
            if display != oldValue {
                self.invalidateLayout()
            }
        }
    }
    
    convenience init(display: CollectionDisplay) {
        self.init()
        
        self.display = display
        //self.minimumLineSpacing = 10
        //self.minimumInteritemSpacing = 10
        self.configLayout()
    }
    
    
    func configLayout() {
        switch display {
        case .inline:
            self.scrollDirection = .horizontal
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width * 0.9, height: 300)
            }
            
        case .grid:
            
                self.scrollDirection = .horizontal

                let screenSize: CGRect = UIScreen.main.bounds
                let screenWidth = screenSize.width
                let itemsPerRow:CGFloat = 2.3
                let hardCodedPadding:CGFloat = 14
                let itemWidth = (screenWidth / itemsPerRow)
                let itemHeight = (screenWidth / itemsPerRow)
                print(itemWidth, itemHeight)
                self.itemSize = CGSize(width: itemWidth - hardCodedPadding , height: 260)
                
            //}
            
        case .list:
            self.scrollDirection = .vertical
            //if let collectionView = self.collectionView {
                let screenSize: CGRect = UIScreen.main.bounds
                let screenWidth = screenSize.width
                
                let itemsPerRow:CGFloat = 1
                let hardCodedPadding:CGFloat = 5
                let itemWidth = (screenWidth / itemsPerRow) - hardCodedPadding
                let itemHeight = (screenWidth / itemsPerRow)
                print("List", itemWidth, itemHeight)
                      
                self.itemSize = CGSize(width: itemWidth  , height: 130)

            
        }
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        self.configLayout()
    }
}
