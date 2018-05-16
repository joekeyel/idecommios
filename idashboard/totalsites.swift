//
//  totalsites.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 16/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class totalsites: UIViewController,UITableViewDelegate,UITableViewDataSource  {
  
    
    @IBOutlet weak var totalsitestable: UITableView!
    var projecttype:[projectobject]? = []
    var section: String = ""
    var statestr:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchsummary(sectionpass: section,statestr: statestr)
   
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (projecttype?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "totalsitecell", for: indexPath) as! totalsitecell
        
        cell.states.text = self.projecttype![indexPath.item].states
        cell.sites.text = self.projecttype![indexPath.item].total
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func fetchsummary(sectionpass:String,statestr:String){
        
        //let uuid = UIDevice.current.identifierForVendor!.uuidString
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/decom_pstn.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                self.projecttype = [projectobject]()
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    if  let summaryfromjson  = json[sectionpass] as? [[String:AnyObject]]{
                        
                        for summaryfromjson in summaryfromjson {
                            let projectobj = projectobject()
                            if let state = summaryfromjson["STATE"] as? String,
                                let totalproj = summaryfromjson[statestr] as? String{
                                
                                print(state)
                                print(totalproj)
                                
                                projectobj.states = state
                                projectobj.total = totalproj
                                
                                
                                // print(listttobjects.cabinetid!)
                            }
                            self.projecttype?.append(projectobj)
                            
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        
                        
                        self.totalsitestable.reloadData()
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
