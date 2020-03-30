//
//  ViewController.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var playerSegment: UISegmentedControl!
    @IBOutlet weak var playerStack: UIStackView!
    
    //MARK:- internal property
    private var game : GamePlayerDataSource!
    private var gamePublisher : AnyCancellable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegate()
        configureSubscriber()
        configureUsecase()
    }
    
    private func configureDelegate() {
        playerSegment.addTarget(self, action: #selector(playerChanged), for: .valueChanged)
    }
    
    @objc func playerChanged(_ sender: UISegmentedControl) {
        configureGame()
    }
    
    private func configureUsecase() {
        GameUseCase.makeGame(with: MockNetworkSuccessStub()) { (gameDataSoure) in
            self.game = gameDataSoure
        }
    }

    private func configureGame() {
        let selectedIndex = playerSegment.selectedSegmentIndex
        self.game = PokerGame(with: selectedIndex + 3)
    }
    
    private func configureSubscriber() {
        gamePublisher = NotificationCenter.default
                .publisher(for: PokerGame.Notification.DidChangePlayers)
                .sink { notification in
                    DispatchQueue.main.async {
                        self.configureGameView()
                    }
                }
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
        let view = Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first as! PlayerView

        view.nameLabel.text = name
        view.winnerMedal.isHidden = true
        return view
    }
}

