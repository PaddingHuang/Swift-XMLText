//
//  XMLTool.swift
//  XmlText
//
//  Created by HUA on 2017/7/5.
//  Copyright © 2017年 HUA. All rights reserved.
//

import UIKit
import KissXML
class XMLTool: NSObject {
    var  users : [DDXMLElement]?
    //单例
    static let shareXMLTool = XMLTool()
   
    
    //重写初始化方法
    override init() {
        super.init()
     self.testXML()
    }
    func testXML() {
        //获取xml文件路径
        let file = Bundle.main.path(forResource: "strings", ofType: "xml")
        let url = URL(fileURLWithPath: file!)
        //获取xml文件内容
        let xmlData = try! Data(contentsOf: url)
        
        //构造XML文档
        let doc = try! DDXMLDocument(data: xmlData, options:0)
        
        //利用XPath来定位节点（XPath是XML语言中的定位语法，类似于数据库中的SQL功能）
        let rootele = doc.rootElement()
        
        
       users = try! rootele?.nodes(forXPath: "//string") as! [DDXMLElement]
  
           }
    func getName(name:String)->String{
        for user in users! {
            //            let name = user.elements(forName: "string")
            let names = user.attribute(forName: "name")!.stringValue
            if names == name {
                
                return user.stringValue!
            }
            
        }
       return ""
    }
}
