//
//  ProgrammeBaseSessionItemTableViewCell.swift
//  iOSDevUK
//
//  Created by Neil Taylor on 10/08/2018.
//  Copyright © 2018 Aberystwyth University. All rights reserved.
//

import UIKit

class ProgrammeBaseSessionItemTableViewCell: UITableViewCell {

    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var timeStart: UILabel!
    @IBOutlet weak var timeEnd: UILabel!
    
    var notifySessionItemSelected: ((Int, CGPoint, UITableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withSession session: IDUSession) {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Europe/London")
        formatter.dateFormat = "HH:mm"
            
        if let start = session.startTime as Date? {
            timeStart.text = String(formatter.string(from: start).prefix(5).trimmingCharacters(in: .whitespaces))
        }
        else {
            timeStart.text = "--:--"
        }
        
        if let end = session.endTime as Date? {
            timeEnd.text = String(formatter.string(from: end).prefix(5).trimmingCharacters(in: .whitespaces))
        }
        else {
            timeEnd.text = "--:--"
        }
    }
    
    func configure(withSession session: IDUSession, whereUserSelected isUserSelected: Bool) {
        configure(withSession: session)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let notify = notifySessionItemSelected,
            let touch = touches.first {
            notify(0, touch.location(in: self), self)
        }
    }

}
