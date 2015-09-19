//
//  ViewController.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    @IBOutlet var tableView: UITableView!
    
    private let companyService = CompanyService();
    
    private var companies: [Company]?;
    private let textCellIdentifier = "CompanyCell"
    private var detailAskedFor: Company?
    
    private let refreshControl = UIRefreshControl()
    private var dateFormatter = NSDateFormatter()
    
    private let customNavigationAnimationController = CustomNavigationAnimationController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup the table view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.delegate = self
        
        // set up the refresh control
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView?.addSubview(refreshControl)
        
        self.dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        self.dateFormatter.timeStyle = NSDateFormatterStyle.LongStyle
        
        // request company data
        self.companyService.GetCompanies(TestCompletion)
    }
    
    func TestCompletion(companies: [Company]?) -> Void {
        // Update UI on main thread
        dispatch_async(dispatch_get_main_queue()) {
            // update "last updated" title for refresh control
            let now = NSDate()
            let updateString = "Last Updated at " + self.dateFormatter.stringFromDate(now)
            self.refreshControl.attributedTitle = NSAttributedString(string: updateString)
            
            // tell refresh control it can stop showing up now
            if self.refreshControl.refreshing
            {
                self.refreshControl.endRefreshing()
            }
            
            self.companies = companies!
            self.tableView.reloadData();
        }
    }
    
    func refresh(sender:AnyObject)
    {
        self.companyService.GetCompanies(TestCompletion)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.companies == nil {
            return 0
        }
        return self.companies!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! CompanyTableViewCell
        
        let row = indexPath.row
        
        if let company = companies?[row] {
            cell.titleLabel?.text = company.name
            cell.subtitleLabel?.text = company.description
            cell.activeUsersLabel?.text = "\(company.activeUsers!)"
            
            let path = NSBundle.mainBundle().pathForResource(company.thumbnail, ofType: "jpg")
            cell.thumbnailImageView.image = UIImage(named: path!)
            // change to 10.0 to have rounded rectangle
            cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2.0
            cell.thumbnailImageView.clipsToBounds = true
            cell.thumbnailImageView.layer.borderWidth = 1
            cell.thumbnailImageView.layer.borderColor = UIColor.blackColor().CGColor
            
            cell.thumbnailImageView.tag = company.id!
        }
        
        return cell
    }
    
    // Allow animation before a new cell is going to be displayed
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        let view = cell.contentView
//        view.layer.opacity = 0.0
//        
//        UIView.animateWithDuration(0.5, delay: 1.0, options: UIViewAnimationOptions.CurveEaseInOut,
//            animations: {
//                () -> Void in
//                view.layer.opacity = 1
//            }, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow
        let company = companies?[indexPath!.row]
        let detailControler = segue.destinationViewController as! CompanyDetailViewController
        detailControler.company = company
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        customNavigationAnimationController.reverse = operation == .Pop
        return customNavigationAnimationController
    }
}
