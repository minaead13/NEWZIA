//
//  LoadingCViewCell.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit

class LoadingCViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuraCell() {
        activityIndicator.startAnimating()
    }

}
