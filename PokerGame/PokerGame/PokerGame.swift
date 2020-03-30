//
//  PokerGame.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import Foundation

protocol GamePlayerDataSource {
    func iteratePlayerName(with handler: (String)->())
}

class PokerGame : GamePlayerDataSource {
    enum Notification {
        static let DidChangePlayers = Foundation.Notification.Name("DidChangePlayers")
    }
    
    private var players : Players 
    
    init(with numberOfPlayers: Int) {
        players = Players(with: numberOfPlayers)
        NotificationCenter.default.post(name: Notification.DidChangePlayers, object: self)
    }
    
    init(with names: [String]) {
        players = Players(with: names)
        NotificationCenter.default.post(name: Notification.DidChangePlayers, object: self)
    }
    
    func iteratePlayerName(with handler: (String)->()) {
        (0..<players.count).forEach { (index) in
            let player = players[index]
            handler(player.name)
        }
    }
}

//MARK:- mock object for 3 players
class MockPoker3Players : GamePlayerDataSource {
    init() {
        NotificationCenter.default.post(name: PokerGame.Notification.DidChangePlayers, object: self)
    }
    
    func iteratePlayerName(with handler: (String)->()) {
        for index in 1...3 {
            let player = Player(name: "Name\(index)")
            handler(player.name)
        }
    }
}
