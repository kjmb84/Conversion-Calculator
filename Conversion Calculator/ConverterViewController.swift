
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Kean M on 11/10/17.
//  Copyright © 2017 Kean M. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    struct converter {
        var label: String
        var input: String
        var output: String
    }
    
    var converters: [converter]?
    
    var currentConverter: converter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converters = [
            converter(label: "fahrenheit to celcius", input: "°F", output: "°C"),
            converter(label: "celcius to fahrenheit", input: "°C", output: "°F"),
            converter(label: "miles to kilomters", input: "mi", output: "km"),
            converter(label: "kilometers to miles", input: "km", output: "km")
        ]
        
        currentConverter = converters?[0]
        
        
        inputDisplay.text = currentConverter?.input
        outputDisplay.text = currentConverter?.output
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func converterAction(_ sender: UIButton) {
        let alertController = UIAlertController.init(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)
        for convert in converters! {
            let action = UIAlertAction.init(title: convert.label, style: .default)
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
