//
//  ViewController.swift
//  DrawingInSwift
//
//  Created by NEXTAcademy on 2/13/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearnButtonTapped(_ sender: Any) {
        drawView.lines = []
        drawView.setNeedsDisplay()
    }

}

