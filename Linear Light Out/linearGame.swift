//
//  linearGame.swift
//  Linear Light Out
//
//  Created by Haoxuan Sun on 12/16/20.
//

import Foundation
import UIKit
class LinearLightsOutGame: CustomStringConvertible{
    var lightStates: [Bool]
    var totalMoves: Int
    init(numLights: Int){
        lightStates = [Bool](repeating: false, count: numLights)
        totalMoves = 0
        randomSequence()
    }
    func randomSequence(){
        for _ in 0...lightStates.count/2-1 {
            let randomNumber : Int = Int(arc4random_uniform(UInt32(lightStates.count-1)))
            lightStates[randomNumber] = !lightStates[randomNumber]
        }
    }
    func pressedLightAtIndex(_ index: Int) -> Bool{
        if lightStates.contains(true){
            totalMoves += 1
            lightStates[index] = !lightStates[index]
            if index != 0{
                lightStates[index-1] = !lightStates[index-1]
            }
            if index != lightStates.count-1{
                lightStates[index+1] = !lightStates[index+1]
            }
            if lightStates.contains(true){
                return false
            }
            return true
        }else {
            return true
        }
        
    }
        
    func convertToNum() ->String{
//        var sequence = [Int]()
        var re = String()
        for i in lightStates{
//            sequence.append(i ? "1" : "0")
            re.append(i ? "1" : "0")
        }
        return re
    }
    
    var description: String{
        return "Lights: \(convertToNum()) Moves: \(totalMoves)"
    }
}
