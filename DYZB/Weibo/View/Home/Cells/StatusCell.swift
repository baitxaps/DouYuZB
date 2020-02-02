//
//  StatusCell.swift
//  DYZB
//
//  Created by hairong chen on 2020/2/1.
//  Copyright © 2020 @huse.cn. All rights reserved.
//

import UIKit

let StatusCellMargin:CGFloat = 12
let StatusCellIconWidth:CGFloat = 35

// weibo cell
class StatusCell: UITableViewCell {
    //MARK:- viewModel
    var viewModel:StatusViewModel? {
        didSet {
            topView.viewModel = viewModel
            contentLabel.text = viewModel?.status.text
        }
    }
    
    //MARK:- init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var topView : StatusCellTopView = StatusCellTopView()
    private lazy var contentLabel :UILabel = UILabel(title: "微博正文", fontSize: 15 ,color: UIColor.darkGray,screenInset: StatusCellMargin)
    private lazy var bottomView:StatusCellBottomView = StatusCellBottomView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension StatusCell {
    private func setupUI() {
        contentView.addSubview(topView)
        contentView.addSubview(contentLabel)
        contentView.addSubview(bottomView)
        
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(2 * StatusCellMargin + StatusCellIconWidth)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(StatusCellMargin)
            make.left.equalTo(contentView.snp.left).offset(StatusCellMargin)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(StatusCellMargin)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(44)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
















