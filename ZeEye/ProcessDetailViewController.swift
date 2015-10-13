//
//  ProcessDetailViewController.swift
//  ZeEye
//
//  Created by David Christy on 08/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import UIKit

class ProcessDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var discChart: DiscChart!
    @IBOutlet weak var tableView: UITableView!
    
    private var sequences: [SequenceCount]?;
    private let textCellIdentifier = "SequenceCell"
    
    var sequenceDetailsRequest: SequenceDetailsRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup the table view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.hidden = true
        
        let dataService = DataService()
        if let request = sequenceDetailsRequest {
            dataService.GetSequencesCount(receivedSequencesData, companyUuid: request.companyUuid, processTemplateId: request.processTemplateId)
        }
    }
    
    func receivedSequencesData(sequences: [SequenceCount]?) -> Void {
        dispatch_async(dispatch_get_main_queue()) {
            if let seq = sequences {
                self.discChart.renderData(seq.map{$0}) // Cf question on StackOverflow
                self.sequences = sequences
                self.tableView.reloadData();
                self.tableView.hidden = false
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.sequences == nil {
            return 0
        }
        return self.sequences!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! SequenceTableViewCell
        
        let row = indexPath.row
        
        if let sequence = sequences?[row] {
            cell.sequenceName?.text = sequence.processSequenceName!
            cell.count?.text = "\(sequence.count!)"
            cell.colorView.backgroundColor = DiscChart.colors[row]
        }
        
        return cell
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.performSegueWithIdentifier("UnwindProcessDetail", sender: self)
    }
}
