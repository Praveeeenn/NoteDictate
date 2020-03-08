//
//  DetailInterfaceController.swift
//  NoteDictate WatchKit Extension
//
//  Created by Praveen on 08/03/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import WatchKit
import Foundation

class DetailInterfaceController: WKInterfaceController {

    @IBOutlet weak var textLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        if let contextDict = context as? [String: String] {
            textLabel.setText(contextDict["note"] ?? "1")
            let index = contextDict["index"] ?? "1"
            setTitle("Note \(index)")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
