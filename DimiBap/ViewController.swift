//
//  ViewController.swift
//  DimiBap
//
//  Created by Hoseong Son on 2015. 11. 16..
//  Copyright © 2015년 Hoseong Son. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.stringFromDate(date)
        
        if let doc = Kanna.HTML(html: html, encoding: NSUTF8StringEncoding) {
            println(doc.title)
            
            // Search for nodes by CSS
            for link in doc.css("a, link") {
                println(link.text)
                println(link["href"])
            }
            
            // Search for nodes by XPath
            for link in doc.xpath("//a | //link") {
                println(link.text)
                println(link["href"])
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

