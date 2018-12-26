//
//  PuzzleModel.swift
//  PuzzleGame
//
//  Created by popescu petrisor on 21/11/18.
//  Copyright © 2018 popescu petrisor. All rights reserved.
//

import Foundation
class PuzzeleModel{
    
    func getPuzzle()->[ItemPuzzle]{
        var  generatedPuzzleArray=[ItemPuzzle]()
     let puzzle1=ItemPuzzle()
       
        for  i in 2...20{
            let puzzle=ItemPuzzle()
            if i>=10
            { puzzle.imageName="image_0\(i)"
                puzzle.numero = i
            }
            else
            { puzzle.imageName="image_00\(i)"
                puzzle.numero = i
            }
            generatedPuzzleArray.append(puzzle)
        }
        //generatedPuzzleArray.shuffle()
        
        puzzle1.imageName="back"
        puzzle1.numero=1
        generatedPuzzleArray.insert(puzzle1, at: 0)
            
        
            
        
        
        
        
        
        return generatedPuzzleArray
        
        
    }
    
}
