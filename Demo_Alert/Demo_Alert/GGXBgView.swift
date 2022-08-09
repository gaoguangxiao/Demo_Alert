//
//  GGXBgView.swift
//  Demo_Alert
//
//  Created by gaoguangxiao on 2022/8/9.
//

import Foundation
import UIKit

class GGXBgView: UIView {
    
    var BlockAction : (( _ model:GGXAlertModel) -> Void)?
    var localModel : GGXAlertModel?
    
    init(frame: CGRect,model:GGXAlertModel) {
        super.init(frame: frame)
        backgroundColor = .gray
        
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(openBtn)
        
        localModel = model
        titleLabel.text = model.title
        contentLabel.text = model.content
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.top.equalTo(30)
            make.height.equalTo(20)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(-30)
            make.bottom.equalTo(openBtn.snp.top).offset(10)
        }
        
        openBtn.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.height.equalTo(40)
            make.right.equalTo(-40)
            make.bottom.equalTo(-40)
        }
                
    }
    
    @objc func actionOpenModel(sender:UIButton) {
        
        if let m = localModel {
            BlockAction?(m)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18)
        
        return l
    }()
    
    lazy var contentLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.numberOfLines = 0
        return l
    }()
    
    lazy var openBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitle("Open Model", for: .normal)
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.orange.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(actionOpenModel), for: .touchUpInside)
        return btn
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
