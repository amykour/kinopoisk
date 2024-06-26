//
//  CustomHeader.swift
//  Kinopoisk
//
//  Created by Алена on 14.04.2024.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    var mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Manrope", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(mainLabel)
    }
}

//MARK: - Constraints

extension CustomHeader {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor.constraint(equalToConstant: 30),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

