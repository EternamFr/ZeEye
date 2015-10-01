//
//  CompanyDetailViewController.swift
//  ZeEye
//
//  Created by David Christy on 26/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var activeUsersLabel: UILabel!
    @IBOutlet weak var musCountLabel: UILabel!
    @IBOutlet weak var threeSixtyCountLabel: UILabel!
    @IBOutlet weak var activityChart: LineChart!
    
    var company: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let c = company {
            titleLabel.text = c.name
            subtitleLabel.text = c.description
            activeUsersLabel.text = "\(c.activeUsers!)"
            
            if let musCount = c.musProcessesCount {
                musCountLabel.text = "\(musCount)"
            }
            
            if let threeSixtyCount = c.threeSixtyProcessesCount {
                threeSixtyCountLabel.text = "\(threeSixtyCount)"
            }
            
            // TODO: refactor to remove duplicate in ViewController + move that out of main thread/hard coded images
            let path = NSBundle.mainBundle().pathForResource(c.thumbnailUrl, ofType: "jpg")
            thumbnail.image = UIImage(named: path!)
            // change to 10.0 to have rounded rectangle
            thumbnail.layer.cornerRadius = 5.0 // thumbnail.frame.size.width / 2.0
            thumbnail.clipsToBounds = true
            thumbnail.layer.borderWidth = 1
            thumbnail.layer.borderColor = UIColor.blackColor().CGColor
            
            thumbnail.tag = c.order!
            
            let data: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0]
            let data2: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0]
            
            // simple line with custom x axis labels
            let xLabels: [String] = ["", "", "", "", "", "", "", ""]
            
            activityChart.animation.enabled = true
            activityChart.area = true
            activityChart.x.labels.visible = true
            activityChart.x.grid.count = 8
            activityChart.y.grid.count = 8
            activityChart.x.labels.values = xLabels
            activityChart.y.labels.visible = true
            activityChart.addLine(data)
            activityChart.addLine(data2)
            
            let dataService = DataService()
            dataService.GetActivities(ReceivedActivityData, companyUuid: c.uuid!)
        }
    }

    func ReceivedActivityData(activies: [Activity]?) -> Void {
        dispatch_async(dispatch_get_main_queue()) {
        let data = activies!.map{$0.stepCompleted!}
        let data2 = activies!.map{$0.sequenceCompleted!}
        let xLabels = activies!.map{$0.date!}
        
        self.activityChart.clearAll()
        
        self.activityChart.addLine(data)
        self.activityChart.addLine(data2)
        
        self.activityChart.x.labels.values = xLabels
        self.activityChart.hasGotData = true
            
        self.activityChart.setNeedsDisplay()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
