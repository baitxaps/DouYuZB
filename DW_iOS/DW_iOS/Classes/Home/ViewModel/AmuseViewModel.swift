//
//  AmuseViewModel.swift
//  DYZB
//
//  Created by hairong chen on  10/10.
//  Copyright @huse.cn All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel {
   
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
