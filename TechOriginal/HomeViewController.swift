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
        
        
        // ここより下記はsetupPageMenu()などの外にメソッド化してあげた方が良いでしょう
        // viewDidLoadのメソッド内部の処理が肥大化していき、HomeViewControllerのここは膨大になっていき後々何しているか管理や保守が難しくなっていく(可読性が落ちるという)

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
        /*
         このようにUIViewControllerを継承した、クラスをappend
         */
        if let timeLineVC = storyboard?.instantiateViewController(withIdentifier: "TimeLineViewController") {
            timeLineVC.title = "TimeLine"
            controllerArray.append(timeLineVC)
        }
        
        if let galleryVC = storyboard?.instantiateViewController(withIdentifier: "GalleryViewController") {
            galleryVC.title = "Gallery"
            controllerArray.append(galleryVC)
        }
        
        if let listVC = storyboard?.instantiateViewController(withIdentifier: "ListViewController") {
            listVC.title = "List"
            controllerArray.append(listVC)
        }
        
        //Pagemenuのカスタマイズ(option)
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
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
