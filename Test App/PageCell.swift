//
//  pageCell.swift
//  Test App
//
//  Created by Kendall Sanford on 8/11/18.
//  Copyright © 2018 Kendall Sanford. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            
            guard let unWrappedPage = page else { return }
            
            topImageView.image = UIImage(named: unWrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unWrappedPage.headerText,
                                                           attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n \(unWrappedPage.bodyText)",
                                                     attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16),
                                                                  NSAttributedStringKey.foregroundColor : UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    // set cell image view
    private let topImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "puppy"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // set cell text label
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor(white: 1, alpha: 0)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayouts() {
        
        // setup top image container
        let topImageContainer = UIView()
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageContainer)
        topImageContainer.addSubview(topImageView)
        addSubview(descriptionTextView)
        
        topImageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        topImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        topImageView.widthAnchor.constraint(equalTo: topImageContainer.widthAnchor, multiplier: 0.6).isActive = true
        topImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.6).isActive = true
        
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionTextView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
