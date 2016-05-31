//
//  ViewController.swift
//  SlideshowAPP
//
//  Created by 今村仁亮 on 2016/05/12.
//  Copyright © 2016年 今村仁亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var images=["img1.jpg","img2.jpg","img3.jpg","img4.jpg"]
    var timer:NSTimer!
    var countnumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    //画像を呼び出す関数の宣言
    func imageDisplay(){
       let photoImage=UIImage(named: images[countnumber])
       ImageButton.setBackgroundImage(photoImage, forState: .Normal)
    
        
    }
    //次のボタンを押した時の関数
    func nextPage(){
        if countnumber<images.count-1{
            countnumber += 1
        }else if countnumber == images.count-1{
            countnumber = 0
        }
        imageDisplay()
    }
    //TIMERの関数
    func Slidshow(){
        // NSTimer.scheduledTimerWithTimerIn
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: (#selector(ViewController.nextPage)), userInfo: nil, repeats: true)
    }
   
    @IBAction func NextButton(sender: UIButton) {
        
               nextPage()
    }
    @IBAction func StartButton(sender: UIButton) {
        if timer == nil{
            //タイマーが動いていない時、Slidshow関数を呼び出す
            Slidshow()
            
            sender.setTitle("停止", forState: UIControlState.Normal)
            
            nextButton.enabled=false
            nextButton.setTitle("", forState: UIControlState.Normal)
            
            returnButton.enabled=false
            returnButton.setTitle("", forState: UIControlState.Normal)
        }else{
            //タイマーを破棄する
            timer?.invalidate()
            timer = nil
            
            sender.setTitle("再生", forState: UIControlState.Normal)
            
            nextButton.enabled=true
            nextButton.setTitle("進む", forState: UIControlState.Normal)
            
            returnButton.enabled=true
            returnButton.setTitle("戻る", forState: UIControlState.Normal)
        }
    }
    //戻るボタンを押した時
    @IBAction func ReturnButton(sender: UIButton) {
        if countnumber > 0{
            countnumber -= 1
        }else if countnumber<=0{
            countnumber=images.count-1
            
        }
        imageDisplay()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //遷移先のインスタンスを取得。UIViewControllerからResultViewControllerに変換
        let resultViewController:ResultViewController = segue.destinationViewController as! ResultViewController
        
        resultViewController.x=UIImage(named: images[countnumber])
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }


}
