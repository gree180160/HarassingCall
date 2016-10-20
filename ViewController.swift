//
//  ViewController.swift
//  HarassingCall
//
//  Created by WillowRivers on 16/10/20.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    var number : UITextField! ;
    var callTheBitch : UIButton! ;
    var forgiveTheIdiot : UIButton! ;
    var timer : Timer! ;
    override func viewDidLoad() {
        super.viewDidLoad() ;
        let useW = self.view.frame.width - 10 ;
        number = UITextField(frame: CGRect(x: 5 , y: 50 , width: useW , height: 100)) ;
        number.keyboardType = .numberPad ;
        number.text = "8643445" ;
        number.textAlignment = .center ;
        number.font = UIFont(name: "DBLCDTempBlack", size: 40) ;
        number.backgroundColor = UIColor.green ;
        number.layer.cornerRadius = 15 ;
        number.delegate = self ;
        
        
        //about button
        callTheBitch = UIButton(frame: CGRect(x: 5  , y: 160 , width: useW , height: 100)) ;
        callTheBitch.setTitle("弄死他", for: .normal) ;
        callTheBitch.backgroundColor = UIColor.red ;
        callTheBitch.addTarget(self , action: "harass" , for: .touchUpInside) ;
        callTheBitch.layer.cornerRadius = 15 ;
        
        forgiveTheIdiot = UIButton(frame: CGRect(x: 5 , y: 270 , width: useW , height: 100)) ;
        forgiveTheIdiot.setTitle("放过她", for: .normal) ;
        forgiveTheIdiot.backgroundColor = UIColor.blue ;
        forgiveTheIdiot.addTarget(self , action: "stopCall" , for: .touchUpInside) ;
        forgiveTheIdiot.layer.cornerRadius = 15 ;
        
        self.view.addSubview(number) ;
        self.view.addSubview(callTheBitch) ;
        self.view.addSubview(forgiveTheIdiot) ;
        
       
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        number.resignFirstResponder() ;
    }
    
    func harass() -> Void {
        if self.number.text?.characters.count == 7 || self.number.text?.characters.count == 11
        {
            let url = URL(string: "tel://" + number.text!) ;
            timer = Timer.scheduledTimer(withTimeInterval: 2 , repeats: true, block: { _ in
                print("use timer") ;
                UIApplication.shared.open(url! , options: [:], completionHandler: nil) ;})
        }
        else if self.number.text?.characters.count == 5
        {
            let alertC = UIAlertController(title: "不够有趣", message: "打客服电话就没趣了吧！！！", preferredStyle: .actionSheet) ;
            let action = UIAlertAction(title: "知错了", style: .default , handler: nil) ;
            alertC.addAction(action) ;
            self.present(alertC , animated: true , completion: nil) ;
        }
        else
        {
            let alertC = UIAlertController(title: "友情提醒", message: "不会输号码我可帮不了你！！！", preferredStyle: .actionSheet) ;
            let action = UIAlertAction(title: "知错了", style: .default , handler: nil) ;
            alertC.addAction(action) ;
            self.present(alertC , animated: true , completion: nil) ;
        }
    }

    func stopCall() -> Void {
        guard timer != nil else {
            return ;
        }
        timer.invalidate() ;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

