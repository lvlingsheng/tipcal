//
//  ViewController.swift
//  tipcal
//
//  Created by 吕凌晟 on 15/12/26.
//  Copyright © 2015年 Lingsheng Lyu. All rights reserved.
//

import UIKit
import BubbleTransition

class ViewController: UIViewController, UIViewControllerTransitioningDelegate,UITextFieldDelegate {
    
    var window: UIWindow?
    @IBOutlet weak var settingbutton: UIButton!
    @IBOutlet weak var tippercentlabel: UILabel!
    
    @IBOutlet weak var for2label: UILabel!
    @IBOutlet weak var for3label: UILabel!
    @IBOutlet weak var for4label: UILabel!
    @IBOutlet weak var tipintru: UILabel!
    @IBOutlet weak var totalintru: UILabel!
    @IBOutlet weak var inputamount: UITextField!
    @IBOutlet weak var tipamount: UILabel!
    @IBOutlet weak var totalamount: UILabel!
    
    let transition=BubbleTransition()
    let defaulttip=NSUserDefaults.standardUserDefaults()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
    }
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
//        replacementString string: String) -> Bool {
//            let newtext = textField.text?.stringByReplacingCharactersInRange(range: range, withString: string)
//            print(newtext)
//            return true
//    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var txtAfterUpdate:NSString = self.inputamount.text! as NSString
        txtAfterUpdate = txtAfterUpdate.stringByReplacingCharactersInRange(range, withString: string)
        //print(txtAfterUpdate)
//        if(inputamount.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)>=0){
//            tipintru.hidden=false
//            totalintru.hidden=false
//        }else{
//            tipintru.hidden=true
//            totalintru.hidden=true
//        }
        

        
        let tipinnumber=Float(defaulttip.integerForKey("tippercent"))/100
        print(tipinnumber)
        let tipnumber=txtAfterUpdate.floatValue * tipinnumber
        tipamount.text="$"+String(tipnumber)
        let totalnumber=txtAfterUpdate.floatValue * (1+tipinnumber)
        print(txtAfterUpdate)
        totalamount.text="$"+String(totalnumber)
        for2label.text="$"+String(totalnumber/2)
        for3label.text="$"+String(totalnumber/3)
        for4label.text="$"+String(totalnumber/4)
        
        if(txtAfterUpdate.length==0){
            tipintru.hidden=true
            totalintru.hidden=true
            tipamount.text="Tip"
            totalamount.text="Total"
        }else{
            tipintru.hidden=false
            totalintru.hidden=false
        }
        return true
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .Present
        transition.startingPoint = settingbutton.center
        transition.bubbleColor = settingbutton.backgroundColor!
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if(defaulttip.integerForKey("tippercent")==10){
            tippercentlabel.text="10%"
        }
        if(defaulttip.integerForKey("tippercent")==15){
            tippercentlabel.text="15%"
        }
        if(defaulttip.integerForKey("tippercent")==20){
            tippercentlabel.text="20%"
        }
        
        print(defaulttip.integerForKey("tippercent"))
        
        let tipinnumber=Float(defaulttip.integerForKey("tippercent"))/100
        print(tipinnumber)
        let tipnumber=(inputamount.text! as NSString).floatValue * tipinnumber
        tipamount.text="$"+String(tipnumber)
        let totalnumber=(inputamount.text! as NSString).floatValue * (1+tipinnumber)
        totalamount.text="$"+String(totalnumber)
        for2label.text="$"+String(totalnumber/2)
        for3label.text="$"+String(totalnumber/3)
        for4label.text="$"+String(totalnumber/4)
        
        transition.transitionMode = .Dismiss
        transition.startingPoint = settingbutton.center
        transition.bubbleColor = settingbutton.backgroundColor!
        return transition
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tippercentlabel.text=defaulttip.valueForKey("tippercent")
        if(defaulttip.integerForKey("tippercent")==10){
            tippercentlabel.text="10%"
        }
        if(defaulttip.integerForKey("tippercent")==15){
            tippercentlabel.text="15%"
        }
        if(defaulttip.integerForKey("tippercent")==20){
            tippercentlabel.text="20%"
        }
        
        inputamount.delegate=self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        inputamount.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


}

