//
//  ShinkaViewController.swift
//  Todoル
//
//  Created by 福島達也 on 2016/06/29.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class ShinkaViewController: UIViewController {

    let saveData = NSUserDefaults.standardUserDefaults()
    @IBOutlet var monsterImageView : UIImageView!
    var monsterArray : [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let keiken : AnyObject = saveData.integerForKey("keikenchi")
        let keikenchinow = String(keiken)
        let keikenchinow2 = Int(keikenchinow)
        
        monsterArray = [UIImage(named:"rev_1.png")!,UIImage(named:"load.png")!]

        if keikenchinow2 == 1000 {
            monsterImageView.image = monsterArray[0]
        } else if keikenchinow2 == 2000 {
            monsterImageView.image = monsterArray[1]
            
    }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
        UIImageView.animateWithDuration(3.0, delay: 0.0,
                                        options: UIViewAnimationOptions.Repeat, animations: { () -> Void in self.monsterImageView.alpha = 0.0
            }, completion: nil)

        }
    
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