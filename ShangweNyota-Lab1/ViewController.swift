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
    var originalPrice: Float? //initialized as nil but will be updated
    var discountPrice: Float? //initialized as nil but will be updated
    var salesTax: Float? //initalized as nil but will be updated
    
    //If all 3 are not nil then display final price


    @IBOutlet weak var originalTextField: UITextField!
    
    @IBOutlet weak var discountTextField: UITextField!
    
    @IBOutlet weak var salesTaxField: UITextField!
    
    @IBOutlet weak var finalPriceField: UITextField!
    
    @IBAction func originalTextChanged(_ sender: Any) {
        if let originalPriceText = originalTextField.text {
            if let originalPriceFloat = Float(originalPriceText) {
                print(originalPriceFloat)
                originalPrice = originalPriceFloat
            } else {
                print("Invalid Input")
            }
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
    
    
    func updateFinalPrice() {
        //Unwrap the optionals
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
    
    func calculateDiscount(originalPrice: Float,discountPrice: Float ) -> Float {
        //Returns the original
        let amountToSubtract: Float = originalPrice * (discountPrice/100)
        return originalPrice - amountToSubtract
    }
    
    func calculateSalesTax(discountedPrice: Float,salesTax: Float ) -> Float {
        //Returns the original
        let amountToSubtract: Float = discountedPrice * (salesTax/100)
        return discountedPrice + amountToSubtract
    }
    
}

