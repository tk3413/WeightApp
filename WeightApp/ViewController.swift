//
//  ViewController.swift
//  WeightApp
//
//  Created by Taimore Khan on 9/19/17.
//  Copyright © 2017 Taimore Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Initializing arrays to hold all of the fields and the 
    //list of available plates
    var listOfTextFields = [UITextField]()
    var listOfWeights = [Double]()
    @IBOutlet weak var totalWeight_Field: UITextField!
    @IBOutlet weak var barWeight_Field: UITextField!
    @IBOutlet weak var weightLeft_Field: UITextField!
    @IBOutlet weak var num45ToPut_Field: UITextField!
    @IBOutlet weak var num35ToPut_Field: UITextField!
    @IBOutlet weak var num25ToPut_Field: UITextField!
    @IBOutlet weak var num10ToPut_Field: UITextField!
    @IBOutlet weak var num5ToPut_Field: UITextField!
    @IBOutlet weak var num2ToPut_Field: UITextField!
    
    //This is a void function that simply populates the 
    //arrays initialized above. Default values are entered
    //in currently for the available plates.
    func populateArrays(){
        listOfTextFields.append(num45ToPut_Field)
        listOfTextFields.append(num35ToPut_Field)
        listOfTextFields.append(num25ToPut_Field)
        listOfTextFields.append(num10ToPut_Field)
        listOfTextFields.append(num5ToPut_Field)
        listOfTextFields.append(num2ToPut_Field)
        listOfWeights.append(45)
        listOfWeights.append(35)
        listOfWeights.append(25)
        listOfWeights.append(10)
        listOfWeights.append(5)
        listOfWeights.append(2.5)
        
    }
    
    //These variables will all be used later, for now
    //all are initialized as 0
    var totalWeight = 0
    var barWeight = 0
    var weightLeft: Double = 0
    var counter: Int = 0
    var clearCounter: Int = 0
    var index: Int = 0
    
    //Void function that sets the total weight based on 
    //input from the user
    func setTotalWeight(){
        totalWeight = Int(totalWeight_Field.text!)!
        
    }

    //Void function that sets the bar weight based on 
    //input from the user
    func setBarWeight(){
        barWeight = Int(barWeight_Field.text!)!
        
    }
    
    //Void function that prints out the total weight,
    //bar weight, as well as the weight left after subtracting
    //**Note: this function does not calculate the weight left,
    //That is handled by the "calculate_Button" method**
    func debugMessages(){
        print("The total weight is: ", totalWeight)
        print("The bar weight is: ", barWeight)
        print("The weight to put on both sides is ", weightLeft)
        
    }
    
    //Void function, on button press, this method will replace
    //all of the fields on the screen with 0's
    @IBAction func clear(_ sender: UIButton) {
        barWeight_Field.text = String(0)
        totalWeight_Field.text = String(0)
        weightLeft_Field.text = String(0)
        while(clearCounter<listOfTextFields.count){
            listOfTextFields[clearCounter].text = String(0)
            clearCounter += 1
        }
        
    }
    
    //Where all the magic happens. When the calculate button is
    //pressed, the total weight and bar weight entered by the user
    //is set. The arrays are actually populated, the total weight
    //to divide up and place on each side is calculated, and then
    //we hit the while loop.
    //**While loop**
    //While the weight left is greater than 0 and also greater than 
    //the smallest possible plate, the program will try to subtract
    //the largest plate from the weight left. Once the subtraction
    //occurs, it will then evaluate again whether or not the plate 
    //can be subtracted from the weightLeft. If not, it will send
    //the count to the screen, and then move on to the next smaller
    //plate. 
    @IBAction func calculate_Button(_ sender: UIButton) {
        setTotalWeight()
        setBarWeight()
        populateArrays()
        weightLeft = Double((totalWeight-barWeight)/2)
        self.weightLeft_Field.text = String(weightLeft)
        debugMessages()
        index = 0
        counter = 0
        
        while(weightLeft>0&&weightLeft>listOfWeights[listOfWeights.count-1]){
        print("Weight left: ", weightLeft, " Index: ", index)
            
            if(weightLeft>=listOfWeights[index]){
                counter += 1
                weightLeft = Double(weightLeft)-listOfWeights[index]
            }//if1
            
            if(weightLeft<listOfWeights[index]){
                self.listOfTextFields[index].text = String(counter)
                counter = 0
                index += 1
                print("Weight left: ", weightLeft, " Index: ", index)
            }//if2

        }//while
    }//calculate_Button
    
       

}

