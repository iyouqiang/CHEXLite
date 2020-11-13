

//
//  FCImageViewConvenience.swift
//  FlyCatAdministration
//
//  Created by Frank on 2018/9/10.
//  Copyright © 2018年 Yochi. All rights reserved.
//

import Foundation


public func fc_imageViewInit(imageName : String) -> UIImageView {
    
    return UIImageView.init(image: UIImage.init(named: imageName))
}

public func fc_filletImageView(frame: CGRect, cornerRadius: CGFloat, borderWidth: CGFloat, strokeColor: UIColor, fillColor: UIColor) -> UIImageView {
    
    let view = UIImageView.init(frame: frame)
    let size = frame.size
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    let p = UIBezierPath.init(roundedRect: CGRect.init(x: borderWidth, y: borderWidth, width: size.width - borderWidth*2, height: size.height - borderWidth*2), cornerRadius: cornerRadius)
    fillColor.setFill()
    p.fill()
    
    if borderWidth > 0 {
        
        strokeColor.setStroke()
        p.lineWidth = borderWidth
        p.stroke()
    }
    
    let im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    view.layer.contents = im?.cgImage
    
    return view
}

