//
//  CompanyDetailViewController.swift
//  ZeEye
//
//  Created by David Christy on 26/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var activityChart: LineChart!
    @IBOutlet weak var processCountStackView: UIStackView!
    
    private var CanRequestMoreActivityData: Bool = false
    private var ActivityDataTodayOffset: Int = 0
    private let ActivityDataDaysSpan: Int = 8
    
    var company: Company?
    var requestedProcessTemplateId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let c = company {
            titleLabel.text = c.name
            subtitleLabel.text = c.description
            
            let usersCountView = ProcessCountView(frame: CGRectMake(0,0,150,65), processTemplateId: nil, tapDelegate: nil)
            usersCountView.lblProcessCountText = "\(c.activeUsers!)"
            usersCountView.lblProcessTitleText = "users"
            processCountStackView.addArrangedSubview(usersCountView)
            
            if let processes = c.processesCount {
                for (_, value) in processes.enumerate() {
                    let processCountView = ProcessCountView(frame: CGRectMake(0,0,150,65), processTemplateId: value.processTemplateId, tapDelegate: processCountTapped)
                    processCountView.lblProcessCountText = "\(value.count!)"
                    processCountView.lblProcessTitleText = value.processTemplateName
                    processCountStackView.addArrangedSubview(processCountView)
                }
            }
            
            // TODO: refactor to remove duplicate in ViewController + move that out of main thread/hard coded images
            if (c.thumbnailUrl?.isEmpty == true) {
                let path = NSBundle.mainBundle().pathForResource("titanic", ofType: "jpg")
                thumbnail.image = UIImage(named: path!)
            } else {
                let path = NSBundle.mainBundle().pathForResource(c.thumbnailUrl, ofType: "jpg")
                thumbnail.image = UIImage(named: path!)
            }

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
            
            // Swipes
            let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipeRight.direction = UISwipeGestureRecognizerDirection.Right
            self.view.addGestureRecognizer(swipeRight)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
            self.view.addGestureRecognizer(swipeLeft)
            
            // Get data
            let dataService = DataService()
            CanRequestMoreActivityData = false;
            dataService.GetActivities(receivedActivityData, companyUuid: c.uuid!, todayOffset: ActivityDataTodayOffset)
        }
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if CanRequestMoreActivityData == true {
                CanRequestMoreActivityData = false;
                
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.Right:
                    ActivityDataTodayOffset += 8
                case UISwipeGestureRecognizerDirection.Left:
                    ActivityDataTodayOffset = max(0, ActivityDataTodayOffset - 8)
                default:
                    break
                }
                let dataService = DataService()
                dataService.GetActivities(receivedActivityData, companyUuid: company!.uuid!, todayOffset: ActivityDataTodayOffset)
            }
        }
    }
    
    func receivedActivityData(activies: [Activity]?) -> Void {
        dispatch_async(dispatch_get_main_queue()) {
        let data = activies!.map{$0.stepCompleted!}
        let data2 = activies!.map{$0.sequenceCompleted!}
        let xLabels = activies!.map{"\($0.day!)/\($0.month!)"}
        
        self.activityChart.clearAll()
        
        self.activityChart.addLine(data)
        self.activityChart.addLine(data2)
        
        self.activityChart.x.labels.values = xLabels
        self.activityChart.hasGotData = true
            
        self.activityChart.setNeedsDisplay()
        self.CanRequestMoreActivityData = true
        }
    }
    
    func processCountTapped(processTemplateId: Int) -> Void {
        requestedProcessTemplateId = processTemplateId
        self.performSegueWithIdentifier("ShowProcessDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let processDetailControler = segue.destinationViewController as! ProcessDetailViewController
        
        let request = SequenceDetailsRequest(companyUuid: company!.uuid!, processTemplateId: requestedProcessTemplateId!)
        processDetailControler.sequenceDetailsRequest = request
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
