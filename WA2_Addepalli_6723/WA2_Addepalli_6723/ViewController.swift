//
//  ViewController.swift
//  WA2_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 9/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    var labelAppTitle: UILabel!
    
    var inputFirstNumber: UITextField!
    var inputSecondNumber: UITextField!
    
    var labelOperations: UILabel!
    
    var buttonAdd: UIButton!
    var buttonSubtract: UIButton!
    var buttonMultiply: UIButton!
    var buttonDivide: UIButton!
    
    var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: setting up UI elements...
        setupLabels()
        setupTextFields()
        setupButtons()
        
        //MARK: adding action...
        buttonAdd.addTarget(self, action: #selector(onButtonAddClicked), for: .touchUpInside)
        
        buttonSubtract.addTarget(self, action: #selector(onButtonSubtractClicked), for: .touchUpInside)
        
        buttonMultiply.addTarget(self, action: #selector(onButtonMultiplyClicked), for: .touchUpInside)
        
        buttonDivide.addTarget(self, action: #selector(onButtonDivideClicked), for: .touchUpInside)
        
        //MARK: initializing the constraints...
        initConstraints()
    }
    
    // Defining the Label attributes for title, operations and result...
    func setupLabels() {
        //Title Label
        labelAppTitle = UILabel()
        labelAppTitle.text = "Basic Calculator"
        labelAppTitle.font = UIFont.systemFont(ofSize: 24)
        labelAppTitle.textColor = .black
        labelAppTitle.textAlignment = .center
        labelAppTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelAppTitle)
        
        // Operations Label
        labelOperations = UILabel()
        labelOperations.text = "Operations"
        labelOperations.font = UIFont.systemFont(ofSize: 20)
        labelOperations.textColor = .black
        labelOperations.textAlignment = .center
        labelOperations.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelOperations)
        
        // Result Label
        labelResult = UILabel()
        labelResult.text = "Result"
        labelResult.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        labelResult.textAlignment = .center
        labelResult.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelResult)
    }
    
    // Defining the TextField attributes...
    func setupTextFields() {
        // Text field for first number
        inputFirstNumber = UITextField()
        inputFirstNumber.placeholder = "First Number"
        inputFirstNumber.borderStyle = .roundedRect
        inputFirstNumber.keyboardType = .decimalPad
        inputFirstNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputFirstNumber)
        
        // Text field for second number
        inputSecondNumber = UITextField()
        inputSecondNumber.placeholder = "Second Number"
        inputSecondNumber.borderStyle = .roundedRect
        inputSecondNumber.keyboardType = .decimalPad
        inputSecondNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputSecondNumber)
    }
    
    
    // Defining the Button Attributes for Add, Subtract, Multiply and Divide Buttons
    func setupButtons(){
        
        // Add button
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Add", for: .normal)
        buttonAdd.tintColor = .systemBlue
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonAdd)
        
        // Subtract button
        buttonSubtract = UIButton(type: .system)
        buttonSubtract.setTitle("Subtract", for: .normal)
        buttonSubtract.tintColor = .systemBlue
        buttonSubtract.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSubtract)
        
        // Multiply button
        buttonMultiply = UIButton(type: .system)
        buttonMultiply.setTitle("Multiply", for: .normal)
        buttonMultiply.tintColor = .systemBlue
        buttonMultiply.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonMultiply)
        
        // Divide button
        buttonDivide = UIButton(type: .system)
        buttonDivide.setTitle("Divide", for: .normal)
        buttonDivide.tintColor = .systemBlue
        buttonDivide.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonDivide)
    }
    
    
    //MARK: Initializing the constraints
    func initConstraints(){
        NSLayoutConstraint.activate(
            [
                //MARK: constraints for App Title Label
                labelAppTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                labelAppTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                inputFirstNumber.topAnchor.constraint(equalTo: labelAppTitle.bottomAnchor, constant: 20),
                inputFirstNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                inputFirstNumber.widthAnchor.constraint(equalToConstant: 150),
                
                inputSecondNumber.topAnchor.constraint(equalTo: inputFirstNumber.bottomAnchor, constant: 16),
                inputSecondNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                inputSecondNumber.widthAnchor.constraint(equalToConstant: 150),
                
                labelOperations.topAnchor.constraint(equalTo: inputSecondNumber.bottomAnchor, constant: 20),
                labelOperations.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonAdd.topAnchor.constraint(equalTo: labelOperations.bottomAnchor, constant: 12),
                buttonAdd.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonSubtract.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 12),
                buttonSubtract.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonMultiply.topAnchor.constraint(equalTo: buttonSubtract.bottomAnchor, constant: 12),
                buttonMultiply.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonDivide.topAnchor.constraint(equalTo: buttonMultiply.bottomAnchor, constant: 12),
                buttonDivide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                labelResult.topAnchor.constraint(equalTo: buttonDivide.bottomAnchor, constant: 16),
                labelResult.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
    }
    
    //MARK: Button Add click action
    @objc func onButtonAddClicked(){
        let num1 = inputFirstNumber.text
        let num2 = inputSecondNumber.text
        
        //Unwrapping the optional text
        if let num1 = num1, let num2 = num2{
            if(num1.isEmpty || num2.isEmpty){
                showErrorAlert(message: "Error! The numbers cannot be empty!")
            }else{
                let result: Double = Double(num1)! + Double(num2)!
                labelResult.text = formatResult(result: result)
            }
        }
    }
    
    //MARK: Button Subtract click action
    @objc func onButtonSubtractClicked(){
        let num1 = inputFirstNumber.text
        let num2 = inputSecondNumber.text
        
        //Unwrapping the optional text
        if let num1 = num1, let num2 = num2{
            if(num1.isEmpty || num2.isEmpty){
                showErrorAlert(message: "Error! The numbers cannot be empty!")
            }else{
                let result: Double = Double(num1)! - Double(num2)!
                labelResult.text = formatResult(result: result)
            }
        }
    }
    
    //MARK: Button Multiply click action
    @objc func onButtonMultiplyClicked(){
        let num1 = inputFirstNumber.text
        let num2 = inputSecondNumber.text
        
        //Unwrapping the optional text
        if let num1 = num1, let num2 = num2{
            if(num1.isEmpty || num2.isEmpty){
                showErrorAlert(message: "Error! The numbers cannot be empty!")
            }else{
                let result: Double = Double(num1)! * Double(num2)!
                labelResult.text = formatResult(result: result)
            }
        }
    }
    
    //MARK: Button Multiply click action
    @objc func onButtonDivideClicked(){
        let num1 = inputFirstNumber.text
        let num2 = inputSecondNumber.text
        
        //Unwrapping the optional text
        if let num1 = num1, let num2 = num2{
            if(num1.isEmpty || num2.isEmpty){
                showErrorAlert(message: "Error! The numbers cannot be empty!")
            } else {
                if let num2 = Double(num2), num2 == 0{
                    showErrorAlert(message: "Error! Cannot divide by zero!")
                } else {
                    let result: Double = Double(num1)! / Double(num2)!
                    labelResult.text = formatResult(result: result)
                }
            }
        }
    }
    
    func showErrorAlert(message: String){
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func formatResult(result value: Double) -> String {
        return String(format: "%.2f", value)
    }
}

