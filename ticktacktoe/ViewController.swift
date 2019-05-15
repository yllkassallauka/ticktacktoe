//
//  ViewController.swift
//  ticktacktoe
//
//  Created by ICK on 5/13/19.
//  Copyright © 2019 ICK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelFituesi: UILabel!
    @IBOutlet weak var buttonRifillo: UIButton!
    // 0 = hapsire e zbrazet
    // 1 = Lojtari X
    // 2 = Lojtari O
    var activePlayer:Int = 1
    var isGameActive:Bool = true
    var gameState:[Int] = [0,0,0,0,0,0,0,0,]
    var winningCombinations: [[Int]] = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]  ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelFituesi.isHidden = true
        buttonRifillo.isHidden = true
        
        
        labelFituesi.center = CGPoint.init(x: labelFituesi.center.x - 500, y: labelFituesi.center.y)
        buttonRifillo.center = CGPoint.init(x: buttonRifillo.center.x - 500, y: buttonRifillo.center.y)
    }

    @IBAction func rifilloLojen(_ sender: Any) {
        labelFituesi.isHidden = true
        buttonRifillo.isHidden = true
        for var butoni in 1...9{
            let buttonView:UIButton = view.viewWithTag(butoni) as! UIButton
            buttonView.setImage(nil, for: .normal)
        }
        isGameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
    }
    @IBAction func playgame(_ sender: UIButton) {
        
        
        if (gameState[sender.tag - 1] == 0 && isGameActive) {
            
            var xImage:UIImage? = nil
            gameState[sender.tag - 1] = activePlayer
            
            if (activePlayer == 1){
                xImage = UIImage.init(named: "Cross")
                activePlayer = 2
                
            }else{
                xImage = UIImage.init (named: "Circle")
                activePlayer = 1
            }
            sender.setImage(xImage!, for: .normal)
            
            for var combination in winningCombinations{
            if(gameState[combination[0]] != 0 && gameState[combination[1]] == gameState[combination[0]] && gameState[combination[2]] == gameState[combination[1]] ) {
                isGameActive = false
                    
                    labelFituesi.isHidden = false
                    buttonRifillo.isHidden = false
                
                UIView.animate(withDuration: 1) {
                    self.labelFituesi.center = CGPoint.init(x:
                    self.labelFituesi.center.x + 500, y:
                    self.labelFituesi.center.y)
                    
                    self.buttonRifillo.center = CGPoint.init(x: self.buttonRifillo.center.x + 500, y: self.buttonRifillo.center.y)
                }
                    
                    if(gameState[combination[0]] == 1){
                        labelFituesi.text = "Fituesi eshte 0"
                    }
            } else {
                if (!gameState.contains(0)){
                    labelFituesi.text = "Nuk ka fitues"
                    labelFituesi.isHidden = false
                    buttonRifillo.isHidden = false
                    
                }
                
            }
            
        }
        
  }

}
}
