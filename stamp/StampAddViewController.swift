//
//  StampAddViewController.swift
//  stamp
//
//  Created by Tatsunori Ono on 2015/10/04.
//  Copyright (c) 2015年 Tatsunori Ono. All rights reserved.
//

import UIKit

class StampAddViewController: UIViewController {
    
//    スタンプ画像の名前が入った配列
    var imageNameArray:[String] = ["hana", "hoshi", "onpu", "shitumon","gudetama stamp", "doraemon stamp","nobita"]
    var imageIndex: Int = 0
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        haikeiImageView.image=UIImage(named: imageNameArray[imageIndex])
    }
    
    @IBAction func LeftBotton() {
        imageIndex = imageIndex - 1
        if  imageIndex ==  -1 {
            imageIndex = 6
        }
        haikeiImageView.image = UIImage(named: imageNameArray [ imageIndex])
    }
    
    @IBAction func RightBotton() {
        imageIndex = imageIndex + 1
        if imageIndex == 7 {
            imageIndex = 0
        }
        haikeiImageView.image =  UIImage(named: imageNameArray [imageIndex])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ToLeft") {
            
            
            var VC = segue.destinationViewController as! ViewController
            VC.imageIndex = self.imageIndex
         }
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