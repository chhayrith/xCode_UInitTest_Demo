//
//  MovieTableCell.swift
//  TodoList
//
//  Created by liem on 12/1/23.
//

import UIKit

class MovieTableCell: UITableViewCell {
    
    static let identifier = "movieTableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
