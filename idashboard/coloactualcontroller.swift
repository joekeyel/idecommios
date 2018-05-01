//
//  coloactualcontroller.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 01/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class coloactualcontroller: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
   
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet weak var coloactualtable: UITableView!
    
    var listsubbobject:[coloactualobject] = []
    
    var filteredsubbactual:[coloactualobject]? = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchsummary()
        
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == ""
        {
            
            isSearching = false
            view.endEditing(true)
            coloactualtable.reloadData()
            
        }
        else{
            isSearching = true
            filteredsubbactual = listsubbobject.filter({$0.newcabinet!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.region!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.onplan!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame})
            
            coloactualtable.reloadData()
            
            if (filteredsubbactual?.count)!>0{
                view.endEditing(true)}
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            
            return filteredsubbactual!.count
        }
        else{
            return self.listsubbobject.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coloactualcell", for: indexPath) as! coloactualcell
        
        if isSearching{
            
            cell.newcabinet.text = self.filteredsubbactual![indexPath.item].newcabinet
            cell.region.text = self.filteredsubbactual![indexPath.item].region
            cell.oldcabinet.text = self.filteredsubbactual![indexPath.item].oldcabinet
            cell.migdate.text = self.filteredsubbactual![indexPath.item].migdate
            cell.onplan.text = self.filteredsubbactual![indexPath.item].onplan
            
            return cell
            
            
        }else{
            
            
            
            
            cell.newcabinet.text = self.listsubbobject[indexPath.item].newcabinet
            cell.region.text = self.listsubbobject[indexPath.item].region
            cell.oldcabinet.text = self.listsubbobject[indexPath.item].oldcabinet
            cell.migdate.text = self.listsubbobject[indexPath.item].migdate
            cell.onplan.text = self.listsubbobject[indexPath.item].onplan
            
            return cell
        }
    }
    
    func fetchsummary(){
        
        //let uuid = UIDevice.current.identifierForVendor!.uuidString
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_listactual.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                self.listsubbobject = [coloactualobject]()
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    if  let summaryfromjson  = json["colo"] as? [[String:AnyObject]]{
                        
                        for summaryfromjson in summaryfromjson {
                            let projectobj = coloactualobject()
                            if let newcabinet = summaryfromjson["newcolo"] as? String,
                                let oldcabinet = summaryfromjson["oldcolo"] as? String,
                                let state = summaryfromjson["state"] as? String,
                                let migdate = summaryfromjson["migdate"] as? String,  let onplan = summaryfromjson["onplan"] as? String{
                                
                                
                                
                                projectobj.newcabinet = newcabinet
                                projectobj.oldcabinet = oldcabinet
                                projectobj.migdate = migdate
                                projectobj.region = state
                                projectobj.onplan = onplan
                                
                                print(newcabinet)
                                // print(listttobjects.cabinetid!)
                            }
                            self.listsubbobject.append(projectobj)
                            
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        
                        
                        self.coloactualtable.reloadData()
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
