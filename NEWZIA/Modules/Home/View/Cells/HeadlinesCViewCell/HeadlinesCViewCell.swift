//
//  HeadlinesCViewCell.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit
import SDWebImage

class HeadlinesCViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageHeadlines: UIImageView!
    @IBOutlet weak var titleHeadlinesLabel: UILabel!
    @IBOutlet weak var authorHeadlinesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with item: ArticlesModel?) {
        guard let item else { return }
        
        if let imageURL = item.urlToImage {
            let url = URL(string: imageURL )
            imageHeadlines.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            imageHeadlines.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions(rawValue: 0), completed: nil)
        }
        
        titleHeadlinesLabel.text = item.title.orEmpty
        authorHeadlinesLabel.text = "Author: \(item.author.orEmpty)"
        
    }
}
