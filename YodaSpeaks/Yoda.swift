//
//  Yoda.swift
//  YodaSpeaks
//
//  Created by Alex Casanova on 7/13/15.
//  Copyright (c) 2015 Alex Casanova. All rights reserved.
//

import UIKit

public enum YodaAPI{
    case ShopKeep, Mashape
    
    func getEndpoint() -> String {
        switch self {
            case .Mashape: return "https://yoda.p.mashape.com/yoda"
            case .ShopKeep: return "https://random-yoda-api.shopkeep.com"
        }
    }
    
    public enum Outputter{
        case Raw, Leet, Text2Speech
        
        public func Format(yodaResponse:String) -> String{
            
            var output:String = String()
            
            switch self{
            case .Raw:
                output = yodaResponse
            case .Leet:
                println("Instantiate Leet class")
                var leetOutputter = Leeter(rawString: yodaResponse)
                output = leetOutputter.transform()
            case .Text2Speech:
                println("Instantiate Text2Speech class")
                var text2speech = Text2Speecher(rawString: yodaResponse)
                output = text2speech.transform()
            default:
                println("Could not format \(self)")
            }
            
            return output
        }
    }
    
    public func validate(sentence:String) -> String? {
        if sentence.isEmpty {
            return nil
        }
        
        return sentence
    }
    
    public func cleanSentence(sentence:String) -> String?{
        //Prep string for get url
        var cleanSentence = sentence.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return cleanSentence
    }
    
    public func call(sentence:String, outputter:Outputter) -> String{
        
        let url = NSURL(string: self.getEndpoint().stringByAppendingString(sentence))
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(string: self.getEndpoint())!,
            cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 45);
        var err:NSError?;
        var response:NSURLResponse?
        
        request.setValue("Q0bLPuslcsmshb0USowc9fcXIPgWp1O6wJpjsnWQ5ArKLZqmyU", forHTTPHeaderField: "X-Mashape-Key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("text/plain",forHTTPHeaderField: "Accept")
        request.HTTPMethod = "GET"
    
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &err)
        
        // Take a look at the response
        if let httpResponse = response as? NSHTTPURLResponse {
            println("HTTP response: \(httpResponse.statusCode)")
        } else {
            println("No HTTP response")
        }
        
        if (err != nil ){
            println(err)
        }
        
        var reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        var finalOutput = outputter.Format(reply as! String)
        
        return finalOutput
    }
}

