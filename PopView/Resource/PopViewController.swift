//
//  PopViewController.swift
//  PopView
//
//  Created by Limin on 20/11/30.
//  Copyright © 2020年 Limin. All rights reserved.
//

import UIKit

enum PopViewType{
    case left
    case center
    case right
}

//TODO cell的高度，可以暴露出去
let RowHeight:CGFloat = 44

//TODO 数据源，可以暴露出去
var dataSource = ["发布","扫一扫","添加好友"]

/**
 *  popView展现位置的代理
 */
protocol PopViewControllerDelegate:NSObjectProtocol{
    func didClickedPopButton(_ type:PopViewType)
}

/**
 *  popViewCell选择的代理
 */
protocol DidSelectPopViewCellDelegate:NSObjectProtocol{
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
}

class PopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myTableView = UITableView()
    
    var popType:PopViewType?
    
    weak var delegate:PopViewControllerDelegate?
    
    weak var selectDelegate:DidSelectPopViewCellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews(popType!)
    }
    
    func setupViews(_ popViewtype:PopViewType) {
        myTableView.frame = CGRect(x: 10, y: 17, width: 110, height: Int(RowHeight) * dataSource.count)
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
    }

}

extension PopViewController{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return dataSource.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectDelegate?.didSelectRowAtIndexPath(indexPath)
    }

}
