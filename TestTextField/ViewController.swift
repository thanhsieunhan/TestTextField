//
//  ViewController.swift
//  TestTextField
//
//  Created by Lê Hà Thành on 1/20/17.
//  Copyright © 2017 Lê Hà Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var sliderSize: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setSize(_ sender: UISlider) {
        label2.text = textField.text
        
        label2.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        label1.font = UIFont.systemFont(ofSize: CGFloat(sender.value))

        let numberCharacterInLine = Int(label1.frame.width/CGFloat(sender.value*0.519)) + 1
        print("number character in line: \(numberCharacterInLine)")
        
        let text = textField.text
        let splitText = text?.components(separatedBy: " ")
        var countCharacter = 0
        var newText = ""
        print(splitText?.count)
        for i in splitText! {
            countCharacter = countCharacter + i.characters.count + 1
            if countCharacter <= numberCharacterInLine {
                
                newText = newText + " " + i
                
            } else {
                newText = newText + "\n" + i
            }

            if countCharacter > numberCharacterInLine {
                countCharacter = i.characters.count
            }
        }
        
        newText.remove(at: newText.startIndex)
        print(newText)
        label1.text = newText
        label1.lineBreakMode = .byCharWrapping
    }

}

