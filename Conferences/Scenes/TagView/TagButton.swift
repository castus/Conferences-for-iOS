//
//  SearchViewController.swift
//  Conferences
//
//  Created by Pedro L. Diaz Montilla on 02/04/2019.
//  Copyright © 2019 Timon Blask. All rights reserved.
//

import UIKit

protocol TagButtonDelegate {
  func didSelectTag(_ tag: TagModel)
}

class TagCell: UICollectionViewCell {

    private var tagButton = TagButton()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        contentView.addSubview(tagButton)
        tagButton.edgesToSuperview()
    }
    
    func configureView(with tag: TagModel) {
        tagButton.configureView(with: tag)
    }
}

class TagButton: UIButton {

    init() {
        super.init(frame: .zero)
        
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        self.isUserInteractionEnabled = false
        self.layer.cornerRadius = 5.0
        self.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
    }

    func configureView(with tag: TagModel) {
        setTitle(tag.title, for: .normal)

        self.backgroundColor = tag.isActive ? UIColor(red:0.64, green:0.65, blue:0.69, alpha:1.0) : UIColor.white
    }
}
