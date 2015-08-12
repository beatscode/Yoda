//
//  ViewController.swift
//  YodaSpeaks
//
//  Created by Alex Casanova on 7/13/15.
//  Copyright (c) 2015 Alex Casanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sentence:String = String()
    
    @IBOutlet weak var TVOutput: UITextView!
    @IBOutlet weak var TextViewYodaInput: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
        TextViewYodaInput.text = sentence
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendSentenceToYoda(sender: AnyObject) {
        var yoda = YodaAPI.Mashape
        var phrase = TextViewYodaInput.text
        var sentence = yoda.validate(phrase)
        
        if  sentence == nil {
            
            let alertCtrl = UIAlertController(title: "Sorry :(", message: "Yoda is sleeping try typing more to wake him up", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alertCtrl.addAction(action)
            presentViewController(alertCtrl, animated: true, completion: nil)
            
        }else{
            if let cleanSentence = yoda.cleanSentence(phrase) {
                var yodaResponse = yoda.call(cleanSentence, outputter:YodaAPI.Outputter.Raw)
                TVOutput.text = yodaResponse
            }
        }
    }
    
}