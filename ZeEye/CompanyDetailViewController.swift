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
    
    var company: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let c = company {
            titleLabel.text = c.name
            subtitleLabel.text = c.description
            activeUsersLabel.text = "\(c.activeUsers)"
            
            // TODO: refactor to remove duplicate in ViewController + move that out of main thread/hard coded images
            let path = NSBundle.mainBundle().pathForResource(c.thumbnail, ofType: "jpg")
            thumbnail.image = UIImage(named: path!)
            // change to 10.0 to have rounded rectangle
            thumbnail.layer.cornerRadius = thumbnail.frame.size.width / 2.0
            thumbnail.clipsToBounds = true
            thumbnail.layer.borderWidth = 1
            thumbnail.layer.borderColor = UIColor.blackColor().CGColor
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
