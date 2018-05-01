//
//  colobalancecell.swift
//  idashboard
//
//  Created by Hasanul Isyraf on 01/05/2018.
//  Copyright © 2018 Hasanul Isyraf. All rights reserved.
//

import UIKit

class colobalancecell: UITableViewCell {

    @IBOutlet weak var totalsubs: UILabel!
    
    @IBOutlet weak var oldcabinet: UILabel!
    
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var dslamid: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
