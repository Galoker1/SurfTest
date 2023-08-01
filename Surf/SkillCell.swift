//
//  SkillCell.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import Foundation
import UIKit

class SkillCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    var deleteImage = UIImageView(image: UIImage(named: "delete"))
    
    let singletone = Singletone.shared
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("--")
    }

    func setupUI() {
        contentView.backgroundColor = UIColor(hex: "#F3F3F5")
        contentView.layer.cornerRadius = 14
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if singletone.isEditing{
            let stack = UIStackView()
            stack.axis = .horizontal
            addSubview(titleLabel)
            addSubview(deleteImage)
            self.clipsToBounds = true
            deleteImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: 111),
                contentView.heightAnchor.constraint(equalToConstant: 44),
                titleLabel.widthAnchor.constraint(equalToConstant: 50),
                titleLabel.heightAnchor.constraint(equalToConstant: 44),
                deleteImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                deleteImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
                deleteImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor,constant: 20),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            ])
        }
        else{
            titleLabel.textAlignment = .center
            addSubview(titleLabel)

            self.clipsToBounds = true
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: 111),
                contentView.heightAnchor.constraint(equalToConstant: 44),
                titleLabel.widthAnchor.constraint(equalToConstant: 111),
                titleLabel.heightAnchor.constraint(equalToConstant: 44),
                titleLabel.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            ])
            
        }
        
    }
}
