import UIKit

class MainViewController: UIViewController {
    enum Operation {
        case noop, add, subtract, multiply, divide, equal
    }
    
    var operation: Operation = .noop
    var accumulator = 0
    var reset = false
    
    @IBOutlet weak var displayLable: UILabel!
    
    @IBAction func tap(_ sender: UIButton) {
        let symbol = sender.titleLabel!.text!
        var currentDisplay = self.displayLable.text!
        
        
        if let digit = Int(symbol) {
         if Int(currentDisplay)! == 0 || reset {
            currentDisplay = ""
        }
        
    currentDisplay = currentDisplay + String(digit)
        self.displayLable.text = currentDisplay
        reset = false
        }else if symbol == "c" {
            self.displayLable.text = "0"
            self.accumulator = 0
            self.operation = .noop
        
        }
            
        else {
            switch (operation) {
            case .add:
                accumulator = accumulator + Int(displayLable.text!)!
            case .subtract:
                accumulator = accumulator - Int(displayLable.text!)!
            case .multiply:
                 accumulator = accumulator * Int(displayLable.text!)!
            case .divide:
                accumulator = Int(Double(accumulator) / Double(displayLable.text!)!)
            default :
                accumulator = Int(displayLable.text!)!
            }
            if symbol == "➗" {
                self.operation = .divide
            }
            else if symbol == "✖️" {
                self.operation = .multiply
            }
            else if symbol == "➖"{
                self.operation = .subtract
            }
            else if symbol == "➕"{
                self.operation = .add
            }
            else if symbol == "="{
                operation = .equal
            }
            reset = true
            displayLable.text = String(accumulator)
        }
    }
        
  }

