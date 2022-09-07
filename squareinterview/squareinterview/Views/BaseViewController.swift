//
//  BaseViewController.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
    var activityView: UIActivityIndicatorView?
    
    func showProgressBar(_ show: Bool = true){
        if show{
            self.activityView = UIActivityIndicatorView()
            self.activityView?.center = self.view.center
            self.view.addSubview(activityView!)
            self.activityView?.startAnimating()
        }else{
            self.activityView?.stopAnimating()
        }
        
    }
    
    func showAlert(_ title: String, _ msg: String, completion: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        // Cancel action
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
