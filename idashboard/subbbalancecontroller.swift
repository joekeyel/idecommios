//
//  subbbalancecontroller.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 29/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class subbbalancecontroller: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
   
    var listsubbobject:[subbbalanceobject] = []
    
    var filteredsubbplan:[subbbalanceobject]? = []
    var isSearching = false

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == ""
        {
            
            isSearching = false
            view.endEditing(true)
           subbplantable.reloadData()
            
        }
        else{
            isSearching = true
            filteredsubbplan = listsubbobject.filter({$0.newcabinet!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame || $0.region!.caseInsensitiveCompare(searchBar.text!) == ComparisonResult.orderedSame })
            
            subbplantable.reloadData()
            
            if (filteredsubbplan?.count)!>0{
                view.endEditing(true)}
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
