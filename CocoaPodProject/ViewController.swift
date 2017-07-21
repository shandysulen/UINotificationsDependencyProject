//
//  ViewController.swift
//  CocoaPodProject
//
//  Created by Shandy Sulen on 7/20/17.
//  Copyright © 2017 Shandy Sulen. All rights reserved.
//

import UIKit
import UINotifications

class ViewController: UIViewController {
    
    let successButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Success", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(showNotification(_:)), for: .touchUpInside)
        return button
    }()
    
    let failureButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Failure", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(showNotification(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func showNotification(_ sender: UIButton) {
        let content = UINotificationContent(title: "Welcome to my app", chevronImage: UIImage(named: "MyChevron"))
        
        var notification: UINotification
        
        if sender == successButton {
            notification = UINotification(content: content, style: NotificationView.CustomNotificationStyle.success)
        }
        else {
            notification = UINotification(content: content, style: NotificationView.CustomNotificationStyle.failure)
        }
        
        UINotificationCenter.current.notificationViewType = NotificationView.self
        
        
        let dismissTrigger = UINotificationDurationDismissTrigger(duration: 3.0)
        UINotificationCenter.current.show(notification: notification, dismissTrigger: dismissTrigger)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonStackView = UIStackView(arrangedSubviews: [successButton, failureButton])
        for i in 0..<10 {
            let label = UILabel()
            label.textColor = .black
            label.text = "Label \(i)"
            buttonStackView.addArrangedSubview(label)
        }
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.alignment = UIStackViewAlignment.fill
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(buttonStackView)
        
        let leadingConstraint = NSLayoutConstraint(item: buttonStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        
        let topConstraint = NSLayoutConstraint(item: buttonStackView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20)
        
        let trailingConstraint = NSLayoutConstraint(item: buttonStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        
        let bottomConstraint = NSLayoutConstraint(item: buttonStackView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -20)
        
        view.addConstraints([leadingConstraint, topConstraint, trailingConstraint, bottomConstraint])

    }

}

