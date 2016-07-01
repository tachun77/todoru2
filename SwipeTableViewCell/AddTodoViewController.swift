//
//  Todoル
//  SwipeTableViewCell
//
//  Created by 福島達也 on 2016/06/25.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit
import BubbleTransition

class AddTodoViewController: UIViewController, UIViewControllerTransitioningDelegate{
    
    var todoArray : [AnyObject]=[]
    
    let saveData = NSUserDefaults.standardUserDefaults()
    var keiken: Int = 0
    
    
    @IBOutlet var task : UITextField!
      var importance : String = ""
    
    @IBOutlet var cancel : UIButton!
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
        
    }
    
    
    let transition = BubbleTransition()
    var startingPoint = CGPointZero
    var duration = 10.0
    var transitionMode: BubbleTransitionMode = .Present
    var bubbleColor: UIColor = .yellowColor()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = self.view.center
        transition.bubbleColor = colorWithHexString("0099ff")
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = self.view.center
        transition.bubbleColor = cancel.backgroundColor!
        return transition
    }

    
    func colorWithHexString (hex:String) -> UIColor {
        
        let cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if ((cString as String).characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringWithRange(NSRange(location: 0, length: 2))
        let gString = (cString as NSString).substringWithRange(NSRange(location: 2, length: 2))
        let bString = (cString as NSString).substringWithRange(NSRange(location: 4, length: 2))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(
            red: CGFloat(Float(r) / 255.0),
            green: CGFloat(Float(g) / 255.0),
            blue: CGFloat(Float(b) / 255.0),
            alpha: CGFloat(Float(1.0))
        )
    }

    
    @IBAction func importance(sender: UISegmentedControl){
        let exp : AnyObject = saveData.integerForKey("keikenchi")
        switch sender.selectedSegmentIndex{
            
            
        case 0 : importance = "1"
        self.view.backgroundColor = colorWithHexString("0099ff")
        keiken = (exp as! Int) + 50
            print(keiken)
        case 1 : importance = "2"
        print(keiken)
             self.view.backgroundColor = colorWithHexString("0099ff")
        keiken = (exp as! Int) + 50
            print(keiken)
        case 2 : importance = "3"
             self.view.backgroundColor = colorWithHexString("0099ff")
        keiken = (exp as! Int) + 50
            print(keiken)
        case 3 : importance = "4"
             self.view.backgroundColor = colorWithHexString("0099ff")
        keiken = (exp as! Int) + 50
            print(keiken)
        case 4 : importance = "5"
             self.view.backgroundColor = colorWithHexString("0099ff")
        keiken = (exp as! Int) + 50
            print(keiken)
        default : importance = "1"
            self.view.backgroundColor = colorWithHexString("0099ff")
            
        }
        saveData.setInteger(keiken, forKey:"keikenchi")
    }
    
//    var todoArray : [AnyObject]=[]
//    let saveData = NSUserDefaults.standardUserDefaults()
//    let exp = NSUserDefaults.standardUserDefaults()
//    var keiken: AnyObject
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if saveData.arrayForKey("todo") != nil{
            todoArray = saveData.arrayForKey("todo")!
        }
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: UIButton){
        
        let todoDictionary = ["task":task.text!,"importance":importance]
        
        //保存
        todoArray.append(todoDictionary)
        saveData.setObject(todoArray, forKey:"todo")
        saveData.setInteger(keiken, forKey:"keiken" )
        saveData.synchronize()
//        
//        performSegueWithIdentifier("tokanryou", sender: nil)
        //self.presentViewController(CompleteViewController, animated: true, completion: nil)        // Viewの移動
    }
    
    
    @IBAction func cancel(sender : UIButton){
        performSegueWithIdentifier("cancel", sender: nil)
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
