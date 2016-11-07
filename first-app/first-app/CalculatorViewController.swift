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
    var calculation = 0.0 as Float
    
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
    @IBAction func decimalButton(_ sender: AnyObject) {
        calculate(".")
    }
    @IBAction func equalButton(_ sender: AnyObject) {
        calculate("=")
    }
    @IBAction func divideButton(_ sender: AnyObject) {
        calculate("/")
    }
    @IBAction func multiButton(_ sender: AnyObject) {
        calculate("*")
    }
    @IBAction func minusButton(_ sender: AnyObject) {
        calculate("-")
    }
    @IBAction func plusButton(_ sender: AnyObject) {
        calculate("+")
    }
    @IBAction func clearButton(_ sender: AnyObject) {
        calculate("clear")
    }
    @IBAction func nineButton(_ sender: AnyObject) {
        calculate("9")
    }
    @IBAction func eightButton(_ sender: AnyObject) {
        calculate("8")
    }
    @IBAction func sevenButton(_ sender: AnyObject) {
        calculate("7")
    }
    @IBAction func sixButton(_ sender: AnyObject) {
        calculate("6")
    }
    @IBAction func fiveButton(_ sender: AnyObject) {
        calculate("5")
    }
    @IBAction func fourButton(_ sender: AnyObject) {
        calculate("4")
    }
    @IBAction func threeButton(_ sender: AnyObject) {
        calculate("3")
    }
    @IBAction func twoButton(_ sender: AnyObject) {
        calculate("2")
    }
    @IBAction func oneButton(_ sender: AnyObject) {
        calculate("1")
    }
    @IBAction func zeroButton(_ sender: AnyObject) {
        calculate("0")
    }

    // MARK: - Do the math
    
    func calculate(_ passedValue: String) {
        
        switch passedValue {
        case "clear":
            self.calculation = 0
            updateDisplay("0")
        case "=":
            
            equal()
        case ".":
            updateDisplay(passedValue)
        case "/", "*", "+", "-":
            updateDisplay(passedValue)
        case "0","1","2","3","4","5","6","7","8","9":
            updateDisplay(passedValue)
        default:
            updateDisplay(passedValue)
        }
    
        
    }
    
    func updateDisplay(_ passedValue: String){
        if (self.answerLabel.text == "0") {
            answerLabel.text = passedValue
        } else if(passedValue == "clear"){
            answerLabel.text = "0"
        } else {
            answerLabel.text = answerLabel.text! + passedValue
        }
    }
    func equal() {
        print(answerLabel.text!)
        
        let ourMath = NSExpression(format: answerLabel.text!)
        let result = ourMath.expressionValue(with: nil, context: nil) as! Float
        
        let cleanResult = roundf(100 * result) / 100.0;
        
        self.calculation = result
        
        answerLabel.text = String(cleanResult)
    }


}
