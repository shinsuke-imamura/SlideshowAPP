//
//  ResultViewController.swift
//  SlideshowAPP
//
//  Created by 今村仁亮 on 2016/05/12.
//  Copyright © 2016年 今村仁亮. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController,UIScrollViewDelegate{

     //@IBOutlet weak var ImageButton : UIButton!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var myScrollView : UIScrollView!
    var x : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
       // ImageButton.setBackgroundImage(x, forState: .Normal)
        
        //ScrollViewの設定
        self.myScrollView.delegate=self
        self.myScrollView.minimumZoomScale=1
        self.myScrollView.maximumZoomScale=5
        //スクロールさせる
        self.myScrollView.scrollEnabled=true
        //横スクロールバーの表示
        self.myScrollView.showsHorizontalScrollIndicator=true
        //縦スクロールバーの表示
        self.myScrollView.showsVerticalScrollIndicator=true
        
       imageView.image=x

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
