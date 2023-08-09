//
//  GetStartedVC.swift
//  NEWZIA
//
//  Created by Mina on 02/08/2023.
//

import UIKit

class GetStartedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStartedAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: Constants.StoryBoardNames.home, bundle: nil).instantiateViewController(withIdentifier: Constants.VCIdentifier.tabbar)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
}

