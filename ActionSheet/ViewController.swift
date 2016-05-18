//
//  ViewController.swift
//  ActionSheet
//
//  Created by XCODE on 2015/12/10.
//  Copyright © 2015年 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIActionSheetDelegate {
    
    var m_ImgView:UIImageView?
    var m_label:UILabel?
    

//MARK: - Normal function
//-------------------------------------
    func refreashWithFrame(frame:CGRect){
        
        self.view.frame = frame
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        //m_ImgView
        m_ImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width))
        m_ImgView?.center = CGPoint(x: frame.size.width/2, y: frame.size.width/2)
        m_ImgView?.image = UIImage(named: "av.png")
        self.view.addSubview(m_ImgView!)
        
        //m_label
        m_label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width/3))
        m_label?.center = CGPoint(x: frame.size.width/2, y: frame.size.height/8*5.25)
        m_label?.textColor = UIColor.redColor()
        m_label?.text = "100 %"
        m_label?.textAlignment = NSTextAlignment.Center
        m_label?.font = UIFont.boldSystemFontOfSize(m_label!.frame.size.width/4)
        m_label?.adjustsFontSizeToFitWidth = true//自動符合 label 寬度(如字太多)
        m_label?.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(m_label!)
        
        //scaleBt
        let scaleBt:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/5))
        scaleBt.center = CGPoint(x: frame.size.width/2, y: frame.size.height/8*7)
        scaleBt.backgroundColor = UIColor.lightGrayColor()
        scaleBt.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        scaleBt.setTitle("變換圖片大小", forState: UIControlState.Normal)
        scaleBt.titleLabel?.font = UIFont.boldSystemFontOfSize(scaleBt.frame.size.width/10)
        scaleBt.titleLabel?.adjustsFontSizeToFitWidth = true
        scaleBt.addTarget(self, action: #selector(ViewController.onScaleBtAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(scaleBt)
        
    }
    
//MARK: - onScaleBtAction
//-------------------------------------
    func onScaleBtAction(sender:UIButton) {
        
        let actionSheet:UIActionSheet = UIActionSheet(title: "選擇預更換的比例", delegate: self, cancelButtonTitle: "返回", destructiveButtonTitle: "100 %", otherButtonTitles: "70 %", "30%")
        
        actionSheet.showInView(self.view)
       
    }

//MARK: - actionSheetdelegate
//-------------------------------------
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        var percentage = 1.0
    
        print("\(buttonIndex)")
        
        switch buttonIndex {
            
        case 0:
            percentage = 1.0
            
        case 2:
            percentage = 0.7
            
        case 3:
           percentage = 0.3
            
        default:
           break
            
        }
        
        let sizeW:CGFloat = self.view.frame.size.width * CGFloat(percentage)
 
        m_label?.text = "\(Int(percentage * 100)) %"
        
        UIView.beginAnimations("scale", context: nil)
        UIView.setAnimationDuration(1.5)
        m_ImgView?.frame = CGRect(x: 0, y: 0, width: sizeW, height: sizeW)
        m_ImgView?.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.width / 2)
        UIView.commitAnimations()
       
    }
    
    
    


    
    
    
}

