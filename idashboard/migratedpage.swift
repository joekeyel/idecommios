//
//  migratedpage.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 27/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class migratedpage: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var projecttable: UITableView!
    var projecttype:[projectobject]? = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

     fetchsummary()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (projecttype?.count)!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectcategorycell", for: indexPath) as! projecttypecell
        
        cell.projecttype.text = self.projecttype![indexPath.item].projecttype
         cell.totaltt.text = self.projecttype![indexPath.item].total
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func fetchsummary(){
        
        //let uuid = UIDevice.current.identifierForVendor!.uuidString
        let urlrequest = URLRequest(url: URL(string:"http://58.27.84.166/mcconline/MCC%20Online%20V3/query_listcategory.php")!)
        
        let task = URLSession.shared.dataTask(with: urlrequest){(data,response,error)  in
            
            if let data = data {
                
                self.projecttype = [projectobject]()
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
                    
                    if  let summaryfromjson  = json["listcategory"] as? [[String:AnyObject]]{
                        
                        for summaryfromjson in summaryfromjson {
                            let projectobj = projectobject()
                            if let projtype = summaryfromjson["Projecttype"] as? String,
                                let totalproj = summaryfromjson["total"] as? String{
                                
                                print(projtype)
                                print(totalproj)
                                
                                projectobj.projecttype = projtype
                                projectobj.total = totalproj
                               
                                
                                // print(listttobjects.cabinetid!)
                            }
                            self.projecttype?.append(projectobj)
                            
                            
                        }
                        
                    }
                    DispatchQueue.main.async {
                        
                        
                        self.projecttable.reloadData()
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
