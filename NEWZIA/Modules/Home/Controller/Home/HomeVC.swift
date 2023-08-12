//
//  HomeVC.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - IBOutlets.
    @IBOutlet weak var searchArticlesBar: UISearchBar!
    @IBOutlet weak var articlesTView: UITableView!
    
    // MARK: - Private Variables.
    private var articlesTViewItems = [ArticlesModel]()
    private var from_page = 1
    private var to_page = 5
    
    private var searchText: String?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.dismissKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Private Functions.
    private func setupUI() {
        setupTableView()
        setupSearchBar()
    }
    private func setupTableView() {
        articlesTView.delegate = self
        articlesTView.dataSource = self
        articlesTView.registerTVCell(cellClass: ArticlesTViewCell.self)
        articlesTView.registerTVCell(cellClass: LoadingTViewCell.self)
    }
    
    private func setupSearchBar() {
        searchArticlesBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate.
extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            searchText = text
            getArticles(by: text)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            articlesTViewItems.removeAll()
            articlesTView.reloadData()
        }
    }
}

// MARK: - UICollectionView Delegate & DataSource.
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if articlesTViewItems.count == 0 {
            articlesTView.setEmptyMessage()
        } else {
            articlesTView.backgroundView = nil
        }
        
        return articlesTViewItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueTVCell() as ArticlesTViewCell
       // let loadingCell = tableView.dequeueTVCell() as LoadingTViewCell
        
        let item = articlesTViewItems[indexPath.row]
        articleCell.selectionStyle = .none
        
//        if from_page < to_page && indexPath.row == articlesTViewItems.count - 1 {
//            loadingCell.configuraCell()
//            return loadingCell
//        }
            
        articleCell.configureCell(with: item)
        
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = articlesTViewItems[indexPath.row]
        let vc = UIStoryboard(name: Constants.StoryBoardNames.home, bundle: nil).instantiateViewController(withIdentifier: Constants.VCIdentifier.detailsArticleVC) as! DetailsArticlesVC
        vc.articleItem = item
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        if from_page < to_page && indexPath.row == articlesTViewItems.count - 1 {
//            from_page += 1
//            if let searchText {
//                getArticles(by: searchText, page: from_page, isLoading: false)
//            }
//
//        }
//    }
}

// MARK: - APi.
extension HomeVC {
    func getArticles(by searchText: String, page: Int = 1, isLoading: Bool = true) {
        let parameters = [
            "q": searchText,
            "page": page
        ] as [String : Any]
        
        NetworkManager.instance.request(Endpoints.everything, parameters: parameters, method: .get, type: [ArticlesModel].self, viewController: self, hasLoading: isLoading) { [self] (data) in
            success(data: data)
        }
    }
    
    private func success(data: BaseModel<[ArticlesModel]>?) {
        articlesTViewItems.append(contentsOf: data?.data ?? [])
        articlesTView.reloadData()
        view.endEditing(true)
    }
}

