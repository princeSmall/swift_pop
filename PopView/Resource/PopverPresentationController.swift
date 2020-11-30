//
//  PopverPresentationController.swift
//  PopView
//
//  Created by Limin on 20/11/30.
//  Copyright (c) 2020年 Limin. All rights reserved.
//

import UIKit

enum PopViewFrame{
    case left
    case center
    case right
}

// TODO修改位置的地方
var popViewY : CGFloat = 165.0
var popViewX : CGFloat = 30

var mainScreenWidth = UIScreen.main.bounds.size.width
var popViewWidth : CGFloat = 100.0
var popViewHeight : CGFloat = 150.0

class PopverPresentationController: UIPresentationController {
    /// 展现视图的大小
    var presentedFrame: CGRect = CGRect.zero
    
   internal var popViewFrame:PopViewType?
    
    lazy var coverView: UIView = {

        let v = UIView()
        // TODO设置遮罩透明度，点击方法
        v.backgroundColor = UIColor.lightGray
        v.alpha = 0.3
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopverPresentationController.didClickedCoverView))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    
    /**
    点击遮罩
    */
    @objc internal func didClickedCoverView(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    // 构造方法
 override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        var rect:CGRect?
       
//        TODO判断是否是iPhone X，增加safeArea
        if UIDevice.current.isiPhoneX() {
            popViewY = 180
        }
        rect = CGRect(x: popViewX, y: popViewY, width: popViewWidth, height: popViewHeight)
        presentedView!.frame = rect!
        
        // 设置遮罩的frame
        coverView.frame = containerView!.bounds
        containerView! .insertSubview(coverView, at: 0)
    }
}

extension UIDevice {
    public func isiPhoneX() -> Bool {
        let screenHeight = UIScreen.main.nativeBounds.size.height;
        if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
            return true
        }
        return false
    }
}
