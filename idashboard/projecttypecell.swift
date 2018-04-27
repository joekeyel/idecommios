//
//  projecttypecell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 27/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class projecttypecell: UITableViewCell {

    @IBOutlet weak var projecttype: UILabel!
    
    @IBOutlet weak var totaltt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
