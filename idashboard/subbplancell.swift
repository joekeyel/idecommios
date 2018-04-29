//
//  subbplancell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 28/04/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class subbplancell: UITableViewCell {

    @IBOutlet weak var cabinetname: UILabel!
    
    @IBOutlet weak var port: UILabel!
    @IBOutlet weak var phase: UILabel!
    @IBOutlet weak var region: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
