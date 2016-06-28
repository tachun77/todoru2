//
//  TableViewCell.swift
//  Todoル
//
//  Created by 福島達也 on 2016/06/29.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var importanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
