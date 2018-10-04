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
    var images = [UIImage]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actitvityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
        self.title = "10 url random"
        
        let cellNib = UINib(nibName: "CellTwo", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CellTwo")
        
        
        actitvityIndicator.hidesWhenStopped = true
        actitvityIndicator.color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        //loadData()
        loadDataFromInet()
        
    }
    
    func loadData() {
        
        actitvityIndicator.hidesWhenStopped = true
        actitvityIndicator.color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        actitvityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        var i = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            if i == 30 {
                
                // load from internet 5 sec
                self.items = ["Kkk", "bbb"]
                self.tableView.reloadData()
                
                self.actitvityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                Timer.invalidate()
            }
            i += 1
        }
        
    }
    
    func loadDataFromInet() {
        
        var urlAdress = [String]()
        
        urlAdress.append("https://zabavnik.club/wp-content/uploads/boss_molokosos_41_13101726.jpg")
        urlAdress.append("https://static.365info.kz/uploads/2017/10/98d04e031b154f30f3e2cf2e18330399.jpg")
        urlAdress.append("https://cs1.livemaster.ru/storage/84/66/9d167e528249d6784b0bf78b0bqd--kukly-i-igrushki-sinij-kot-fentezi-kotik-podvizhnaya-igrushka.jpg")
        urlAdress.append("http://www.mixnews.lv/uploads/mixer/images/2016/10/13/rnyit1h_webmixerdetailed_jpg.jpg")
        urlAdress.append("https://www.freelancinggig.com/blog/wp-content/uploads/2017/01/ios-vs-android.jpeg")
        urlAdress.append("http://www.mobi-city.ru/wallpaper/image/nature_20_240x320.jpg")
        urlAdress.append("http://www.mobi-city.ru/wallpaper/image/nature_8_240x320.jpg")
        urlAdress.append("http://www.mobi-city.ru/wallpaper/image/nature_18_240x320.jpg")
        urlAdress.append("http://www.mobi-city.ru/wallpaper/image/nature_15_240x320.jpg")
        urlAdress.append("http://www.mobi-city.ru/wallpaper/image/nature_53_240x320.jpg")
        
        
        DispatchQueue.global().async {
            
            for urlAdressItem in urlAdress {
                
                //self.actitvityIndicator.startAnimating()
                
                let url = URL(string: urlAdressItem)
                
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                
                guard data != nil else { break }
                
                DispatchQueue.main.async {
                    self.items.append(urlAdressItem)
                    self.images.append(UIImage(data: data!)!)
                    self.tableView.reloadData()
                }
            
                //self.actitvityIndicator.stopAnimating()
            }
            
        }
    }
    
}


// MARK: - Table view
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
        
        if images.count > indexPath.row {
            let image = images[indexPath.row]
            cell.imageForLabel.image = image
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section) 10 url random"
    }
    
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
            view.backgroundColor = #colorLiteral(red: 0.8088468592, green: 0.3915059066, blue: 1, alpha: 1)
        } else {
            view.backgroundColor = UIColor.blue
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(100)
    }
}






