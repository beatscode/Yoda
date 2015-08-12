//
//  Outputter.swift
//  YodaSpeaks
//
//  Created by Alex Casanova on 7/14/15.
//  Copyright (c) 2015 Alex Casanova. All rights reserved.
//

import Foundation


class Outputter{
    var originalString:String
    
    init(rawString:String){
        originalString = rawString
    }
    
    func transform() -> String{
        println("Doing something with original String")
        return originalString
    }
}

class Leeter:Outputter{
    override init(rawString:String){
        super.init(rawString: rawString)
    }
    override func transform() -> String{
        originalString = originalString.stringByReplacingOccurrencesOfString("a", withString: "@", options: NSStringCompareOptions.LiteralSearch, range: nil)
        originalString = originalString.stringByReplacingOccurrencesOfString("e", withString: "3", options: NSStringCompareOptions.LiteralSearch, range: nil)
        originalString = originalString.stringByReplacingOccurrencesOfString("s", withString: "$", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return originalString
    }
}
class Text2Speecher:Outputter{
    override init(rawString:String){
        super.init(rawString: rawString)
    }
}

