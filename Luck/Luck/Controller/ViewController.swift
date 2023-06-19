//
//  ViewController.swift
//  Luck
//
//  Created by Deepanshu Gautam on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headMoves: UIStackView!
    
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet var tiles: [UIButton]!
    var luckManager = LuckManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        headMoves.layer.cornerRadius = 15
        headMoves.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headMoves.layer.borderWidth = 5
        headMoves.clipsToBounds = true
        
        shuffleButton.layer.cornerRadius = 10
        shuffleButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        shuffleButton.layer.borderWidth = 5
        shuffleButton.clipsToBounds = true
        
        shuffleButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shuffleButton.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        shuffleButton.layer.shadowOpacity = 1.0
        shuffleButton.layer.masksToBounds = false
        
        for tile in tiles {
            tile.layer.cornerRadius = 10
            tile.layer.borderWidth = 5
            tile.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            tile.clipsToBounds = true
        }
        luckManager.shuffleImages()
        // Do any additional setup after loading the view.
    }
    @IBAction func shuffleButtonPressed(_ sender: UIButton) {
        luckManager.shuffleImages()
        movesLabel.text = "Move Left : 4"
        for tile in tiles {
            tile.setImage(#imageLiteral(resourceName: "questionMark"), for: .normal)
        }
    }
    
    @IBAction func tileTouched(_ sender: UIButton) {
        luckManager.updateTileAndMoves(tile: sender, moveLabel: movesLabel)
    }
}

