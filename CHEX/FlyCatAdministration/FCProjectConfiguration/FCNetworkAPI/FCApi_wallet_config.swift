//
//  FCApi_wallet_config.swift
//  FlyCatAdministration
//
//  Created by Yochi on 2020/8/15.
//  Copyright © 2020 Yochi. All rights reserved.
//

import UIKit
import UtilsXP

class FCApi_wallet_config: YTKRequest {

    ////symbol是资产符号，用资产和区块链网络组成，特别注意USDT资产
    ///包括: BTC, ETH, USDT_OMNI, USDT_ERC20等
    
    var symbol = ""
        
    init(symbol:String) {
        super.init()
        self.symbol = symbol
            
        self.add(YTKAnimatingRequestAccessory.accessoryWithAnimatingView() as! YTKRequestAccessory)
    }
        
    override func baseUrl() -> String {
        return FCNetAddress.netAddresscl().hosturl_API
    }
        
    override func requestUrl() -> String {
        return "/api/v1/wallet/config"
    }
        
    override func requestMethod() -> YTKRequestMethod {
        return .GET
    }
        
    override func requestArgument() -> Any? {
            
        return ["symbol":symbol]
    }
        
    override func requestHeaderFieldValueDictionary() -> [String : String]? {
        return requestHeaderFieldValue()
    }
    
    override func requestSerializerType() -> YTKRequestSerializerType {
        return .JSON
    }
}
