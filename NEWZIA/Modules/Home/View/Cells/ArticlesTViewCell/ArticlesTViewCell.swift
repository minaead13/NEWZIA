//
//  ArticlesTViewCell.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit
import SDWebImage

class ArticlesTViewCell: UITableViewCell {
    
    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var titleArticleLabel: UILabel!
    @IBOutlet weak var authorArticleLabel: UILabel!
    @IBOutlet weak var timeArticleLabel: UILabel!
    @IBOutlet weak var descriptionArticleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with item: ArticlesModel?) {
        guard let item else { return }
        
        if let imageURL = item.urlToImage {
            let url = URL(string: imageURL )
            imageArticle.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            imageArticle.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions(rawValue: 0), completed: nil)
        }
        
        titleArticleLabel.text = item.title.orEmpty
        authorArticleLabel.text = "Author: \(item.author.orEmpty)"
        timeArticleLabel.text = item.publishedAt.orEmpty
        descriptionArticleLabel.text = item.description.orEmpty
    }
    
    
}
