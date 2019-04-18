//
//  ExtensionUivew.swift
//  Easy Anchor Auto Layout
//
//  Created by hosam on 12/26/18.
//  Copyright © 2018 hosam. All rights reserved.
//

import UIKit

extension UIView{
    
    func fillSuperview()  {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, trialing: superview?.trailingAnchor, bottom: superview?.bottomAnchor)
    }
    
    func anchorSize(to view:UIView)  {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func anchor(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,trialing:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,padding:UIEdgeInsets = .zero,size:CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trialing = trialing {
            trailingAnchor.constraint(equalTo: trialing, constant: -padding.right).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: .alignAllCenterX, metrics: nil, views: viewsDictionary))
    }
}
extension UIColor{
    convenience  init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
