//
//  CalculatorViewController.swift
//  first-app
//
//  Created by Steph Monette on 9/2/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var digits = ""
    var calculation = 0
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculator"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK: - Button functions
    @IBAction func equalButton(sender: AnyObject) {
        calculate("=")
    }
    @IBAction func divideButton(sender: AnyObject) {
        calculate("/")
    }
    @IBAction func multiButton(sender: AnyObject) {
        calculate("*")
    }
    @IBAction func minusButton(sender: AnyObject) {
        calculate("-")
    }
    @IBAction func plusButton(sender: AnyObject) {
        calculate("+")
    }
    @IBAction func clearButton(sender: AnyObject) {
        calculate("clear")
    }
    @IBAction func nineButton(sender: AnyObject) {
        calculate("9")
    }
    @IBAction func eightButton(sender: AnyObject) {
        calculate("8")
    }
    @IBAction func sevenButton(sender: AnyObject) {
        calculate("7")
    }
    @IBAction func sixButton(sender: AnyObject) {
        calculate("6")
    }
    @IBAction func fiveButton(sender: AnyObject) {
        calculate("5")
    }
    @IBAction func fourButton(sender: AnyObject) {
        calculate("4")
    }
    @IBAction func threeButton(sender: AnyObject) {
        calculate("3")
    }
    @IBAction func twoButton(sender: AnyObject) {
        calculate("2")
    }
    @IBAction func oneButton(sender: AnyObject) {
        calculate("1")
    }
    @IBAction func zeroButton(sender: AnyObject) {
        calculate("0")
    }

    // MARK: - Do the math
    
    func calculate(passedValue: String) {
        switch passedValue {
        case "clear":
            self.calculation = 0
        case "=":
            answerLabel.text = String(calculation)
        case "/":
            updateDisplay(passedValue)
        case "*":
            updateDisplay(passedValue)
        case "+":
            updateDisplay(passedValue)
        case "-":
            updateDisplay(passedValue)
        case "0","1","2","3","4","5","6","7","8","9":
            updateDisplay(passedValue)
            print(passedValue)
        default:
            updateDisplay(passedValue)
        }
    
        
    }
    
    func updateDisplay(passedValue: String){
        if(self.answerLabel.text == "0") {
            answerLabel.text = passedValue
        } else {
            answerLabel.text = answerLabel.text! + passedValue
        }
    }
    

    
    
    
    
    

}
