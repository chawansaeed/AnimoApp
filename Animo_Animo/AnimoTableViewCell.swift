//
//  AnimoTableViewCell.swift
//  Animo_Animo
//
//  Created by Chawan Saeed on 1/8/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class AnimoTableViewCell: UITableViewCell {

    @IBOutlet var animoImageView: UIImageView!
    @IBOutlet var animoName: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
