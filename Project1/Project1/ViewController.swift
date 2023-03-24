//
//  ViewController.swift
//  Project1
//
//  Created by Lee Sangoroh on 23/03/2023.
//

import UIKit

//Create a new screen, ViewController, and have it built on UITableViewController
class ViewController: UITableViewController {
    
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
    
    //How many rows should appear at the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //What each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for:indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }


}

