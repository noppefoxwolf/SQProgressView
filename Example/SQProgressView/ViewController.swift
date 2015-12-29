//
//  ViewController.swift
//  SQProgressView
//
//  Created by Tomoya Hirano on 12/28/2015.
//  Copyright (c) 2015 Tomoya Hirano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: SQProgressView!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let progress = Float(Float(arc4random()) / Float(UINT32_MAX))
        progressView.setProgress(progress, animated: false)
    }
}

