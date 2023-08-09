//
//  HeadlinesVC.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit

class HeadlinesVC: UIViewController {
    
    // MARK: - IBOutlets.
    @IBOutlet weak var headLinesCView: UICollectionView!
    
    // MARK: - Private Variables.
    private var headLinesCViewItems = [ArticlesModel]()
    private var from_page = 1
    private var to_page = 5
    private var languageDevice = Locale.current.language.languageCode?.identifier
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let languageDevice {
            getHeadLines(by: languageDevice)
        }
        
    }
    
    // MARK: - Private Functions.
    private func setupUI() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        headLinesCView.delegate = self
        headLinesCView.dataSource = self
        
        headLinesCView.registerCell(cellClass: HeadlinesCViewCell.self)
        headLinesCView.registerCell(cellClass: LoadingCViewCell.self)
    }

}

// MARK: - UICollectionView DataSource.
extension HeadlinesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headLinesCViewItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let headLinesCell = collectionView.dequeue(indexPath: indexPath) as HeadlinesCViewCell
       // let loadingCell = collectionView.dequeue(indexPath: indexPath) as LoadingCViewCell
        let item = headLinesCViewItems[indexPath.row]
        
//        if from_page < to_page && indexPath.row == headLinesCViewItems.count - 1 {
//            loadingCell.configuraCell()
//            return loadingCell
//        }
        
        headLinesCell.configureCell(with: item)
        return headLinesCell
    }
    
}


// MARK: - UICollectionView Delegate & DelegateFlowLayout.
extension HeadlinesVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = headLinesCViewItems[indexPath.row]
        let vc = UIStoryboard(name: Constants.StoryBoardNames.home, bundle: nil).instantiateViewController(withIdentifier: Constants.VCIdentifier.webKitVC) as! WebKitVC
        
        vc.headLineURL = item.url
        vc.hidesBottomBarWhenPushed = true

        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = 260.0
        let width = (collectionView.bounds.width )
        
        return CGSize(width: width, height: height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//        if from_page < to_page && indexPath.row == headLinesCViewItems.count - 1 {
//            from_page += 1
//            if let languageDevice {
//                getHeadLines(by: languageDevice, page: from_page, isLoading: false)
//            }
//        }
//    }
}

// MARK: - APi.
extension HeadlinesVC  {
    
    func getHeadLines(by language: String, page: Int = 1, isLoading: Bool = true) {
        let parameters = [
            "page": page,
            "language": language
        ] as [String : Any]
        
        NetworkManager.instance.request(Endpoints.top_headlines, parameters: parameters, method: .get, type: [ArticlesModel].self, viewController: self, hasLoading: isLoading) { [self] (data) in
            success(data: data)
        }
    }
    
    private func success(data: BaseModel<[ArticlesModel]>?) {
        headLinesCViewItems.append(contentsOf: data?.data ?? [])
        headLinesCView.reloadData()
    }
}

