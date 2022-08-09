//
//  GGXAlertView.swift
//  Demo_Alert
//
//  Created by gaoguangxiao on 2022/8/9.
//

import Foundation
import UIKit

class GGXAlertView: UIView {

    var BlockCloseAction : (() -> Void)?
    
    init(frame: CGRect,alertModel:GGXAlertModel) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(contentTextView)
        addSubview(openBtn)
        
        titleLabel.text = alertModel.title
        contentTextView.text = alertModel.des
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.top.equalTo(40)
            make.height.equalTo(30)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(-40)
            make.bottom.equalTo(openBtn.snp.top).offset(-10)
        }
        
        openBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(90)
            make.bottom.equalTo(-40)
        }
        
        backgroundColor = .white
    }
    
    @objc func actionOpenModel(sender:UIButton) {
       BlockCloseAction?()
    }
    
    //标题
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        return l
    }()
    //内容
    lazy var contentTextView: UITextView = {
        let l = UITextView()
        l.font = UIFont.systemFont(ofSize: 12)
        l.isEditable = false
        return l
    }()
    //关闭按钮
    lazy var openBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitle("Close Model", for: .normal)
        btn.layer.cornerRadius = 20
        btn.setTitleColor(.orange, for: .normal)
        btn.layer.borderColor = UIColor.orange.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(actionOpenModel), for: .touchUpInside)
        return btn
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
