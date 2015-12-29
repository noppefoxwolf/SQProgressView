//
//  SQProgressView.swift
//  SQProgressViewDemo
//
//  Created by Tomoya Hirano on 2015/12/28.
//  Copyright © 2015年 Tomoya Hirano. All rights reserved.
//

import UIKit

class SQProgressView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    var progressTintColor:UIColor? = UIColor.lightGrayColor(){
        willSet{
            progressView.backgroundColor = self.progressTintColor
        }
    }
    var trackTintColor:UIColor? = UIColor.blueColor(){
        willSet{
            trackView.backgroundColor = self.trackTintColor
        }
    }
    func setProgress(var progress: Float, animated: Bool,completion:((Bool)->Void)?=nil){
        progress = progress > 1 ? 1 : progress
        progress = progress < 0 ? 0 : progress
        let after = {
            self.trackView.frame = CGRectMake(
                0,
                0,
                self.bounds.width * CGFloat(progress),
                self.bounds.height)
        }
        if animated {
            UIView.animateWithDuration(0.2,
                delay: 0,
                options: [.AllowAnimatedContent,.AllowUserInteraction],
                animations: { () -> Void in
                    after()
                }, completion: { (finish) -> Void in
                    self.progress = progress
                    completion?(finish)
            })
        }else{
            after()
            self.progress = progress
            completion?(true)
        }
    }
    
    private var progress:Float = 0.5
    private var trackView = UIImageView()
    private var progressView = UIImageView()
    private func setup(){
        backgroundColor = UIColor.clearColor()
        addSubview(progressView)
        progressView.addSubview(trackView)
        progressView.backgroundColor = self.progressTintColor
        trackView.backgroundColor = self.trackTintColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        progressView.frame = bounds
        setProgress(progress, animated: false)
    }
}
