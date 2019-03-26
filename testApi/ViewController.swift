//
//  ViewController.swift
//  ConnectAPIs
//
//  Created by Admin on 26/3/2562 BE.
//  Copyright © 2562 devkmutnbA. All rights reserved.
//

import UIKit
struct ExchageRate: Decodable{
    let base: String
    let date: String
    let rates: dd
}
struct dd: Decodable{
    let BGN: Double
}
class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    //var arrdata = [ExchageRate]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    func getdata(){
        let jsonUrlString = "https://api.exchangeratesapi.io/latest?base=THB"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, responds,err) in
            guard let data = data else {return}
                do {
                    let exchangeList = try JSONDecoder().decode(ExchageRate.self, from: data)
                    print(exchangeList.base,": ",exchangeList.date,": ",exchangeList.rates)
                } catch let jsonErr {
                        print("Error serializing json", jsonErr)
            }
        }.resume()
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.arrdata.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
//
//        let fruitName = fruitsData[indexPath.row]
//        cell.textLabel?.text = fruitName
//        cell.detailTextLabel?.text = "Fruit..!"
//        //cell.imageView?.image = UIImage(named: fruitName)
//        return cell
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//        cell.lblname.text = "Name : \(arrdata[indexPath.row].name)"
//        cell.lblcapital.text = "Capital : \(arrdata[indexPath.row].capital)"
//        return cell
//    }
}
