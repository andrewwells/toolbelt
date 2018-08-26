//
//  BaseButton.swift
//  ToolbeltUI
//
//  Created by Andrew Wells on 8/25/18.
//

import UIKit
import SnapKit

open class RoundButton: BaseButton {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
    
    override func setupViews() {
        
        addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            let insets = labelInsets ?? UIEdgeInsetsMake(labelPadding, labelPadding, labelPadding, labelPadding)
            make.edges.equalToSuperview().inset(insets)
        }

        self.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.height)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

open class BaseButton: UIControl {
    
    public var onTap: (() -> Void)?
    
    public var labelPadding: CGFloat = 8
    public var labelInsets: UIEdgeInsets?
    
    public var cornerRadius: CGFloat? {
        didSet {
            self.layer.cornerRadius = cornerRadius ?? 0
        }
    }
    
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private var animator = UIViewPropertyAnimator()
    
    public var normalColor = UIColor(hex: 0x333333)
    public var highlightedColor = UIColor(hex: 0x737373)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        backgroundColor = normalColor
        
        addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        addTarget(self, action: #selector(touchUpInside), for: [.touchUpInside])
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            let insets = labelInsets ?? UIEdgeInsetsMake(labelPadding, labelPadding, labelPadding, labelPadding)
            make.edges.equalToSuperview().inset(insets)
        }
    }
    
    @objc private func touchDown() {
        animator.stopAnimation(true)
        backgroundColor = highlightedColor
    }
    
    @objc private func touchUp() {
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            self.backgroundColor = self.normalColor
        })
        animator.startAnimation()
    }
    
    @objc private func touchUpInside() {
       onTap?()
    }
    
}
