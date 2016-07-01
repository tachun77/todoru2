//
//  Todoル
//  SwipeTableViewCell
//
//  Created by 福島達也 on 2016/06/25.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit
import BubbleTransition

class CompleteViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    let saveData = NSUserDefaults.standardUserDefaults()
    var monsterArray : [UIImage]!
    var haikeiArray : [UIImage]!
    
    @IBOutlet var kkeiken : UILabel!
    @IBOutlet var monsterImageView : UIImageView!
    @IBOutlet var haikeiImageView : UIImageView!
    @IBOutlet var sinkagamen : UIButton!
    @IBOutlet var serihu : UILabel!
    @IBOutlet var hukidasi : UIImageView!
    @IBOutlet var tolist : UIButton!
    @IBOutlet var tosinka : UIButton!
    @IBOutlet var anatano : UILabel!
    

    
    let transition = BubbleTransition()
    var startingPoint = CGPointZero
    var duration = 20.0
    var transitionMode: BubbleTransitionMode = .Present
    var bubbleColor: UIColor = .yellowColor()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
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

    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = tolist.center
        transition.bubbleColor = UIColor.whiteColor()
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = tosinka.center
        transition.bubbleColor = UIColor.whiteColor()
        return transition
    }

    
    
    
//    @IBAction func modoru(){
//        
//        self.presentViewController(ListTableViewController,animated:true, completion: nil)
//    
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keiken : AnyObject = saveData.integerForKey("keikenchi")
        let keikenchinow = String(keiken)
        kkeiken.text = keikenchinow
        
        let keikenchinow2 = Int(keikenchinow)
    
        monsterArray = [UIImage(named:"anpo_1.png")!,UIImage(named:"rev_1.png")!,UIImage(named:"load.png")!,UIImage(named:"anpo_11.png")!,UIImage(named:"rev_11.png")!]
        
        if keikenchinow2 == 1000{
            monsterImageView.image = monsterArray[3]
        }
        else if keikenchinow2 < 1000 {
            monsterImageView.image = monsterArray[0]
        } else if keikenchinow2 < 2000 && 1000 < keikenchinow2{
            monsterImageView.image = monsterArray[1]
        } else if keikenchinow2 == 2000 {
            monsterImageView.image = monsterArray[4]
        }else{
            monsterImageView.image = monsterArray[2]
        }
        
//        haikeiArray = [UIImage(named:"bg_gold@2x.png")!]
//        
//        if keikenchinow2 > 2000{
//            haikeiImageView.image = haikeiArray[0]
//        }
        
        if keikenchinow2 == 1000  || keikenchinow2 == 2000 {
            self.sinkagamen.hidden = false
            serihu.hidden = true
            hukidasi.hidden = true
            tolist.hidden = true
            anatano.hidden = true
            self.view.backgroundColor = UIColor.whiteColor()
            kkeiken.hidden = true
            
        } else {
            self.sinkagamen.hidden = true
            serihu.hidden = false
            hukidasi.hidden = false
            tolist.hidden = false
            anatano.hidden = false
            kkeiken.hidden = false
        }
        
        let serihuArray = ["NICE!","Wonderful!","いいね！","...やるじゃん","Fantastic!!!","oh yeah!","経験値ありがと！"]
        let number = Int(rand() % 7)
        serihu.text = serihuArray[number]
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(animated: Bool) {
        
//        let keikenchinow : AnyObject = saveData.objectForKey("keiken") as! Int
//        
//        kkeiken.text = keikenchinow["keiken"]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let keiken : AnyObject = saveData.integerForKey("keikenchi")
        let keikenchinow = String(keiken)
        kkeiken.text = keikenchinow
        
        let keikenchinow2 = Int(keikenchinow)
        if keikenchinow2 == 1000 ||  keikenchinow2 == 2000{
        
        UIImageView.animateWithDuration(0.5, delay: 0.0,
                                        options: UIViewAnimationOptions.Repeat, animations: { () -> Void in self.monsterImageView.alpha = 0.0
            }, completion: nil)
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tosinkagamen(sender : UIButton){
            performSegueWithIdentifier("tosinka", sender: nil)
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
