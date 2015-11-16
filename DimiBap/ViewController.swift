//
//  ViewController.swift
//  DimiBap
//
//  Created by Hoseong Son on 2015. 11. 16..
//  Copyright © 2015년 Hoseong Son. All rights reserved.
//

import UIKit
import Kanna
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var label : UILabel?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.stringFromDate(date)
        
        let html = Alamofire.request(.GET, "http://dimigo.in/pages/dimibob_getdata.php?d=20151116").responseString {
            response in
                let transform = "Any-Hex/Java"
                let i = response.result.value! as NSString
                let convertedString = i.mutableCopy() as! NSMutableString
            
                CFStringTransform(convertedString, nil, transform as NSString, true)
            
                print("convertedString: \(convertedString)")
            
                self.label!.text = "\(convertedString)"

        }
        
        print (html)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

