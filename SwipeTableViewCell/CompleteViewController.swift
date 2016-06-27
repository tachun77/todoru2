//
//  CompleteViewController.swift
//  SwipeTableViewCell
//
//  Created by 福島達也 on 2016/06/25.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    let exp = NSUserDefaults.standardUserDefaults()
    
    
   @IBOutlet var kkeiken : UILabel!
    
//    @IBAction func modoru(){
//        
//        self.presentViewController(ListTableViewController,animated:true, completion: nil)
//    
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keikenchinow : AnyObject = exp.objectForKey("keiken")!
        kkeiken.text = keikenchinow["keiken"] as? String
        
        
        
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(animated: Bool) {
        
//        let keikenchinow : AnyObject = saveData.objectForKey("keiken") as! Int
//        
//        kkeiken.text = keikenchinow["keiken"]
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
