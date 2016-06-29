//
//  Todoル
//  SwipeTableViewCell
//
//  Created by 福島達也 on 2016/06/25.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    let saveData = NSUserDefaults.standardUserDefaults()
    var monsterArray : [UIImage]!
    var haikeiArray : [UIImage]!
    
    @IBOutlet var kkeiken : UILabel!
    @IBOutlet var monsterImageView : UIImageView!
    @IBOutlet var haikeiImageView : UIImageView!
    @IBOutlet var sinkagamen : UIButton!
    
    
    
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
        } else {
            self.sinkagamen.hidden = true
        }
        
        
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
        
        UIImageView.animateWithDuration(3.0, delay: 0.0,
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
