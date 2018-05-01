//
//  coloplancell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 01/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class coloplancell: UITableViewCell {

    
    @IBOutlet weak var vdslplan: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var dslamid: UILabel!
    @IBOutlet weak var oldcabinet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
