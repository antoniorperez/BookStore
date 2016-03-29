//
//  ViewController.swift
//  BookStore
//
//  Created by Antonio Rodríguez on 28/3/16.
//  Copyright © 2016 Antonio Rodríguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + textField.text!
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if(datos == nil){
            textView.text="Error al conectar con el servidor"
            textView.textColor = UIColor.redColor()
        }else{
            let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
            textView.text = texto as! String
            textView.textColor = UIColor.blackColor()
        }
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

