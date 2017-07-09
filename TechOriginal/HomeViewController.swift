//
//  HomeViewController.swift
//  TechOriginal
//
//  Created by Tomohiro Kouketsu on 2017/07/09.
//  Copyright © 2017年 tomo_nos. All rights reserved.
//

import UIKit
import PageMenu

class HomeViewController: UIViewController {
    
    //CAPSPageMenuのプロパティを追加
    var pageMenu : CAPSPageMenu?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        //
        // Array to keep track of controllers in page menu
        //表示したいViewControllerの配列
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        //var controller : UIViewController = UIViewController(nibName: "controllerNibName", bundle: nil)
        //controller.title = "SAMPLE TITLE"
        //controllerArray.append(controller)
        
        // 自分で表示したいViewControllerを書く。
        
        var timelinecontroller:UIViewController = UIViewController(nibName: "TimelineTableViewCell", bundle: nil)
        timelinecontroller.title = "TimeLine"
        controllerArray.append(timelinecontroller)

        var gallerycontroller:UIViewController = UIViewController(nibName: "GalleryCollectionViewCell", bundle: nil)
        gallerycontroller.title = "Gallery"
        controllerArray.append(timelinecontroller)

        
        var listcontroller:UIViewController = UIViewController(nibName: "ListTableViewCell", bundle: nil)
        listcontroller.title = "List"
        controllerArray.append(timelinecontroller)
        
        
        //Pagemenuのカスタマイズ(option)
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        //コントローラの配列、フレーム、およびオプションのパラメータでページを初期化する
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0.0, y:0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willMoveToPage(controller: UIViewController, index: Int){}
    
    func didMoveToPage(controller: UIViewController, index: Int){}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
