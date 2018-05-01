//
//  fiberbalancecell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 01/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class fiberbalancecell: UITableViewCell {

    @IBOutlet weak var oldcabinet: UILabel!
    
    @IBOutlet weak var newcabinet: UILabel!
    
    @IBOutlet weak var planvdsl: UILabel!
    @IBOutlet weak var state: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
