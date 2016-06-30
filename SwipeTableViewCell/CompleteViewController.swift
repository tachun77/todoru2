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

    
    let transition = BubbleTransition()
    var startingPoint = CGPointZero
    var duration = 0.5
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
        transition.startingPoint = tolist.center
        transition.bubbleColor = tolist.backgroundColor!
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = tolist.center
        transition.bubbleColor = tolist.backgroundColor!
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
            monsterImageView.image = monsterArray[3]
        }
        
        haikeiArray = [UIImage(named:"bg_gold@2x.png")!]
        
        if keikenchinow2 > 2000{
            haikeiImageView.image = haikeiArray[0]
        }
        
        if keikenchinow2 == 1000  || keikenchinow2 == 2000 {
            self.sinkagamen.hidden = false
            serihu.hidden = true
            hukidasi.hidden = true
            tolist.hidden = true
            
        } else {
            self.sinkagamen.hidden = true
            serihu.hidden = false
            hukidasi.hidden = false
            tolist.hidden = false
        }
        
        let serihuArray = ["NICE!","Wonderful!","ナイスリストアップ！","...やるじゃん","Fantastic!!!","oh yeah!","経験値ありがと！"]
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
