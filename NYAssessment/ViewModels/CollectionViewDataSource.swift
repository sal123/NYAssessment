//
//  HomeListViewCell.swift
//  NYAssessment
//
//  Created by Umer Maqsood on 9/8/21.
//

import Foundation
import UIKit
import AlamofireImage

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
protocol CellButtonDelegate: AnyObject{
    func buttonClick(action: String, tag:Int) //parameter: cell that was pressed
}
class CollectionViewDataSource : GenericDataSource<Result>, UICollectionViewDataSource, UICollectionViewDelegate{
    var cellType: String?
    var listType: String?

    var delegate: CellButtonDelegate?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeListViewCell", for: indexPath) as! HomeListViewCell
                
        
                    cell.lblTitle.text = data.value[indexPath.row].title
                    cell.lblByline.text = data.value[indexPath.row].byline
                    cell.lblPublishedDate.text = data.value[indexPath.row].publishedDate
        
                    cell.Thumbnail.af.setImage(withURL: URL(string: data.value[indexPath.row].media[0].mediaMetadata[0].url )!)


        
                return cell

            

        }
        
}
