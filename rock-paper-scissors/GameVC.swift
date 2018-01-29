//
//  GameVC.swift
//  rock-paper-scissors
//
//  Created by maw on 1/17/18.
//  Copyright © 2018 maw. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    let CHOICES = ["paper", "scissors", "rock"]
    var yourChoice = "rock"
    var opponentChoice = "rock"
    
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var opponentScore: UILabel!
    
    @IBOutlet weak var yourChoiceView: UIImageView!
    @IBOutlet weak var opponentChoiceView: UIImageView!
    
    func compare(_ a:String, _ b:String) -> Int {
        if (a == b){
            return 0;
        } else if (a == "paper" && b == "scissors"){
            return -1;
        } else if (a == "paper" && b == "rock"){
            return 1;
        } else if (a == "scissors" && b == "rock"){
            return -1;
        } else if (a == "scissors" && b == "paper"){
            return 1;
        } else if (a == "rock" && b == "paper"){
            return -1;
        } else {
            return 1;
        }
    }
    
    func play(_ choice: String){
        youPlay(choice)
        opponentPlay()
        let win = compare(yourChoice, opponentChoice)
        if (win > 0){
            yourScore.text = String(Int(yourScore.text!)! + 1)
        } else if (win < 0){
            opponentScore.text = String(Int(opponentScore.text!)! + 1)
        }
    }
    
    func youPlay(_ choice: String){
        yourChoice = choice
        updateView(yourChoiceView, yourChoice)
    }
    
    func opponentPlay(){
        opponentChoice = CHOICES[Int(arc4random_uniform(3))]
        updateView(opponentChoiceView, opponentChoice)
    }
    
    func updateView(_ view: UIImageView, _ choice: String){
        if (choice == "paper"){
            view.image = #imageLiteral(resourceName: "paper.png")
        } else if (choice == "rock"){
            view.image = #imageLiteral(resourceName: "rock.png")
        } else {
            view.image = #imageLiteral(resourceName: "scissors.png")
        }
    }
    
    @IBAction func playRock(_ sender: Any) {
        play("rock")
    }

    @IBAction func playPaper(_ sender: Any) {
        play("paper")
    }
    
    @IBAction func playScissors(_ sender: Any) {
        play("scissors")
    }
    
    @IBAction func reset(_ sender: Any) {
        yourScore.text = "0"
        opponentScore.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
