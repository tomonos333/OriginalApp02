//
//  WordSelectViewController.swift
//  TechOriginal
//
//  Created by Tomohiro Kouketsu on 2017/07/09.
//  Copyright © 2017年 tomo_nos. All rights reserved.
//

import UIKit
import Cartography

/// テンプレート選択画面
class WordSelectViewController: UIViewController {
    
    /// スクロールビュー
    @IBOutlet weak var scrollView: UIScrollView!
    
    /// ページコントロール
    @IBOutlet weak var pageControl: UIPageControl!
    
    /// テンプレートのボタンスタックビュー
    @IBOutlet weak var tempButtonStackView: UIStackView!
    
    /// テンプレートのボタン ※最初の画像当て込みとサイズ、autoLayout持ち回しで扱うため
    @IBOutlet weak var tempButton: TempButton!
    
    // TODO: デバッグ挿入
    /// テンプレートの画像名配列
    fileprivate let tempImgNameList: [String] = ["template1", "template2", "template3", "template4", "template5", "template6"]
    
    /// ボタン設定後格納配列 (こいつの中ののどれがselectedで選択しているか判断できる)
    fileprivate var tempButtonList: [TempButton] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクロールビューセットアップ
        setupPageScrollView()
        
        print("\(#function): \(scrollView.frame)")
        
        print("\(#function): \(scrollView.contentSize)")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("\(#function): \(scrollView.frame)")
        
        print("\(#function): \(scrollView.contentSize)")
        
        // レイアウト適用後 ページ設定(小数第一位以下は切り上げて適用)
        pageControl.numberOfPages = Int((scrollView.contentSize.width / scrollView.frame.width).rounded(.up))
    }
    
    /// スクロールビュー設定
    private func setupPageScrollView() {
        
        // 画像配列分for文でぶん回すイメージ
        // flatMapやenumeratedなど配列を扱うのに役立つ関数で操作処理しています。
        // 見慣れない感じでとっつきにくいかもですが、知っておくと関数型プログラミング言語はとっつきやすくなりますので、これを機に覚えると良いです。
        tempButtonList =
            tempImgNameList
                .map { UIImage(named: $0) }             // 画像名配列をUIImageに変換して返す
                .enumerated()                           // 配列番号を用いる(tempButtonタグ付け)ためenumerated
                .map { index, image in                  // Tempボタンそれぞれ定義して返却
                    
                    // 0番目のみそのまま　IBOutletに適用
                    // それ以外はself.tempbuttonをコピー
                    let cpTempButton: TempButton = index == 0 ? self.tempButton : TempButton()
                    
                    // 画像適用
                    cpTempButton.setImage(image, for: .normal)
                    
                    // タグ付け
                    cpTempButton.tag = index
                    
                    // アクション設定
                    cpTempButton.addTarget(self, action: #selector(tapTempButton(_:)), for: .touchUpInside)
                
                    if index != 0 {
                        
                        // size, autolayout取り回し (IBOutletはcopy非推奨なので)
                        cpTempButton.frame = self.tempButton.frame
                        constrain(cpTempButton) {
                            $0.width == self.tempButton.frame.width
                            $0.height == self.tempButton.frame.height
                        }
                        
                        // 画像配列の最初はすでにaddしているため、それ以外
                        // UIStackViewにadd
                        self.tempButtonStackView.addArrangedSubview(cpTempButton)
                    }
                    
                    // 返却
                    return cpTempButton
        }
    }
    
    /// ページを変更した時に呼ばれる
    ///
    /// - Parameter sender: UIPageControl
    @IBAction func pageValueChanged(_ sender: UIPageControl) {
        
        // オフセット計算
        // (scrollViewのframeマックスX x 現在ページ) + scrollViewのフレームwidthを超えるcontenSize超えるなら超える分引いてセット
        let willSetOffsetX = scrollView.frame.maxX * CGFloat(sender.currentPage) + scrollView.frame.width - scrollView.contentSize.width
        let scrollOffsetX = willSetOffsetX > 0 ? scrollView.frame.maxX * CGFloat(sender.currentPage) - willSetOffsetX : scrollView.frame.maxX * CGFloat(sender.currentPage)
        
        // スクロールビューのコンテントオフセットFIX
        scrollView.setContentOffset(CGPoint(x: scrollOffsetX, y: 0), animated: true)
    }
    
    /// ボタンタップ時アクション
    ///
    /// - Parameter sender: TempButton
    func tapTempButton(_ sender: TempButton) {
        
        // ボタンタップ時の選択処理
        tempButtonList.forEach {
            if sender.tag == $0.tag {
                // タグの一致するものだけselectをON
                $0.isSelected = true
            } else {
                // それ以外はselectをOFF
                $0.isSelected = false
            }
        }
    }
}

// MARK: - UIScrollViewDelegate
extension WordSelectViewController: UIScrollViewDelegate {
    
    /// スクロール停止時に呼ばれる
    ///
    /// - Parameter scrollView: UIScrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 現ページFIX
        pageControl.currentPage = Int((scrollView.contentOffset.x / scrollView.frame.maxX).rounded(.up))
    }
}

