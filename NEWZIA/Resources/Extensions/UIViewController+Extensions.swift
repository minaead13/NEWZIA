//
//  UIViewController+Extensions.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import Foundation
import UIKit
import SwiftMessages

extension UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    @available(iOS 13.0, *)
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
    }
    
    var window: UIWindow? {
        if #available(iOS 13, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
            return window
        }
        //guard let delegate = UIApplication.shared.delegate as? AppDelegate, let window = delegate.window else { return nil }
        return self.window
    }
    
    func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
    
    
    func swiftMessage(title: String, body: String, color: Theme, layout: MessageView.Layout, style: SwiftMessages.PresentationStyle) {
        let view = MessageView.viewFromNib(layout: layout)
        view.configureTheme(color)
        view.configureDropShadow()
        view.configureContent(title: title, body: body)
        view.button?.isHidden = true
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = style
        config.dimMode = .gray(interactive: true)
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .forever
        SwiftMessages.show(config: config, view: view)
    }
    
    func getRootVC()-> UIViewController {
        let viewController = window?.topViewController()
        return viewController!
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
