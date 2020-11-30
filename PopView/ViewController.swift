//
//  ViewController.swift
//  PopView
//
//  Created by Limin on 2020/11/30.
//  Copyright © 2020 Limin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button: UIButton = UIButton(type: .contactAdd)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        button.setTitle("按钮", for: .normal)
        button.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
        self.view .addSubview(button)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonSelected(){
        modalPopView(PopViewType.left)
    }
    
    
    let animationDelegate = PopoverAnimation()
    
    func modalPopView(_ type:PopViewType){
        let popVc = PopViewController()
        popVc.popType = type
        popVc.transitioningDelegate = animationDelegate
        animationDelegate.popViewType = type
        popVc.modalPresentationStyle = UIModalPresentationStyle.custom
        popVc.selectDelegate = self
//        popVc.
        present(popVc, animated: true, completion: nil)
    }

}

extension ViewController: DidSelectPopViewCellDelegate{
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        print("点击了\(indexPath.row)")
    }
}

