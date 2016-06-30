//
//  Todoル
//  SwipeTableViewCell
//
//  Created by 福島達也 on 2016/06/25.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit
import BubbleTransition

class AddTodoViewController: UIViewController {
    
    var todoArray : [AnyObject]=[]
    
    let saveData = NSUserDefaults.standardUserDefaults()
    var keiken: Int = 0
    
    
    @IBOutlet var task : UITextField!
      var importance : String = ""
    
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func importance(sender: UISegmentedControl){
        let exp : AnyObject = saveData.integerForKey("keikenchi")
        switch sender.selectedSegmentIndex{
            
            
        case 0 : importance = "1"
        self.view.backgroundColor = UIColor(red:1.0,green:0.8,blue:1.0,alpha:1.0)
        keiken = (exp as! Int) + 50
            print(keiken)
        case 1 : importance = "2"
        print(keiken)
             self.view.backgroundColor = UIColor(red:1.0,green:0.7,blue:1.0,alpha:1.0)
        keiken = (exp as! Int) + 50
            print(keiken)
        case 2 : importance = "3"
             self.view.backgroundColor = UIColor(red:1.0,green:0.6,blue:1.0,alpha:1.0)
        keiken = (exp as! Int) - 500
            print(keiken)
        case 3 : importance = "4"
             self.view.backgroundColor = UIColor(red:1.0,green:0.5,blue:1.0,alpha:1.0)
        keiken = (exp as! Int) - 50
            print(keiken)
        case 4 : importance = "5"
             self.view.backgroundColor = UIColor(red:1.0,green:0.4,blue:1.0,alpha:1.0)
        keiken = (exp as! Int) + 50
            print(keiken)
        default : importance = "1"
            
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
        
        performSegueWithIdentifier("tokanryou", sender: nil)
        //self.presentViewController(CompleteViewController, animated: true, completion: nil)        // Viewの移動
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
