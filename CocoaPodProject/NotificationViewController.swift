//
//  NotificationViewController.swift
//  CocoaPodProject
//
//  Created by Shandy Sulen on 7/20/17.
//  Copyright © 2017 Shandy Sulen. All rights reserved.
//

import UIKit
import UINotifications

class NotificationView: UINotificationView {

    enum CustomNotificationStyle: UINotificationStyle {
        case success
        case failure
        
        var font: UIFont {
            switch self {
            case .success:
                return UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)
            case .failure:
                return UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular)
            }
            
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .success:
                return UIColor.blue
            case .failure:
                return UIColor.red
            }
            
        }
        
        var textColor: UIColor {
            return UIColor.white
        }
        
        /// The height of the notification which applies on the notification view.
        var height: UINotificationHeight {
            switch self {
            case .success:
                return UINotificationHeight.custom(height: CGFloat(100))
            case .failure:
                return UINotificationHeight.statusBar
            }
        }
        
        /// When `true`, the notification is swipeable and tappable.
        var interactive: Bool {
            return true
        }
    }

}
