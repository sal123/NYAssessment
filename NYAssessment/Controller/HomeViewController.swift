//  NYAssessment
//
//  Created by Umer Maqsood on 9/8/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView : UICollectionView!
    private var itemViewModel : ItemViewModel!
    var itemList: [Result]!

    //var category = CategoryModel()
    //var moreOptions: [RecommendedCellModel]!

    lazy var collectionViewFlowLayout : CustomCollectionViewFlowLayout = {
        let layout = CustomCollectionViewFlowLayout(display: .list)
        return layout
    }()
    
    let dataSource = CollectionViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        self.collectionView.register(UINib(nibName: "HomeListViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeListViewCell")

        
        getItemList()


    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func getItemList(){
        
        self.itemViewModel =  ItemViewModel()
        itemViewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.itemViewModel.isLoading ?? false
                if isLoading {
                    Utility.shared.showLoader(view: (self?.view)!)
                }else {
                    Utility.shared.hud.dismiss(afterDelay: 0.3)
                }
            }
        }
        self.itemViewModel.callFuncToGetItemData()
        self.itemViewModel.loadTableViewClosure = {
            
            DispatchQueue.main.async(execute: {
                self.updateUI()
            })
        }
    }
    func updateUI(){
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout

        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self
        self.collectionViewFlowLayout.display = .list
    
        self.dataSource.delegate = self
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.collectionView.reloadData()
        }
        itemList = itemViewModel.itemData.results
        self.dataSource.data.value = itemList
    }
    @IBAction func logOutButton(sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("I'm tapping the \(indexPath.item)")

        guard let controller:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController  else{
            return
        }
        controller.url = self.itemViewModel.itemData.results[indexPath.row].url
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomeViewController: CellButtonDelegate {
    func buttonClick(action: String, tag: Int) {
        print(action, tag)
    }
}
