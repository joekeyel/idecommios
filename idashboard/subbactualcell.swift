//
//  subbactualcell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 29/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class subbactualcell: UITableViewCell {
    
    @IBOutlet weak var oldcab: UILabel!
    
    @IBOutlet weak var migdate: UILabel!
    
    @IBOutlet weak var newcab: UILabel!
    
    @IBOutlet weak var region: UILabel!
    
    @IBOutlet weak var onplan: UILabel!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
