//
//  NotificationViewController.swift
//  CusntomNotification
//
//  Created by 姬友大人 on 2018/9/13.
//  Copyright © 2018年 好无聊的一生啊. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

//https://www.jianshu.com/p/5713fa2bfece

/// 自定义通知 自定义本地通知
class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didReceive(_ notification: UNNotification) {
        labelName.text = notification.request.content.title;
        labelMessage.text = notification.request.content.body;
        guard let u = notification.request.content.attachments.first?.url,
            let d = try? Data(contentsOf: u) else {
            return
        }
        let i = UIImage(data: d)
        imageViewIcon.image = i
    }
    
}
