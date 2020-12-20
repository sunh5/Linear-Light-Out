//
//  ViewController.swift
//  Linear Light Out
//
//  Created by Haoxuan Sun on 12/16/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameState: UILabel!
    @IBOutlet weak var navigaBar: UINavigationBar!
    @IBOutlet var gameBoardButtons: [UIButton]!
    var onImage: UIImage!
    var offImage: UIImage!
    
    var game = LinearLightsOutGame(numLights: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onImage = #imageLiteral(resourceName: "light_on.png")
        offImage = #imageLiteral(resourceName: "light_off.png")
        initialView()
       
    }

    @IBAction func pressedNewgameButton(_ sender: Any) {
        print("new game")
        game = LinearLightsOutGame(numLights: 13)
        initialView()
    }
    
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        let button = sender as! UIButton
        print(button.tag)
        if game.pressedLightAtIndex(button.tag) == false{
            updateView()
        }else{
            print("Over")
            terminate()
        }
    }
    
    func updateView() {
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact{
            gameState.text = "You have taken \(game.totalMoves) moves"
        }else{
            navigaBar.topItem?.title = "You have taken \(game.totalMoves) moves"
        }
        for i in 0...game.lightStates.count-1{
            if game.lightStates[i] == true{
                gameBoardButtons[i].setImage(onImage, for: .normal)
            }else{
                gameBoardButtons[i].setImage(offImage, for: .normal)
            }
        }
    }
    
    func initialView() {
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact{
            //iphone
            gameState.text = "Turn all the lights off!!"
        }else{
            //ipad
            navigaBar.topItem?.title = "Turn all the lights off!!"
        }
        game.totalMoves = 0
        for i in 0...game.lightStates.count-1{
            if game.lightStates[i] == true{
                gameBoardButtons[i].setImage(onImage, for: .normal)
            }else{
                gameBoardButtons[i].setImage(offImage, for: .normal)
            }
        }
    }
    func terminate() {
        for i in 0...game.lightStates.count-1{
            gameBoardButtons[i].setImage(offImage, for: .normal)
        }
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact{
            gameState.text = "You won in \(game.totalMoves) moves"
        }else{
            navigaBar.topItem?.title = "You won in \(game.totalMoves) moves"
        }
    }
}

