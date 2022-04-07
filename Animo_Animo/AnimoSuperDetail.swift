//
//  AnimoSuperDetail.swift
//  Animo_Animo
//
//  Created by Chawan Saeed on 1/12/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class AnimoSuperDetail: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var details: UILabel!
    
    var animoSuperDetails: AnimoDetails!
    var animoTableVC: AnimoTableViewController!
    var animal: AnimoInformatoin!
    var detailTVC: DetailTableViewController!
    var animoTVCell: AnimoTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        name.text = animoSuperDetails.names 
        details.text = animoSuperDetails.details
    }
}