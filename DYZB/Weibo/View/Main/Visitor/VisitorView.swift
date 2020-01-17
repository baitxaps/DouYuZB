//
//  VisitorView.swift
//  DYZB
//
//  Created by hairong chen on 2020/1/16.
//  Copyright © 2020 @huse.cn. All rights reserved.
// 代码行数数统计 (wc:word count)
// find . -name ".swift" | xargs wc -l

import UIKit
import SnapKit

class VisitorView: UIView {
    func setupInfo(imageName:String?,title:String) {
        messageLabel.text = title
        guard let imgName = imageName else {
            startAnim()
            return
        }
        iconView.image = UIImage(named: imgName)
        homeIconView.isHidden = true
        
        // maskIconView 移动到底层
        sendSubviewToBack(maskIconView)
    }
    
    private func startAnim() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2*Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        //background,
        anim.isRemovedOnCompletion = false//不断重复的动画上,绑定的视被销毁，动画会自动销毁
        iconView.layer.add(anim,forKey: nil)
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setupUI()
    }
    
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    private lazy var maskIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    private lazy var homeIconView :UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    private lazy var messageLabel:UILabel = {
        let label = UILabel()
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var reginsterButton:UIButton = {
        let button = UIButton()
        button.setTitle("注册", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        return button
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("登录", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        return button
    }()
}

// 扩展中不能用存储属性
extension VisitorView {
    private func setupUI() {
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(reginsterButton)
        addSubview(loginButton)
        backgroundColor = UIColor(white: 237/255.0, alpha: 1.0)
        
        iconView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
        }
        
        maskIconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(iconView)
            make.bottom.equalTo(iconView)
        }
        
        homeIconView.snp.makeConstraints { (make) in
            make.center.equalTo(iconView)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp_bottomMargin).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerX.equalTo(iconView)
        }
        
        reginsterButton.snp.makeConstraints { (make) in
            make.top.equalTo(messageLabel.snp_bottomMargin).offset(15)
            make.right.equalTo(iconView.snp_centerXWithinMargins).offset(-15)
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
        
        loginButton.snp.makeConstraints { (make) in
             make.top.equalTo(messageLabel.snp_bottomMargin).offset(15)
             make.left.equalTo(iconView.snp_centerXWithinMargins).offset(15)
             make.width.equalTo(100)
             make.height.equalTo(36)
         }
    }
}


/*
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
 
 // 6> 遮罩图像
  // views: 定义 VFL 中的控件名称和实际名称映射关系
  // metrics: 定义 VFL 中 () 指定的常数影射关系
  let viewDict = ["maskIconView": maskIconView,
                  "registerButton": registerButton]
  let metrics = ["spacing": 20]
  
  addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-0-[maskIconView]-0-|",
      options: [],
      metrics: nil,
      views: viewDict))
  addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-0-[maskIconView]-(spacing)-[registerButton]",
      options: [],
      metrics: metrics,
      views: viewDict))
*/
