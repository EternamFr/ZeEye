//
//  ViewController.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    private let companies: [Company] = Company.getAllCompanies()
    private let textCellIdentifier = "CompanyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! CompanyTableViewCell
        
        let row = indexPath.row
        cell.titleLabel?.text = companies[row].name
        cell.subtitleLabel?.text = companies[row].description
        cell.activeUsersLabel?.text = "\(companies[row].activeUsers)"
        
        let path = NSBundle.mainBundle().pathForResource(companies[row].thumbnail, ofType: "jpg")
        cell.thumbnailImageView.image = UIImage(named: path!)
        // change to 10.0 to have rounded rectangle
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2.0
        cell.thumbnailImageView.clipsToBounds = true
        cell.thumbnailImageView.layer.borderWidth = 1
        cell.thumbnailImageView.layer.borderColor = UIColor.blackColor().CGColor
        
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

}
