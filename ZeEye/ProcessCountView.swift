//
//  ProcessCountView.swift
//  ZeEye
//
//  Created by David Christy on 04/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import UIKit

@IBDesignable class ProcessCountView: UIView {

    let processTemplateId: Int?
    
    var view:UIView!;
    let tapDelegate: ((Int) -> Void)?
    
    @IBOutlet weak var lblProcessCount: UILabel!
    @IBOutlet weak var lblProcessTitle: UILabel!

    @IBInspectable var lblProcessCountText : String?
        {
        get{
            return lblProcessCount.text;
        }
        set(text)
        {
            lblProcessCount.text = text!;
        }
    }
    
    @IBInspectable var lblProcessTitleText : String?
        {
        get{
            return lblProcessTitle.text;
        }
        set(text)
        {
            lblProcessTitle.text = text!;
        }
    }
    
    init(frame: CGRect, processTemplateId: Int?, tapDelegate: ((Int) -> Void)?) {
        self.processTemplateId = processTemplateId
        self.tapDelegate = tapDelegate
        super.init(frame: frame)
        
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.processTemplateId = nil
        self.tapDelegate = nil
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ProcessCountView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(view);
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let delegate = tapDelegate, id = processTemplateId {
            delegate(id)
        }
    }
}
