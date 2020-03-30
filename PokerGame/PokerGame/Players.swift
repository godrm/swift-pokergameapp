//
//  Players.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import Foundation

struct Player : Codable {
    var name : String
}

class Players {
    private var players = [Player]()
    
    init(with count: Int) {
        (0..<count).forEach { index in
            players.append(Player(name: "Player\(index)"))
        }
    }
    
    init(with names: [String]) {
        names.forEach { name in
            players.append(Player(name: name))
        }
    }
    
    var count : Int {
        return players.count
    }

    subscript (index: Int) -> Player {        
        return players[index]
    }
}
