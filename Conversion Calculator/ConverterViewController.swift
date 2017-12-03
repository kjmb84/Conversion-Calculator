
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Kean M on 11/10/17.
//  Copyright © 2017 Kean M. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputType: UILabel!
    @IBOutlet weak var outputType: UILabel!
    
    let converterClass = ConverterClass()
    var hasDecimal = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputType.text = converterClass.currentConverter.input
        outputType.text = converterClass.currentConverter.output
        inputLabel.text = "0"
        setOutputLabel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterAction(_ sender: UIButton) {
        let alertController = UIAlertController.init(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)
        for convert in converterClass.converters {
            let action = UIAlertAction.init(title: convert.label, style: .default, handler: {
                _ in
                self.newConverterSelection(title: convert.label)
            })
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func newConverterSelection(title: String) {
        converterClass.changeConverter(title: title)
        inputType.text = converterClass.currentConverter.input
        outputType.text = converterClass.currentConverter.output
        setOutputLabel()
    }
    
    @IBAction func clearFields(_ sender: Any) {
        inputLabel.text = "0"
        hasDecimal = false
        setOutputLabel()
    }
    
    @IBAction func signFlip(_ sender: Any) {
        if (hasDecimal) {
            inputLabel.text = String(-Double(inputLabel.text!)!)
        } else {
            inputLabel.text = String(-Int(inputLabel.text!)!)
        }
        setOutputLabel()
    }
    
    func updateConverter(newInput: String) {
        if inputLabel.text == "0" {
            inputLabel.text = newInput
        } else {
            inputLabel.text = inputLabel.text! + newInput
        }
        setOutputLabel()
    }
    
    func setOutputLabel() {
        if let number = inputLabel.text {
            outputLabel.text = converterClass.converterFunction(input: number, identifier: converterClass.currentConverter.identifier)
        } else {
            outputLabel.text = "0"
        }
    }
    
    @IBAction func pressNine(_ sender: Any) {
        updateConverter(newInput: "9")
    }
    
    @IBAction func pressEight(_ sender: Any) {
        updateConverter(newInput: "8")
    }
    
    @IBAction func pressSeven(_ sender: Any) {
        updateConverter(newInput: "7")
    }
    
    @IBAction func pressSix(_ sender: Any) {
        updateConverter(newInput: "6")
    }
    
    @IBAction func pressFive(_ sender: Any) {
        updateConverter(newInput: "5")
    }
    
    @IBAction func pressFour(_ sender: Any) {
        updateConverter(newInput: "4")
    }
    
    @IBAction func pressThree(_ sender: Any) {
        updateConverter(newInput: "3")
    }
    
    @IBAction func pressTwo(_ sender: Any) {
        updateConverter(newInput: "2")
    }
    
    @IBAction func pressOne(_ sender: Any) {
        updateConverter(newInput: "1")
    }
    
    @IBAction func pressZero(_ sender: Any) {
        updateConverter(newInput: "0")
    }
    
    @IBAction func pressDecimal(_ sender: Any) {
        if inputLabel.text?.index(of: ".") == nil, hasDecimal == false {
            inputLabel.text = inputLabel.text! + "."
            hasDecimal = true
        }
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
