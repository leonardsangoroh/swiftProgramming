//
//  ViewController.swift
//  Project1
//
//  Created by Lee Sangoroh on 23/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()

    //Called when the screen is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    }


}

