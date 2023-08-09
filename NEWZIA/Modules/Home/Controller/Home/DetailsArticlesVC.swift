//
//  DetailsArticlesVC.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit
import SDWebImage
import SafariServices

class DetailsArticlesVC: UIViewController {


    // MARK: - IBOutlets.
    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var titleArticleLabel: UILabel!
    @IBOutlet weak var sourceArticleLabel: UILabel!
    @IBOutlet weak var descriptionArticleLabel: UILabel!
    @IBOutlet weak var contentArticleLabel: UILabel!
    @IBOutlet weak var authorArticleLabel: UILabel!
    @IBOutlet weak var timeArticleLabel: UILabel!
    
    // MARK: - Private Variables.
    var articleItem: ArticlesModel?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArticleData(with: articleItem)
    }
    
    // MARK: - Private Functions.
    private func fillArticleData(with item: ArticlesModel?) {
        guard let item, let source = item.source else { return }
        
        if let imageURL = item.urlToImage {
            let url = URL(string: imageURL )
            imageArticle.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            imageArticle.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions(rawValue: 0), completed: nil)
        }
        
        titleArticleLabel.text = item.title.orEmpty
        sourceArticleLabel.text = source.name.orEmpty
        descriptionArticleLabel.text = item.description.orEmpty
        contentArticleLabel.text = item.content.orEmpty.htmlToString
        authorArticleLabel.text = item.author.orEmpty
        timeArticleLabel.text = item.publishedAt.orEmpty
        
    }
    
    @IBAction func articleWebSiteAction(_ sender: UIButton) {
        
        guard let articleItem else { return }
        
        let urlString = articleItem.url.orEmpty

        if let url = URL(string: urlString) {
               let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true
               let vc = SFSafariViewController(url: url, configuration: config)
               present(vc, animated: true)
           }
    }
}

extension DetailsArticlesVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}


