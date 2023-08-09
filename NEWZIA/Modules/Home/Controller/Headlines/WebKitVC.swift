//
//  WebKitVC.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit
import WebKit

class WebKitVC: UIViewController, WKNavigationDelegate, UITextFieldDelegate {

    // MARK: - IBOutlets.
    @IBOutlet weak var webKit: WKWebView!
    @IBOutlet weak var rateField: UITextField!
    
    // MARK: - Private Variables.
    var headLineURL: String?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rateField.delegate = self
        setupUI()
    }
    
    // MARK: - Private Functions.
    private func setupUI() {
        setupWebKit(headLineURL)
    }
    
    private func setupWebKit(_ url: String?) {
        webKit.navigationDelegate = self
        
        if let url {
            let headLineURL = URL(string: url)!
            DispatchQueue.main.async { [self] in
                webKit.load(URLRequest(url: headLineURL))
            }
            webKit.allowsBackForwardNavigationGestures = true
        } else {
            swiftMessage(title: "Error", body: "This Url Not Founded", color: .error, layout: .centeredView, style: .center)
        }
    }
    
    // MARK: -  UITextFieldDelegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // MARK: -  Validate the rating input when the save button is tapped
    @IBAction func didTapSaveBtn(_ sender: Any) {
        guard let ratingText = rateField.text ,
                let rating = Int(ratingText) ,
              (1...5).contains(rating) else {
            showAlert(with: "Invalid Rating", message: "Please enter a valid rating between 1 and 5")
            return
        }
        DispatchQueue.main.async {
            self.showAlert(with: "Rating successful", message: "Thank you for rating the article!")
        }
        
    }
    // MARK: -  Alert function
    private func showAlert(with title : String, message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
}
