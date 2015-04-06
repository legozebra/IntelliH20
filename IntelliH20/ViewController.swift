//
//  ViewController.swift
//  IntelliH20
//
//  Created by Lego Zebra on 4/3/15.
//  Copyright (c) 2015 IntelliNinja Productions. All rights reserved.
//



import UIKit

class ViewController: UIViewController, NRFManagerDelegate {

    
    
    var nrfManager:NRFManager!
    
    override func viewDidLoad()
    {
        // Do any additional setup after loading the view, typically from a nib.
        
        super.viewDidLoad()
        nrfManager = NRFManager(delegate:self)
        println("Created nrfManager")
    }
    
    func sendData()
    {
        let result = self.nrfManager.writeString("Hello, world!")
    }
    
    // NRFManagerDelegate methods
    
    func nrfDidConnect(nrfManager:NRFManager)
    {
        println("Connected")
        self.sendData()
    }
    
    func nrfDidDisconnect(nrfManager:NRFManager)
    {
        println("Disconnected")
    }
    
    func nrfReceivedData(nrfManager:NRFManager, data: NSData, string: String) {
        println("Received data - String: \(string) - Data: \(data)")
    }
  
    @IBOutlet weak var inputdata: UITextField!
    @IBOutlet weak var answer: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Button(sender: AnyObject) {
        var answer1 = inputdata.text.toInt()
  
        println("in the loop")

        if answer1 > -1 && answer1 < 40 {
            answer.text = "Safe to drink!"
            answer.textColor = UIColor.greenColor ()
        } else if answer1 > 40 && answer1 < 70 {
            answer.text = "Warning! Don't risk drinking."
            answer.textColor = UIColor.yellowColor ()
        } else if answer1 > 70 {
            answer.text = "Do not drink!"
            answer.textColor = UIColor.redColor ()
        } else {
            answer.text = "String or negative value entered"
            answer.textColor = UIColor.redColor ()
            
        }
    }

}

