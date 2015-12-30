//
//  settingViewController.swift
//  tipcal
//
//  Created by 吕凌晟 on 15/12/27.
//  Copyright © 2015年 Lingsheng Lyu. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    
    @IBOutlet weak var closebotton: UIButton!
    @IBOutlet weak var defaulttip: UISegmentedControl!
    
    
    @IBAction func segselect(sender: AnyObject) {
        print(defaulttip.selectedSegmentIndex)
        let defaultvalue=NSUserDefaults.standardUserDefaults()
        if(defaulttip.selectedSegmentIndex==0){
            defaultvalue.setInteger(10, forKey: "tippercent")
        }
        if(defaulttip.selectedSegmentIndex==1){
            defaultvalue.setInteger(15, forKey: "tippercent")
        }
        if(defaulttip.selectedSegmentIndex==2){
            defaultvalue.setInteger(20, forKey: "tippercent")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //closebotton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        // Do any additional setup after loading the view.
        let defaultvalue=NSUserDefaults.standardUserDefaults()
        if(defaultvalue.integerForKey("tippercent")==10){
            defaulttip.selectedSegmentIndex=0
        }
        if(defaultvalue.integerForKey("tippercent")==15){
            defaulttip.selectedSegmentIndex=1
        }
        if(defaultvalue.integerForKey("tippercent")==20){
            defaulttip.selectedSegmentIndex=2
        }
    }

    @IBAction func closeaction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    override func viewWillAppear(animated: Bool) {
//        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
//    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
//    
//    override func viewWillDisappear(animated: Bool) {
//        UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
