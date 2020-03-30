//
//  PokerGame.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import Foundation

class PokerGame {
    enum Notification {
        static let DidChangePlayers = Foundation.Notification.Name("DidChangePlayers")
    }
    
    private var players : Players 
    
    init(with numberOfPlayers: Int) {
        players = Players(with: numberOfPlayers)
        NotificationCenter.default.post(name: Notification.DidChangePlayers, object: self)
    }
    
    func iteratePlayerName(with handler: (String)->()) {
        (0..<players.count).forEach { (index) in
            let player = players[index]
            handler(player.name)
        }
    }
}
