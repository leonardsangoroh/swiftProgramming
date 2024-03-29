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
        
        //Setting Navbar Title
        title = "Storm Viewer"
        //Setting the title to Large
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.global().async {
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!
            let items = try! fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                if item.hasPrefix("nssl") {
                    self.pictures.append(item)
                }
            }
            //sorting picture names in ascending order
            self.pictures = self.pictures.sorted()
            print(self.pictures)
        }

    }
    
    //How many rows should appear at the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //What each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Making the cells reusable
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for:indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        //Changing the text color
        cell.textLabel?.textColor = .red
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                                                                               //typecasting
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
            vc.position = indexPath.row + 1
            vc.total = pictures.count
        }
    }


}

