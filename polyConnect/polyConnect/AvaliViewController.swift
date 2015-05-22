//
//  AvaliViewController.swift
//  polyConnect
//
//  Created by Johnson Chou on 5/22/15.
//  Copyright (c) 2015 Johnson Zhou. All rights reserved.
//

import UIKit

class AvaliViewController: UIViewController {

    @IBOutlet weak var ipad3d: UILabel!
    @IBOutlet weak var ipad3h: UILabel!
    @IBOutlet weak var pclap: UILabel!
    @IBOutlet weak var maclap: UILabel!
    @IBOutlet weak var dslcam: UILabel!
    @IBOutlet weak var gopro: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view.
    }

    @IBAction func refreshClick(sender: AnyObject) {
        if updateData() == 0 {
        let alert = UIAlertView(title: nil, message: "Refreshed", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateData() -> Int {
        
        let dataNet = NSData(contentsOfURL: NSURL(string: "http://lib.calpoly.edu/api/available.json")!)
        if dataNet == nil {
            let alert = UIAlertView(title: "No network connection", message: "You must be connected to receive avaliblity information", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            return 1;
        } else {
            let jsonNet = JSON(data: dataNet!)
            if let xipad3d = jsonNet["Apple iPad 2 - 3 day"].int {
                ipad3d.text = xipad3d.description
            } else {
                ipad3d.text = "N/A"
            }
            if let xipad3h = jsonNet["Apple iPad 2 - 3 hour"].int {
                ipad3h.text = xipad3h.description
            } else {
                ipad3h.text = "N/A"
            }
            if let xpclap = jsonNet["Poly Connect LAPTOP"].int {
                pclap.text = xpclap.description
            } else {
                pclap.text = "N/A"
            }
            if let xmaclap = jsonNet["MacBook Pro Laptop"].int {
                maclap.text = xmaclap.description
            } else {
                maclap.text = "N/A"
            }
            if let xdslcam = jsonNet["Nikon DSLR Camera"].int {
                dslcam.text = xdslcam.description
            } else {
                dslcam.text = "N/A"
            }
            if let xgopro = jsonNet["GoPro Camera"].int {
                gopro.text = xgopro.description
            } else {
                gopro.text = "N/A"
            }
        }
      return 0
    }
    
    func getPath(fileName: String) -> String {
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask,true)[0].stringByAppendingPathComponent(fileName)
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
