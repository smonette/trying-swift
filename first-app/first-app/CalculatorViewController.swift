//
//  CalculatorViewController.swift
//  first-app
//
//  Created by Steph Monette on 9/2/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

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
    }
    @IBAction func divideButton(sender: AnyObject) {
        updateDisplay("/")
    }
    @IBAction func multiButton(sender: AnyObject) {
        updateDisplay("*")
    }
    @IBAction func minusButton(sender: AnyObject) {
        updateDisplay("-")
    }
    @IBAction func plusButton(sender: AnyObject) {
        updateDisplay("+")
    }
    @IBAction func clearButton(sender: AnyObject) {
        clearDisplay()
    }
    @IBAction func nineButton(sender: AnyObject) {
        updateDisplay("9")
    }
    @IBAction func eightButton(sender: AnyObject) {
        updateDisplay("8")
    }
    @IBAction func sevenButton(sender: AnyObject) {
        updateDisplay("7")
    }
    @IBAction func sixButton(sender: AnyObject) {
        updateDisplay("6")
    }
    @IBAction func fiveButton(sender: AnyObject) {
        updateDisplay("5")
    }
    @IBAction func fourButton(sender: AnyObject) {
        updateDisplay("4")
    }
    @IBAction func threeButton(sender: AnyObject) {
        updateDisplay("3")
    }
    @IBAction func twoButton(sender: AnyObject) {
        updateDisplay("2")
    }
    @IBAction func oneButton(sender: AnyObject) {
        updateDisplay("1")
    }
    @IBAction func zeroButton(sender: AnyObject) {
        updateDisplay("0")
    }

    // MARK: - Do the math
    
    func clearDisplay() {
        answerLabel.text = "0"
    }
    func updateDisplay(passedValue: String) {
        if (answerLabel.text == "0"){
            answerLabel.text = passedValue
        } else {
            answerLabel.text = answerLabel.text! + passedValue

        }
    }

}
