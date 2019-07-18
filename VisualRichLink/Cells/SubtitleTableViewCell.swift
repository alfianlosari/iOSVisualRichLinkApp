//
//  SubtitleTableViewCell.swift
//  VisualRichLink
//
//  Created by Alfian Losari on 18/07/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
