//
//  dashboardpage.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 25/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class dashboardpage: UIViewController {
    
    
    @IBOutlet weak var colobalance: UIButton!
    @IBOutlet weak var fiberbalance: UIButton!
    @IBOutlet weak var subbbalance: UIButton!
    @IBOutlet weak var actualcolo: UIButton!
    @IBOutlet weak var plancolo: UIButton!
    @IBOutlet weak var actualfiber: UIButton!
    @IBOutlet weak var planfiber: UIButton!
    @IBOutlet weak var actualsubb: UIButton!
    @IBOutlet weak var plansubb: UIButton!
    @IBOutlet weak var handedover: UIButton!
    
    @IBOutlet weak var activetttoday: UIButton!
    @IBOutlet weak var monitoringsites: UIButton!
    @IBOutlet weak var todayplan: UIButton!
    @IBOutlet weak var totaltttext: UIButton!
    @IBOutlet weak var migratedtext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch1()
        fetch2()
        fetch3()
        fetch4()
        fetch5()
        fetch6()
        fetch7()
      
    }

    func fetch1(){
        
        
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_handover.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    
                    var value:String = ""
                    if  let summaryfromjson  = json["handover"] as? String{
                        
                        print(summaryfromjson)
                        value = summaryfromjson
                        
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                        self.handedover.setTitle(value, for: .normal)
                       
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
                        
                        self.migratedtext.setTitle(value, for: .normal)
                        
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
                        
                        self.totaltttext.setTitle(value, for: .normal)
                        self.monitoringsites.setTitle(value2, for: .normal)
                        
                        self.activetttoday.setTitle(value3, for: .normal)
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
                        
                        self.actualsubb.setTitle(actualsubb, for: .normal)
                        self.plansubb.setTitle(plansubbvalue, for: .normal)
                        self.planfiber.setTitle(planfibervalue, for: .normal)
                        self.actualfiber.setTitle(actualfibervalue, for: .normal)
                        self.actualcolo.setTitle(actualcolovalue, for: .normal)
                        self.plancolo.setTitle(plancolovalue, for: .normal)
                        
                        
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
                        
                        self.subbbalance.setTitle(value, for: .normal)
                        
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
                        
                        self.colobalance.setTitle(value, for: .normal)
                        
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
                        
                        self.fiberbalance.setTitle(value, for: .normal)
                        
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
                        
                        self.todayplan.setTitle(value, for: .normal)
                        
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
}
