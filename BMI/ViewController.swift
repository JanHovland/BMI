//
//  ViewController.swift
//  BMI
//
//  Created by Jan  on 20.01.2018.
//  Copyright © 2018 Jan . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
// class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var bmiOutput: UITextField!
    @IBOutlet weak var categoryOutput: UILabel!

    // Dersom en trenger en egen knapp for å slå av tastaturet
    
    @IBAction func Ferdig(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func calcBMI(_ sender: Any) {
        
        // Her lukkes tastaturet når en trykker på calcBMI
        
        self.view.endEditing(true)

        if var heightStr = heightInput.text {
            
            // Bytter ut eventuelle "," med "."
            
            heightStr = heightStr.replacingOccurrences(of: ",", with: ".")
            
            if heightStr == "" {
                return
            }
                
            else {
                if var weightStr = weightInput.text {
                    
                    // Bytter ut eventuelle "," med "."
                    
                    weightStr = weightStr.replacingOccurrences(of: ",", with: ".")
                    
                    if weightStr == "" {
                        return
                    }
                    else {
                        if let heightNum = Double(heightStr) {
                            if let weightNum = Double(weightStr) {
                                let BMI: Double = (weightNum) / (heightNum * heightNum)
                                
                                // Vise kun heltallet
                                
                                bmiOutput.text = String(BMI)
                                
                                switch BMI {
                                case 1..<15:
                                    categoryOutput.text = "Very severely underweight"
                                case 15...16:
                                    categoryOutput.text = "Severely underweight"
                                case 16..<18.5:
                                    categoryOutput.text = "Underweight"
                                case 18.5..<25:
                                    categoryOutput.text = "Normal"
                                case 25..<30:
                                    categoryOutput.text = "Overweight"
                                case 30..<35:
                                    categoryOutput.text = "Moderately obese"
                                case 35..<40:
                                    categoryOutput.text = "Severely obese"
                                case 40..<60:
                                    categoryOutput.text = "Very severely obese"
                                case 60...:
                                    categoryOutput.text = "Extremely severe obese"
                                default:
                                   return
                                }
                            }
                        
                        }
                    }
                }
            }
        }
        
        weightInput.text = ""
        heightInput.text = ""
       
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.weightInput.resignFirstResponder()
//        self.heightInput.resignFirstResponder()
//      return true
//    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Skjule tastaturet når en trykker utenfor de 2 input feltene
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//

}

