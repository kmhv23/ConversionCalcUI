//
//  ViewController.swift
//  CalculatorUI
//
//  Created by Kevin Hunkins on 11/11/17.
//  Copyright © 2017 Kevin Hunkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        inputUnit = "°F"
        outputUnit = "°C"
        displayInput()
        displayOutput()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var numberOnInput = ""
    var numberOnOutput = ""
    var inputUnit: String = ""
    var outputUnit: String = ""
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag == 11 {
            numberOnInput = ""
            numberOnOutput = ""
            inputUnit = "°F"
            outputUnit = "°C"
            displayInput()
            displayOutput()
        }
        
        if sender.tag == 12
        {
            if numberOnInput.contains("-") {
                if let i = numberOnInput.index(of: "-") {
                    numberOnInput.remove(at: i)
                    displayInput()
                }
            } else {
                numberOnInput = "-" + numberOnInput
                displayInput()
            }
        }
        else if sender.tag == 13
        {
            if numberOnInput.contains(".") {
                if let i = numberOnInput.index(of: ".") {
                    numberOnInput.remove(at: i)
                    displayInput()
                }
            } else {
                numberOnInput = numberOnInput + "."
                displayInput()
            }
        }
    }
    
    func convertFahrenheitToCelcius(_ fahrenheit: Double) -> Double {
        return (fahrenheit-32) * (5/9)
    }
    
    func convertCelciusToFahrenheit(_ celcius: Double) -> Double {
        return (celcius * (9/5)) + 32
    }
    
    func convertMilesToKilometers(_ miles: Double) -> Double {
        return miles * 1.60934
    }
    
    func convertKilometersToMiles(_ kilometers: Double) -> Double {
        return kilometers / 1.60934
    }
    
    func displayInput() {
        self.inputDisplay.text = String(self.numberOnInput) + " " + inputUnit
    }
    
    func displayOutput() {
        self.outputDisplay.text = String(self.numberOnOutput) + " " + outputUnit
}

    @IBAction func numbers(_ sender: UIButton) {
        let digit = sender.tag-1
        numberOnInput += String(digit)
        
        displayInput()
    }
  
    @IBAction func converterDisplay(_ sender: UIButton) {
        let inputValue = Double(numberOnInput)
        let alert = UIAlertController(title: "Converter", message: "Choose what you want to convert.", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.numberOnOutput = String(self.convertFahrenheitToCelcius(inputValue!))
            self.inputUnit = "°F"
            self.outputUnit = "°C"
            self.displayInput()
            self.displayOutput()
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.numberOnOutput = String(self.convertCelciusToFahrenheit(inputValue!))
            self.inputUnit = "°C"
            self.outputUnit = "°F"
            self.displayInput()
            self.displayOutput()
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.numberOnOutput = String(self.convertMilesToKilometers(inputValue!))
            self.inputUnit = "mi"
            self.outputUnit = "km"
            self.displayInput()
            self.displayOutput()
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.numberOnOutput = String(self.convertKilometersToMiles(inputValue!))
            self.inputUnit = "km"
            self.outputUnit = "mi"
            self.displayInput()
            self.displayOutput()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
    

    
    
    
    
    
    



