//
//  ViewController.swift
//  stamp
//
//  Created by Tatsunori Ono on 2015/07/12.
//  Copyright (c) 2015年 Tatsunori Ono. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var imageNameArray:[String] = ["hana", "hoshi", "onpu", "shitumon","gudetama stamp","doraemon stamp","nobita"]
    var imageIndex: Int = 0
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(imageIndex)
    }
//
//    @IBAction func selectedFirst() {
//        imageIndex = 0
//    }
//    @IBAction func selectedSecond() {
//        imageIndex = 1
//    }
//    @IBAction func selectedThird() {
//        imageIndex = 2
//    }
//    @IBAction func selectedFourth() {
//        imageIndex = 3
//    }
//    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        let touch: UITouch = touches.first as! UITouch
        let location: CGPoint = touch.locationInView(self.view)
    
            
            imageView = UIImageView(frame: CGRectMake(0,0,40,40))
            var image: UIImage = UIImage(named:  imageNameArray [imageIndex])!
            imageView.image = image
            imageView.center = CGPointMake(location.x,location.y)
            self.view.addSubview(imageView)
//            imageIndex = 0
            

    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
//       タッチを検出
        let touch: UITouch = touches.first as! UITouch
//        タッチの座標を取る
        let point = touch.locationInView(self.view)
//        前のタッチの座標を取る
        let location = touch.previousLocationInView (self.view)
        
//        動いた分のX軸とY軸の移動分をdeltaX,deltaYにそれぞれ入れる
        let deltaX : CGFloat = CGFloat(point.x - location.x)
        let deltaY : CGFloat = CGFloat(point.y - location.y)
//        指が動いた分だけUIImageVeiwを動かす
        
        println(deltaX)
        println(deltaY)
        println(point)
        println(location)
        self.imageView.frame.origin.x = self.imageView.frame.origin.x + deltaX
         self.imageView.frame.origin.y = self.imageView.frame.origin.y + deltaY
    }
    
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func selectBackground() {
        var imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.presentViewController(imagePickerController,animated: true, completion: nil)
        }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        var image: UIImage = info [UIImagePickerControllerEditedImage] as! UIImage
        haikeiImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func save(){
        let rect: CGRect = CGRectMake(0, 30, 320, 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(capture, nil, nil, nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
