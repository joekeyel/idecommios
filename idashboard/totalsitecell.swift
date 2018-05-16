//
//  totalsitecell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 16/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class totalsitecell: UITableViewCell {
    
    
    @IBOutlet weak var sites: UILabel!
    @IBOutlet weak var states: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
