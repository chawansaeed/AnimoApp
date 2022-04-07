//
//  EmailUs.swift
//  Animo_Animo
//
//  Created by Chawan Saeed on 1/12/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class SendingEmails: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
override func viewDidLoad() {
    super.viewDidLoad()
        title = "Tell us your feedback"
    
        descriptionLabel.text = "You can tell me your feedback by sending emails to me, my email is written in below, so just send an email to this email. "
    }
    
}
