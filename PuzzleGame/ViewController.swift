//
//  ViewController.swift
//  PuzzleGame
//
//  Created by popescu petrisor on 21/11/18.
//  Copyright © 2018 popescu petrisor. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var  model = PuzzeleModel()
    var puzzleArray = [ItemPuzzle()]
    var firstIndex:IndexPath=IndexPath(item: 0, section: 0)
     var bool:Bool=true
    var timer:Timer?
    var miliseconds:Float=20*1000
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate=self
        collectionView.dataSource=self
       // puzzleArray=model.getPuzzle()
        riplay()
        timer=Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @objc func timerElapsed(){
        miliseconds-=1
        let seconds=String(format: "%.2f", miliseconds/1000)
        timerLabel.text="Time rimaning:\(seconds)"
        if miliseconds<=0{
            timer?.invalidate()
            timerLabel.textColor = UIColor.blue
            checkGameEnded()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let width = self.collectionView.frame.size.width
        let itemWidth=(width-(10*3))/4
        let itemHight = itemWidth*1.4177
        layout.itemSize=CGSize(width: itemWidth, height: itemHight)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return puzzleArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PuzzleCollectionViewCell
        let puzzle = puzzleArray[indexPath.row]
       
        cell.setPuzzle(puzzle)
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
           
            let cell = collectionView.cellForItem(at: indexPath) as! PuzzleCollectionViewCell
            let cell2 = collectionView.cellForItem(at: firstIndex) as? PuzzleCollectionViewCell
        let coll=indexPath.row%4
        print(coll)
            
        if ((indexPath.row==firstIndex.row+1)&&(!(coll==0))||(indexPath.row==firstIndex.row-1 )&&(!(coll==3))||(indexPath.row==firstIndex.row+4)||(indexPath.row==firstIndex.row-4)){
            
            let puzzleTwo = puzzleArray[indexPath.row]
            let tmp=puzzleTwo.imageName
            let numero=puzzleTwo.numero
            let puzzleOne=puzzleArray[firstIndex.row]
            puzzleTwo.imageName = puzzleOne.imageName
            puzzleTwo.numero=puzzleOne.numero
            cell.setPuzzle(puzzleTwo)
            
            
            puzzleOne.imageName = tmp
            puzzleOne.numero=numero
            cell2?.setPuzzle(puzzleOne)
            firstIndex=indexPath
            if cell2==nil
            {collectionView.reloadItems(at: [firstIndex])}
            
            checkGameEnded()}
        
        
    }
    
    
    func checkGameEnded(){
        var title:String=""
        var message:String=""
        for i in 0...puzzleArray.count-2{
            if !(puzzleArray[i].numero < puzzleArray[i+1].numero){
                bool=false
                break
                
            }
            bool=true
        }
        if bool==true{
            if miliseconds>0{
                timer?.invalidate()
            }
            
            title="victorie"
            message="Un altra partita?"
           showAlert(title, message)
        }
        else {
            if miliseconds>0{
                return
            }
            title="sconfita"
            message="Un altra partita?"
            showAlert(title, message)
            
        }
        
        
        
    }
    func riplay(){
        puzzleArray=model.getPuzzle()
        print ("riprendo")
        
        
    }
    func showAlert(_ title:String, _ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertAction1 = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(alertAction)
        alert.addAction(alertAction1)
        
        present(alert,animated: true,completion: nil )
        
        
    }
    
    

}


