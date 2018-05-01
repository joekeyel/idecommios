//
//  fiberbalancecontroller.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 01/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class fiberbalancecontroller: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
  
    

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var fiberbalancetable: UITableView!
    
    var listsubbobject:[fiberbalanceobject] = []
    
    var filteredsubbplan:[fiberbalanceobject]? = []
    var isSearching = false
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == ""
        {
            
            isSearching = false
            view.endEditing(true)
            fiberbalancetable.reloadData()
            
        }
        else{
            isSearching = true
            filteredsubbplan = listsubbobject.filter({$0.newcabinet!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.region!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.oldcabinet!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame })
            
            fiberbalancetable.reloadData()
            
            if (filteredsubbplan?.count)!>0{
                view.endEditing(true)}
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchsummary()
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            
            return filteredsubbplan!.count
        }
        else{
            return self.listsubbobject.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fiberbalancecell", for: indexPath) as! fiberbalancecell
        
        if isSearching{
            
            cell.newcabinet.text = self.filteredsubbplan![indexPath.item].newcabinet
            cell.state.text = self.filteredsubbplan![indexPath.item].region
            cell.oldcabinet.text = self.filteredsubbplan![indexPath.item].oldcabinet
            cell.planvdsl.text = self.filteredsubbplan![indexPath.item].portvdsl
            
            return cell
            
            
        }else{
            
            cell.newcabinet.text = self.listsubbobject[indexPath.item].newcabinet
            cell.state.text = self.listsubbobject[indexPath.item].region
            cell.oldcabinet.text = self.listsubbobject[indexPath.item].oldcabinet
            cell.planvdsl.text = self.listsubbobject[indexPath.item].portvdsl
            
            return cell
        }
    }

    func fetchsummary(){
        
        //let uuid = UIDevice.current.identifierForVendor!.uuidString
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_listbalancefiber.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                self.listsubbobject = [fiberbalanceobject]()
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    if  let summaryfromjson  = json["fiber"] as? [[String:AnyObject]]{
                        
                        for summaryfromjson in summaryfromjson {
                            let projectobj = fiberbalanceobject()
                            if let newcabinet = summaryfromjson["newfiber"] as? String,
                                let region = summaryfromjson["state"] as? String,
                                let oldcabinet = summaryfromjson["oldfiber"] as? String,
                                let portvdsl = summaryfromjson["planvdsl"] as? String{
                                
                              
                                
                                projectobj.newcabinet = newcabinet
                                projectobj.region = region
                                projectobj.oldcabinet = oldcabinet
                                projectobj.portvdsl = portvdsl
                                
                                
                                // print(listttobjects.cabinetid!)
                            }
                            self.listsubbobject.append(projectobj)
                            
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        
                        
                        self.fiberbalancetable.reloadData()
                        //                        self.activitiyindicator.stopAnimating()
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
