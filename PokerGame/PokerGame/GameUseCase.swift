//
//  GameUseCase.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import Foundation

struct GameUseCase {
    static func makeGame(with manager: NetworkManable, completed: @escaping (GamePlayerDataSource?) -> ()) {
        try? manager.getResource(from: NetworkManager.EndPoints.Players) { (data, error) in
            guard let data = data else { return }
            let names = try? JSONDecoder().decode([Player].self, from: data).map{ $0.name }
            let game = PokerGame(with: names ?? [])
            completed(game)
        }
    }
}
