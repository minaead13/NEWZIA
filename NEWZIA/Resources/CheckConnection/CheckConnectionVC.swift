//
//  CheckConnectionVC.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit
import Lottie

class CheckConnectionVC: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupAnimation()
    }
    
    private func setupAnimation() {
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 2
        animationView.play()
    }

    // MARK: - IBAction
    @IBAction func tryAgainAction(_ sender: Any) {
        let vc = UIStoryboard(name: Constants.StoryBoardNames.main, bundle: nil).instantiateViewController(withIdentifier: Constants.VCIdentifier.getStartedVC)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}
