//
//  Todoル
//  swipecell
//
//  Created by 福島達也 on 2016/06/25.
//  Copyright © 2016 福島達也. All rights reserved.
//

import UIKit
import BubbleTransition

class ListTableViewController: UITableViewController {
 
    var todoArray:[AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    var itemsCount: Int = 0
    var keiken: Int = 0
    
    @IBOutlet var toAdd: UIBarButtonItem!
    
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
  // MARK: load
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.contentInset = UIEdgeInsetsZero
    tableView.separatorInset = UIEdgeInsetsZero
    tableView.layoutMargins = UIEdgeInsetsZero
    
//    tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle : nil), forCellReuseIdentifier: "cell")
  }
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("todo") != nil{
            todoArray = saveData.arrayForKey("todo")!
            
        }
        tableView.reloadData()
    }
    
  // MARK: buttons
//  @IBAction func add(sender: AnyObject) {
//    add()
//  }
  
  // MARK: table view data source
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoArray.count
  }
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // create
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MCSwipeTableViewCell
        
//        let cell = MCSwipeTableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        
        let nowIndexPathDictionary: (AnyObject) = todoArray[indexPath.row]
        let exp : AnyObject = saveData.integerForKey("keikenchi")
//        
        cell.textLabel?.text = nowIndexPathDictionary["task"] as? String
        cell.detailTextLabel?.text = nowIndexPathDictionary["importance"] as? String
        
//        let jyuyou = nowIndexPathDictionary["importance"] as!Int
        print(cell.detailTextLabel)
        
        // setup
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = .None
        //cell.detailTextLabel?.text = "details..."
        
        if (cell.detailTextLabel?.text)! == 1 {
        cell.backgroundColor = .blueColor()
            
        }else if (cell.detailTextLabel?.text)! == 2 {
            cell.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        }else if (cell.detailTextLabel?.text)! == 3 {
            cell.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        }else if (cell.detailTextLabel?.text)! == 4 {
            cell.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        } else {
            cell.backgroundColor = colorWithHexString("f08080")
        }
        
        cell.defaultColor = .lightGrayColor()
        //cell.firstTrigger = 0.25;
        //cell!.secondTrigger = 0.50;
        
        // listeners
        
        cell.setSwipeGestureWithView(UIImageView(image: UIImage(named: "check")!), color: .greenColor(), mode: .Exit, state: .State1, completionBlock: { (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) -> Void in
            print("check")
            self.keiken = (exp as! Int)  + 50
            print(self.keiken)
            self.saveData.setInteger(self.keiken, forKey:"keikenchi")
            self.todoArray.removeAtIndex(indexPath.row)
            self.deleteCell(cell: cell)
            self.saveData.setObject(self.todoArray, forKey:"todo")

         //   defaults.removeObjectForKey("todo")
            
//             NSUserDefaults.standardUserDefaults().synchronize()

        })
        
        //  cell!.setSwipeGestureWithView(UIImageView(image: UIImage(named: "cross")!), color: .redColor(), mode: .Exit, state: .State2, completionBlock: { (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) -> Void in
        //    print("clock")
        //    self.deleteCell(cell: cell)
        //  })
        
        cell.setSwipeGestureWithView(UIImageView(image: UIImage(named: "cross")!), color: .redColor(), mode: .Exit, state: .State3, completionBlock: { (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) -> Void in
            print("cross")
            self.todoArray.removeAtIndex(indexPath.row)
            self.deleteCell(cell: cell)
            self.saveData.setObject(self.todoArray, forKey:"todo")
            
            tableView.reloadData()
//             NSUserDefaults.standardUserDefaults().synchronize()
        })
        
        //   cell!.setSwipeGestureWithView(UIImageView(image: UIImage(named: "list")!), color: .brownColor(), mode: .Exit, state: .State4, completionBlock: { (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) -> Void in
        //   print("list")
        //   self.deleteCell(cell: cell)
        //   })
        
        return cell
  }
  
  // MARK: helper methods
  func add() {
 //   tableView.beginUpdates()
  //  itemsCount++;
    //items.insert(String(Int64(NSDate().timeIntervalSince1970 * 1000)), atIndex: 0)
   // tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
   // tableView.endUpdates()
  }
  
 
  
  func deleteCell(cell cell: MCSwipeTableViewCell) {
    tableView.beginUpdates()
    itemsCount--
//    items.removeAtIndex(items.indexOf((cell.textLabel?.text)!)!)
    tableView.indexPathForCell(cell)
    tableView.deleteRowsAtIndexPaths([self.tableView.indexPathForCell(cell)!], withRowAnimation: .Fade)
    tableView.endUpdates()
    }
}

