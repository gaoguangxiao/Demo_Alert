//
//  ViewController.swift
//  Demo_Alert
//
//  Created by gaoguangxiao on 2022/8/9.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .magenta
        
        let title = UILabel()
        title.text = "Hello,world"
        title.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        let leftModel = GGXAlertModel()
        leftModel.title = "Title1"
        leftModel.content = "We're going to click ‘Open Model’to see more cantant an overlay"
        leftModel.des = "I orem insum dolor sit amet consectetur adipiscing elit, sed do elusmod tempor incididunt ut labore el dolore magna aliqua Ut enim ad minim veniam, auis nostrud exercitation ulamco laboris nisi ut àliquio ex ea commodo consequat. Duis aute irure dolor in reprehenderit In voluptato velit esse ilum dolore eu fugiat nulla paratur. Excepteur sint occaecat cupidatat non proident sunt in cu pa qui officia deseruni molit anim in estanorum I orem insum dolor sit amet. consectetur adipiscina olit, sed do olusmod temporIncididunt ut labore el dolore magna aliqua. Ut enim ad minim veniam, auis nostrud exercitation ulamco laboris nisi ut aliquio ex ea commod        conseguat Duis aute irure dolor in reprehenderit in voluptate velitesseciluen m doore eu fugiat nula pariatur Excepteur sint occaecat esse cupidatat non proident sunt in culpa qui officia de serunt mollit anim id est laborum"
        
        let rightModel = GGXAlertModel()
        rightModel.title = "Title2"
        rightModel.content = "We're going to click ‘Open Model’to see more cantant an overlay"
        rightModel.des = "I orem insum dolor sit amet consectetur adipiscing elit, sed do elusmod tempor incididunt ut labore el dolore magna aliqua Ut enim ad minim veniam, auis nostrud exercitation ulamco laboris nisi ut àliquio ex ea commodo consequat. Duis aute irure dolor in reprehenderit In voluptato velit esse ilum dolore eu fugiat nulla paratur. Excepteur sint occaecat cupidatat non proident sunt in cu pa qui officia deseruni molit anim in estanorum I orem insum dolor sit amet. consectetur adipiscina olit, sed do olusmod temporIncididunt ut labore el dolore magna aliqua. Ut enim ad minim veniam, auis nostrud exercitation ulamco laboris nisi ut aliquio ex ea commod        conseguat Duis aute irure dolor in reprehenderit in voluptate velitesseciluen m doore eu fugiat nula pariatur Excepteur sint occaecat esse cupidatat non proident sunt in culpa qui officia de serunt mollit anim id est laborum"
        
        let leftBg = GGXBgView(frame: CGRect.zero, model: leftModel)
        leftBg.BlockAction = { []  model in
            
            self.showAlertView(model: model)
        }
        
        let rightBg = GGXBgView(frame: .zero, model: rightModel)
        rightBg.BlockAction = { []  model in
            
            self.showAlertView(model: model)
        }
        
        view.addSubview(leftBg)
        view.addSubview(rightBg)
        
        leftBg.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(60)
            make.left.equalTo(20)
            make.height.equalTo(250)
            make.right.equalTo(rightBg.snp.left).offset(-10)
        }
        
        
        rightBg.snp.makeConstraints { make in
            make.top.equalTo(leftBg.snp.top)
            make.right.equalTo(-20)
            make.width.equalTo(leftBg.snp.width)
            make.bottom.equalTo(leftBg.snp.bottom)
        }
        
        leftBg.layer.cornerRadius = 10
        rightBg.layer.cornerRadius = 10
        
    }


    //展示弹框
    func showAlertView(model:GGXAlertModel) {
        
        let window = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        window?.addSubview(alertBgView)
        alertBgView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        let alertView = GGXAlertView(frame: CGRect.zero, alertModel: model)
        alertView.BlockCloseAction = {
            
            UIView.animate(withDuration: 0.25) {
                self.alertBgView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            } completion: { [self] b in
                alertBgView.removeFromSuperview()
            }

        }
        
        alertBgView.addSubview(alertView)
        alertView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.bottom.equalTo(-100)
        }
       
        alertView.layer.cornerRadius = 10
        
        UIView.animate(withDuration: 0.25, delay: 0) {
            
            self.alertBgView.frame = UIScreen.main.bounds
            
        }
    }
    
    
    lazy var alertBgView: UIView = {
        let v = UIView()
        v.backgroundColor = .init(white: 0.0, alpha: 0.5)
        v.alpha = 1.0
        return v
    }()
    
}

