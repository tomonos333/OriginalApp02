//
//  ViewController.swift
//  TechOriginal
//
//  Created by Tomohiro Kouketsu on 2017/07/09.
//  Copyright © 2017年 tomo_nos. All rights reserved.
//

import UIKit
import ESTabBarController
import PageMenu

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTab()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    
    //タブ画面の作成
    func setupTab() {
        
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["home", "camera", "setting"])
        
        // 背景色、選択時の色を設定する
        //selectedColorプロパティで背景色を、buttonsBackgroundColorプロパティで選択時の色を設定
        tabBarController.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        tabBarController.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        
        //addChildViewControllerメソッドとdidMove:toParentViewControllerメソッドはセットで使用
        //親のViewController(ViewController.swift)のaddChildViewControllerメソッドで追加するViewControllerを指定し、
        //子のViewControllerのdidMove:toParentViewControllerメソッドで追加の完了を伝達
        
        //addChildViewControllerメソッドとdidMove:toParentViewControllerメソッドの間に追加するときに行う処理を記述
        //→ここではaddSubviewメソッドで子のViewControllerのViewを追加し、そのViewのframeを親のViewControllerのViewと同じ値に
        addChildViewController(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.view.frame = view.bounds
        tabBarController.didMove(toParentViewController: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let settingViewController = storyboard?.instantiateViewController(withIdentifier: "Setting")
        
        tabBarController.setView(homeViewController, at: 0)
        tabBarController.setView(settingViewController, at: 2)
        
        // 真ん中のタブはボタンとして扱う
        //highlightButton:atメソッド ;真ん中のタブはボタンとして扱う設定
        //setActionメソッド ;タップされたときの処理を記述
        tabBarController.highlightButton(at: 1)
        tabBarController.setAction({
            // ボタンが押されたらImageViewControllerをモーダルで表示する
            let imageViewController = self.storyboard?.instantiateViewController(withIdentifier: "WordSelect")
            self.present(imageViewController!, animated: true, completion: nil)
        }, at: 1)
    }
    

}

