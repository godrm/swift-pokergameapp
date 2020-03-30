//
//  PlayerView.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit

class PlayerView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardStack: UIStackView!
    @IBOutlet weak var winnerMedal: UILabel!
    
    enum Keys {
        static let NameLabel = "NameLabel"
        static let CardStack = "CardStack"
        static let WinnerMedal = "WinnerMedal"
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(nameLabel, forKey: Keys.NameLabel)
        coder.encode(cardStack, forKey: Keys.CardStack)
        coder.encode(winnerMedal, forKey: Keys.WinnerMedal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.nameLabel = coder.decodeObject(forKey: Keys.NameLabel) as? UILabel
        self.cardStack = coder.decodeObject(forKey: Keys.CardStack) as? UIStackView
        self.winnerMedal = coder.decodeObject(forKey: Keys.WinnerMedal) as? UILabel
    }
}
