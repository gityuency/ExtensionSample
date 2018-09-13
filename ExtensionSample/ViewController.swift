//
//  ViewController.swift
//  ExtensionSample
//
//  Created by 姬友大人 on 2018/9/12.
//  Copyright © 2018年 好无聊的一生啊. All rights reserved.
//

import UIKit

/// cell 重用标示
let cellid = "shilidaima"

class ViewController: UIViewController {

    //MARK: - 属性组
    let tableView = UITableView()
    
    let listArray = [
        ["iOS10UserNotificationViewController": "iOS 10 新特性 本地通知"],
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置页面
        setUpView()
        
    }
    
    /// 设置页面
    private func setUpView() {
        self.title = "研究各种Extension"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}




// MARK: - 实现表格的协议方法
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: -  数据源
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        
        //使用字典的值作为标题
        cell.textLabel?.text = "\(indexPath.row): \(Array(listArray[indexPath.row].values)[0])"
        return cell
    }
    
    //MARK: - 事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //因为字典的 key 就是将要 push 进来的控制器的名字
        let vcName = Array(listArray[indexPath.row].keys)[0]
        
        //把这个 key 转换成为类 需要加上命名空间前缀,否则不生效
        if let cls = NSClassFromString(Bundle.main.nameSpaceStirng + "." + vcName) as? UIViewController.Type {
            let vc = cls.init()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}


// MARK: - Bunle 扩展
extension Bundle {
    
    /// 获取命名空间
    var nameSpaceStirng: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}

