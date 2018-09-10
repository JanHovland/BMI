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
        
        // Lager en toolbar på toppen av tastaturet som  inneholder knappen ferdig
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                            target: nil, action: nil)
        
        let ferdigButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                           target: self, action: #selector(self.skjulTastatur))
        
//        let playButton = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(ViewController.skjulTastatur))
//        
        toolBar.setItems([flexibleSpace, ferdigButton], animated: false)

        weightInput.inputAccessoryView = toolBar
        heightInput.inputAccessoryView = toolBar
        
    }
    
    @objc func skjulTastatur() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var bmiOutput: UITextField!
    @IBOutlet weak var categoryOutput: UILabel!

    @IBAction func calcBMI(_ sender: Any) {
        
        let høyde = heightInput.text
        let vekt = weightInput.text
        
        if (høyde == "" || vekt == "") {
            print("Du må legge inn begge verdiene")
            
            let alertController = UIAlertController(title: "Beregn BMI", message: "Du må legge inn både vekt og høyde", preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            present(alertController, animated: true, completion: nil)
            
            return()
        }
        
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
                                    categoryOutput.text = "Ekstremt undervektig"
                                case 15...16:
                                    categoryOutput.text = "Svært undervektig"
                                case 16..<18.5:
                                    categoryOutput.text = "Undervektig"
                                case 18.5..<25:
                                    categoryOutput.text = "Normal"
                                case 25..<30:
                                    categoryOutput.text = "Overvektig"
                                case 30..<35:
                                    categoryOutput.text = "Moderat overvektig"
                                case 35..<40:
                                    categoryOutput.text = "Svært overvektig"
                                case 40...:
                                    categoryOutput.text = "Ekstremt overvektig"
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

