//
//  UIViewController+Extension.swift
//  我撩
//
//  Created by jgh on 16/8/9.
//  Copyright © 2016年 jgh. All rights reserved.
//

import UIKit

extension UIViewController: UIPopoverPresentationControllerDelegate{
    func adds(sender: UIView) {
        let storyboard : UIStoryboard = UIStoryboard(name: "NavigationBar", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopoverViewController")
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender as UIView
        vc.popoverPresentationController?.sourceRect = sender.bounds
        vc.preferredContentSize = CGSize(width: 160, height: 200)
        
        self.present(vc, animated: true, completion:nil)
        
    }
    
    // MARK: - popDelegate
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
