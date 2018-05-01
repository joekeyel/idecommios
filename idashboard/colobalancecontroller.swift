//
//  colobalancecontroller.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 01/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class colobalancecontroller: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
  
    

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var colobalancetable: UITableView!
    var listsubbobject:[colobalanceobject] = []
    
    var filteredsubbplan:[colobalanceobject]? = []
    var isSearching = false
    
    
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "colobalancecell", for: indexPath) as! colobalancecell

        if isSearching{

            cell.oldcabinet.text = self.filteredsubbplan![indexPath.item].oldcabinet
            cell.region.text = self.filteredsubbplan![indexPath.item].region
            cell.dslamid.text = self.filteredsubbplan![indexPath.item].dslamid
            cell.totalsubs.text = self.filteredsubbplan![indexPath.item].totalsubs

            return cell


        }else{

            cell.oldcabinet.text = self.listsubbobject[indexPath.item].oldcabinet
            cell.region.text = self.listsubbobject[indexPath.item].region
            cell.dslamid.text = self.listsubbobject[indexPath.item].dslamid
            cell.totalsubs.text = self.listsubbobject[indexPath.item].totalsubs

            return cell
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == ""
        {
            
            isSearching = false
            view.endEditing(true)
            colobalancetable.reloadData()
            
        }
        else{
            isSearching = true
            filteredsubbplan = listsubbobject.filter({$0.oldcabinet!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.dslamid!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.oldcabinet!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame })
            
            colobalancetable.reloadData()
            
            if (filteredsubbplan?.count)!>0{
                view.endEditing(true)}
            
            
            
        }
    }
    
    
    func fetchsummary(){
        
        //let uuid = UIDevice.current.identifierForVendor!.uuidString
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_listbalancecolo.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                self.listsubbobject = [colobalanceobject]()
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    if  let summaryfromjson  = json["colo"] as? [[String:AnyObject]]{
                        
                        for summaryfromjson in summaryfromjson {
                            let projectobj = colobalanceobject()
                            if let oldcabinet = summaryfromjson["oldcolo"] as? String,
                                let region = summaryfromjson["region"] as? String,
                                let dslamid = summaryfromjson["dslamid"] as? String,
                                let portvdsl = summaryfromjson["totalsubs"] as? String{
                                
                                
                                
                                projectobj.oldcabinet = oldcabinet
                                projectobj.region = region
                                projectobj.dslamid = dslamid
                                projectobj.totalsubs = portvdsl
                                
                                
                                // print(listttobjects.cabinetid!)
                            }
                            self.listsubbobject.append(projectobj)
                            
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        
                        
                        self.colobalancetable.reloadData()
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
