//
//  LuckManager.swift
//  Luck
//
//  Created by Deepanshu Gautam on 29/06/21.
//
import UIKit
struct LuckManager {
    var images: [UIImage] = [#imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "love"), #imageLiteral(resourceName: "sad"), #imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "love"), #imageLiteral(resourceName: "sad"), #imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "love"), #imageLiteral(resourceName: "sad")]
    var moves = 4
    var tileSelected: [Int] = []
    var finished = false
    mutating func shuffleImages() -> Void {
        moves = 4
        images.shuffle()
        tileSelected = []
        finished = false
    }
    
    func checkWon() -> Bool {
        if images[tileSelected[0]] == images[tileSelected[1]] && images[tileSelected[1]] == images[tileSelected[2]] {
            return true
        } else if images[tileSelected[1]] == images[tileSelected[2]] && images[tileSelected[2]] == images[tileSelected[3]] {
            return true
        } else if images[tileSelected[0]] == images[tileSelected[1]] && images[tileSelected[1]] == images[tileSelected[3]] {
            return true
        } else if images[tileSelected[0]] == images[tileSelected[2]] && images[tileSelected[2]] == images[tileSelected[3]] {
            return true
        } else {
            return false
        }
    }
    
    func checkWon3() -> Bool {
        if images[tileSelected[0]] == images[tileSelected[1]] && images[tileSelected[1]] == images[tileSelected[2]] {
            return true
        } else {
            return false
        }
    }
    
    mutating func updateTileAndMoves(tile: UIButton, moveLabel: UILabel) -> Void {
        if !finished {
            let tileNumber = Int(tile.currentTitle!)
            tileSelected.append(tileNumber!-1)
            tile.setImage(images[tileNumber!-1], for: .normal)
            moves -= 1
            if moves == 1 {
                if checkWon3() {
                    moveLabel.text = "You Are Awesome!"
                    finished = true
                } else {
                    moveLabel.text = "Move Left : \(moves)"
                }
            } else if moves == 0 {
                if checkWon() {
                    moveLabel.text = "You Are Awesome!"
                } else {
                    moveLabel.text = "Sorry, You Lost!"
                }
                finished = true
            } else {
                moveLabel.text = "Move Left : \(moves)"
            }
        }
    }
}
