//
//  LinkViewTableViewCell.swift
//  VisualRichLink
//
//  Created by Alfian Losari on 16/07/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit
import LinkPresentation

class LinkViewTableViewCell: UITableViewCell {
    
    var linkView: LPLinkView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        linkView?.removeFromSuperview()
    }

    func configure(_ metadata: LPLinkMetadata) {
        let linkView = LPLinkView(metadata: metadata)
        contentView.addSubview(linkView)
        linkView.translatesAutoresizingMaskIntoConstraints = false
        
        linkView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        linkView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        linkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        linkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        
        
        
        self.linkView = linkView
    }

}
