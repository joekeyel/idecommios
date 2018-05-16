//
//  dashboardpage.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 25/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit
import Firebase

class dashboardpage: UIViewController {
    
    @IBOutlet weak var currentdate: UIButton!
    
    
    @IBOutlet weak var totalsite: UIButton!
    
    
    @IBOutlet weak var completesite: UIButton!
    
    @IBOutlet weak var dismantling: UIButton!
    @IBOutlet weak var scrollview1: UIScrollView!
    
    @IBOutlet weak var balance: UIButton!
    @IBOutlet weak var lockin: UIButton!
    @IBOutlet weak var remaining: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set bar button item
        let btn1 = UIButton(type: .custom)
        btn1.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        btn1.addTarget(self, action: #selector(dashboardpage.logoutfirebase), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
   
        
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        
       fetch1()
//        fetch2()
//        fetch3()
//        fetch4()
//        fetch5()
//        fetch6()
//        fetch7()
        
       
          let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
         formatter.locale = Locale(identifier: "en_US")
        
        let result = formatter.string(from: date)
        currentdate.setTitle(result, for: .normal)
       self.title = "REALTIME IPMSAN DASHBOARD"
         self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Arial", size: 12)!]
        
        
        scrollview1.isDirectionalLockEnabled = true
      
      
    }
    
    @objc func logoutfirebase(){
        
        try! FIRAuth.auth()!.signOut()
    
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let initialViewController2 = storyboard.instantiateViewController(withIdentifier: "startpage") as! ViewController
            
            self.navigationController?.pushViewController(initialViewController2, animated: true)
            
            
        
        
    }

    func fetch1(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/decom_pstn.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["totalsite"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    var value2:String = ""
                    if  let summaryfromjson2  = json["completesite"] as? String{
                        
                        print(summaryfromjson2)
                        value2 = summaryfromjson2
                        
                    }
                    
                    var value3:String = ""
                    if  let summaryfromjson3  = json["inprogresssite"] as? String{
                        
                        print(summaryfromjson3)
                        value3 = summaryfromjson3
                        
                    }
                    
                    var value4:String = ""
                    if  let summaryfromjson4  = json["pendingsite"] as? String{
                        
                        print(summaryfromjson4)
                        value4 = summaryfromjson4
                        
                    }
                    
                    var value5:String = ""
                    if  let summaryfromjson5  = json["payment"] as? String{
                        
                        print(summaryfromjson5)
                        value5 = summaryfromjson5
                        
                    }
                    
                    var value6:String = ""
                    if  let summaryfromjson6  = json["payreceive"] as? String{
                        
                        print(summaryfromjson6)
                        value6 = summaryfromjson6
                        
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.totalsite.setTitle(value, for: .normal)
                        self.completesite.setTitle(value2, for: .normal)
                         self.dismantling.setTitle(value3, for: .normal)
                         self.remaining.setTitle(value4, for: .normal)
                         self.lockin.setTitle(value5, for: .normal)
                         self.balance.setTitle(value6, for: .normal)
                       
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    
    func fetch2(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_listmonitoring.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["total"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                       // self.migratedtext.setTitle(value, for: .normal)
                        
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    func fetch3(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20Dashboard_Yana/query_dashboard_header.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["totaltt"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    var value2:String = ""
                    if  let summaryfromjson2  = json["cabinetmonitor"] as? String{
                        
                        print(summaryfromjson2)
                        value2 = summaryfromjson2
                        
                    }
                    
                    
                    var value3:String = ""
                    if  let summaryfromjson3  = json["totalaging"] as? String{
                        
                        print(summaryfromjson3)
                        value3 = summaryfromjson3
                        
                    }
                    
                    DispatchQueue.main.async {
                        
                        //self.totaltttext.setTitle(value, for: .normal)
                        //self.monitoringsites.setTitle(value2, for: .normal)
                        
                        //self.activetttoday.setTitle(value3, for: .normal)
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }

    func fetch4(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_actual.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var actualsubb:String = ""
                    if  let summaryfromjson  = json["subb"] as? String{
                        
                        print(summaryfromjson)
                        actualsubb = summaryfromjson
                        
                    }
                    
                    var plansubbvalue:String = ""
                    if  let summaryfromjson  = json["plansubb"] as? String{
                        
                        print(summaryfromjson)
                        plansubbvalue = summaryfromjson
                        
                    }
                    
                    
                    var planfibervalue:String = ""
                    if  let summaryfromjson  = json["planfiber"] as? String{
                        
                        print(summaryfromjson)
                        planfibervalue = summaryfromjson
                        
                    }
                    
                    var actualfibervalue:String = ""
                    if  let summaryfromjson  = json["fiber"] as? String{
                        
                        print(summaryfromjson)
                        actualfibervalue = summaryfromjson
                        
                    }
                    
                    
                    var actualcolovalue:String = ""
                    if  let summaryfromjson  = json["colo"] as? String{
                        
                        print(summaryfromjson)
                        actualcolovalue = summaryfromjson
                        
                    }
                    
                    
                    var plancolovalue:String = ""
                    if  let summaryfromjson  = json["plancolo"] as? String{
                        
                        print(summaryfromjson)
                        plancolovalue = summaryfromjson
                        
                    }
                    
                    DispatchQueue.main.async {
                        
                      
                        //self.plancolo.setTitle(plancolovalue, for: .normal)
                        
                        
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    func fetch5(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_balancesubb.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["countsubb"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                       // self.subbbalance.setTitle(value, for: .normal)
                        
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }

    
    func fetch6(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_balancecolo.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["countcolo"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                       // self.colobalance.setTitle(value, for: .normal)
                        
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    func fetch7(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_balancefiber.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["countfiber"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                        //self.fiberbalance.setTitle(value, for: .normal)
                        
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x>0 {
            scrollView.contentOffset.x = 0
        }
    }
    
    func fetch8(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/Dashboard_json.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["totalplan"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                        //self.todayplan.setTitle(value, for: .normal)
                        
                    }
                    
                }
                    
                    
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
                
                
            else if let error = error {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    
    @IBAction func reloadbutton(_ sender: Any) {
        
//        fetch1()
//        fetch2()
//        fetch3()
//        fetch4()
//        fetch5()
//        fetch6()
//        fetch7()
//
        
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")
        
        let result = formatter.string(from: date)
        currentdate.setTitle(result, for: .normal)
        self.title = "PSTN DECOMM 2018"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Arial", size: 12)!]
        
    }
    
    @IBAction func totalsiteaction(_ sender: Any) {
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "totalsites") as! totalsites
        
        myVC.section = "listtotalstatesite"
        myVC.statestr = "totalstate"
    
        
        navigationController?.pushViewController(myVC, animated: true)
    }
    
  
    @IBAction func completesite(_ sender: Any) {
        
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "totalsites") as! totalsites
        
        myVC.section = "listcompletestatesite"
           myVC.statestr = "count(STATE)"
        
        
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
    
    @IBAction func dismantlingaction(_ sender: Any) {
        
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "totalsites") as! totalsites
        
        myVC.section = "listinprogressstatesite"
          myVC.statestr = "count(STATE)"
        
        
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
    @IBAction func remainingaction(_ sender: Any) {
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "totalsites") as! totalsites
        
        myVC.section = "listpendingstatesite"
          myVC.statestr = "count(STATE)"
        
        
        navigationController?.pushViewController(myVC, animated: true)
        
    }
}
