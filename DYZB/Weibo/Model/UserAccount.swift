//
//  UserAccount.swift
//  DYZB
//
//  Created by hairong chen on 2020/1/18.
//  Copyright © 2020 @huse.cn. All rights reserved.
//

import UIKit
/*
 as:转换
 1.String as NSString
 2.NSArray as [array]
 3.NSDictionary as [String:AnyObjec]
 
其他类型
 tmp是?.!, 后转换也as?,as!
 var tmp:String? ==> uid as? String
 
 guard let as后用? :as?
 guard let dict = result as? [String:AnyObject] else {}
*/

@objcMembers
class UserAccount: NSObject,NSCoding {
    var access_token:String?
    var uid:String?
    var expiresDate:NSDate?
    var screen_name:String?
    var avator_large:String?
    var expires_in:TimeInterval = 0 {
        didSet {
            //access_toke 计算过期日期
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }

    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    override var description:String {
        let keys = ["access_token","expires_in","expiresDate","uid","avator_large","screen_name"]
        return dictionaryWithValues(forKeys: keys).description
    }
    
    // 解档
    required init?(coder: NSCoder) {
        access_token = coder.decodeObject(forKey: "access_toke") as? String
        uid = coder.decodeObject(forKey: "uid") as? String
        screen_name = coder.decodeObject(forKey: "screen_name") as? String
        avator_large = coder.decodeObject(forKey: "avator_large") as? String
        expiresDate = coder.decodeObject(forKey: "expiresDate") as? NSDate
    }
    
    // 归档
    func encode(with coder: NSCoder) {
        coder.encode(access_token, forKey: "access_toke")
        coder.encode(uid, forKey: "uid")
        coder.encode(screen_name, forKey: "screen_name")
        coder.encode(avator_large, forKey: "avator_large")
        coder.encode(expiresDate, forKey: "expiresDate")
    }
    
    func saveUserAccount() {
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        path = (path as NSString).appendingPathComponent("account.plist")
        print(path)
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
    }
}
