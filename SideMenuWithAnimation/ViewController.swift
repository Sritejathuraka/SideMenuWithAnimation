//
//  ViewController.swift
//  SideMenuWithAnimation
//
//  Created by Sriteja Thuraka on 4/25/18.
//  Copyright © 2018 Sriteja Thuraka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    @IBOutlet weak var viewLeadingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewLeadingConstraint.constant = -175
        
    }
    @IBAction func sideMenuAction(_ sender: Any) {
        if viewLeadingConstraint.constant < 20 {
            UIView.animate(withDuration: 0.2, animations: {
                self.viewLeadingConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }

    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translate = sender.translation(in: self.view).x
            if translate > 0 {
                if viewLeadingConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewLeadingConstraint.constant += translate / 10
                        self.view.layoutIfNeeded()
                        })
                }
            } else {
                if viewLeadingConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewLeadingConstraint.constant += translate / 10
                        self.view.layoutIfNeeded()
                    })
                }

            }
        } else if sender.state == .ended {
            if viewLeadingConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewLeadingConstraint.constant = -175
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewLeadingConstraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }

        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

