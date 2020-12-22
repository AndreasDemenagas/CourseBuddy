//
//  CourseLevelCellView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//


import UIKit

class CourseLevelCellView: UIView {
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 16))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var level: Level? {
        didSet {
            guard let item = level else { return }
            setup(with: item)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        addSubview(label)
        label.fillSuperView()
    }
    
    private func setup(with level: Level) {
        switch level {
        case .hl:
            self.backgroundColor = .systemBlue
            self.label.text = "HL"
        case .sl:
            self.backgroundColor = .systemGreen
            self.label.text = "SL"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

