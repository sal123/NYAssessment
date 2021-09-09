//
//  HomeListViewCell.swift
//  NYAssessment
//
//  Created by Umer Maqsood on 9/8/21.
//

import UIKit

class HomeListViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblByline: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!
    @IBOutlet weak var Thumbnail: RoundImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
