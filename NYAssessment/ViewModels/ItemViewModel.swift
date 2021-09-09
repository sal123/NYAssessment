//
//  HomeListViewCell.swift
//  NYAssessment
//
//  Created by Umer Maqsood on 9/8/21.
//

import UIKit

class ItemViewModel: NSObject {
    
    private var apiService : APIService!
    
    private(set) var itemData : ItemListModel! {
        didSet {
            self.loadTableViewClosure()
        }
    }
    
    var loadTableViewClosure : (() -> ()) = {}
    var updateLoadingStatus: (()->())?
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    override init() {
        super.init()
        self.apiService =  APIService()
        //callFuncToGetItemData()
    }
    
    func callFuncToGetItemData() {
        self.isLoading = true
        self.apiService.apiToGetItems() { (itemData) in
            self.isLoading = false
            self.itemData = itemData
        }
    }
}
