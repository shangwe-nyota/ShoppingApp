//
//  ViewController.swift
//  ShangweNyota-Lab1
//
//  Created by Shangwe Nyota on 9/7/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var originalPrice: Float? // Initialized as nil but will be updated
    var discountPrice: Float? // Initialized as nil but will be updated
    var salesTax: Float? // Initialized as nil but will be updated
    
    let conversionRate: Float = 0.91 // USD to EURO conversion rate
    
    @IBOutlet weak var originalTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var salesTaxField: UITextField!
    @IBOutlet weak var finalPriceField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var eurosButton: UIButton!
    
    @IBAction func originalTextChanged(_ sender: Any) {
        if let originalPriceText = originalTextField.text {
            originalPrice = Float(originalPriceText)
            print(originalPrice)
        }
        updateFinalPrice()
    }
    
    @IBAction func discountTextFieldChanged(_ sender: Any) {
        if let discountPriceText = discountTextField.text {
            discountPrice = Float(discountPriceText)
            print(discountPrice)
        }
        updateFinalPrice()
    }
    
    @IBAction func salesTaxChanged(_ sender: Any) {
        if let salesTaxText = salesTaxField.text {
            salesTax = Float(salesTaxText)
            print(salesTax)
        }
        updateFinalPrice()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        print("Button clicked")
        originalPrice = nil
        discountPrice = nil
        salesTax = nil
        
        originalTextField.text = ""
        discountTextField.text = ""
        salesTaxField.text = ""
        finalPriceField.text = ""
        updateFinalPrice()
    }
    
    @IBAction func eurosButtonPressed(_ sender: Any) {
        print("euros button pressed")
        
        if let finalPriceText = finalPriceField.text,
           let finalPrice = Float(finalPriceText.trimmingCharacters(in: CharacterSet(charactersIn: "$"))) {
            
            let priceInEuros = finalPrice * conversionRate
            finalPriceField.text = String(format: "€%.2f", priceInEuros)
        }
    }
    
    func updateFinalPrice() {
        // Unwrap the optionals
        if let originalPrice = originalPrice,
           let discountPrice = discountPrice,
           let salesTax = salesTax {
            
            print("Price after Discount \(calculateDiscount(originalPrice: originalPrice, discountPrice: discountPrice))")
            let discountedPrice: Float = calculateDiscount(originalPrice: originalPrice, discountPrice: discountPrice)
            
            let priceAfterSalesTax: Float = calculateSalesTax(discountedPrice: discountedPrice, salesTax: salesTax)
            
            finalPriceField.text = "$\(priceAfterSalesTax)"
            
        } else {
            print("Not all values entered!")
            finalPriceField.text = ""
        }
    }
    
    func calculateDiscount(originalPrice: Float, discountPrice: Float) -> Float {
        // Returns the discounted price
        let amountToSubtract: Float = originalPrice * (discountPrice / 100)
        return originalPrice - amountToSubtract
    }
    
    func calculateSalesTax(discountedPrice: Float, salesTax: Float) -> Float {
        // Returns the price after sales tax
        let amountToAdd: Float = discountedPrice * (salesTax / 100)
        return discountedPrice + amountToAdd
    }
}
