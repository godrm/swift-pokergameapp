//
//  ViewController.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var playerSegment: UISegmentedControl!
    @IBOutlet weak var playerStack: UIStackView!
    @IBOutlet var playerPanel: PlayerView!
    
    //MARK:- internal property
    private var game : PokerGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegate()
        resetGame()
    }
    
    private func configureDelegate() {
        playerSegment.addTarget(self, action: #selector(playerChanged), for: .valueChanged)
    }
    
    private func resetGame() {
        configureGame()
        configureGameView()
    }
    
    @objc func playerChanged(_ sender: UISegmentedControl) {
        resetGame()
    }

    private func configureGame() {
        let selectedIndex = playerSegment.selectedSegmentIndex
        self.game = PokerGame(with: selectedIndex + 3)
    }
    
    private func configureGameView() {
        for subview in self.playerStack.arrangedSubviews {
            subview.removeFromSuperview()
        }
        game.iteratePlayerName(with: {
            name in
            let player = makePlayerView(with: name)
            self.playerStack.addArrangedSubview(player)
        })
    }
    
    private func makePlayerView(with name: String) -> PlayerView {
        let view = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(NSKeyedArchiver.archivedData(withRootObject: playerPanel!, requiringSecureCoding: false)) as! PlayerView

        view.nameLabel.text = name
        view.winnerMedal.isHidden = true
        return view
    }

    
}

