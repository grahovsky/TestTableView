//
//  ViewController.swift
//  testTableView
//
//  Created by Konstantin on 29/09/2018.
//  Copyright © 2018 Konstantin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
        let cellNib = UINib(nibName: "CellTwo", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CellTwo")
        
        loadData()
    }
    
    func loadData() {
        
        // load from internet 5 sec
        items = ["Kkk", "bbb"]
        tableView.reloadData()
        
    }
}


// MARK: - Table view
extension ViewController: UITableViewDelegate, UITableViewDataSource {

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwo") as! CellTwo
        
//        let text = "Cell section \(indexPath.section), row \(indexPath.row)"
//        cell.textLabel?.text = text
//        cell.detailTextLabel?.text = "Date: \(Date().timeIntervalSince1970)"
        
        let item = items[indexPath.row]
        cell.label.text = item
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return "Section \(section)"
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
//        self.show(UIViewController(), sender: nil)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return CGFloat(80)
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        
        if section == 0 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.blue
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(100)
    }
}






