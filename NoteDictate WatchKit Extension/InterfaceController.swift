//
//  InterfaceController.swift
//  NoteDictate WatchKit Extension
//
//  Created by Praveen on 08/03/20.
//  Copyright © 2020 Praveen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    var notes: [String] = [String]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.setupTable()
    }
    
    private func setupTable() {
        table.setNumberOfRows(notes.count, withRowType: "Row")
        for rowIndex in 0..<notes.count {
            self.set(row: rowIndex, to: "Hello, Row \(rowIndex)")
        }
    }
    
    func set(row rowIndex: Int, to text: String) {
        guard let row = table.rowController(at: rowIndex) as?  NoteSelectRow else { return }
        row.textLabel.setText(text)
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func addNewNoteAction() {
        print("Add new note")
        self.presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { [weak self] (result) in
            guard let strongSelf = self else { return }
            guard let resultString = result?.first as? String else { return }
            strongSelf.table.insertRows(at: IndexSet(integer: strongSelf.notes.count), withRowType: "Row")
            strongSelf.set(row: strongSelf.notes.count, to: resultString)
            strongSelf.notes.append(resultString)
        }
    }
    
    
}
