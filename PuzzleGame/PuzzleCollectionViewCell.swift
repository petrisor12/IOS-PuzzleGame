//
//  PuzzleCollectionViewCell.swift
//  PuzzleGame
//
//  Created by popescu petrisor on 21/11/18.
//  Copyright © 2018 popescu petrisor. All rights reserved.
//

import UIKit

class PuzzleCollectionViewCell: UICollectionViewCell {
   

    @IBOutlet weak var puzzleImageView: UIImageView!
    
    var puzzle:ItemPuzzle!
    
    func setPuzzle(_ puzzle:ItemPuzzle){
        self.puzzle=puzzle
        puzzleImageView.image=UIImage(named: puzzle.imageName)
}
    
    
}
