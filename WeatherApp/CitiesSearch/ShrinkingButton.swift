//
//  ShrinkingButton.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import UIKit

class ShrinkingButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTouchEvents()
        setupStyle()
    }
    
    private func setupStyle() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
        backgroundColor = .defaultColor
        setTitleColor(.defaultButtonTitleColor, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private func addTouchEvents() {
        addTarget(self, action: #selector(highlight), for: .touchDown)
        addTarget(self, action: #selector(highlight), for: .touchDragEnter)
        addTarget(self, action: #selector(highlight), for: .touchDownRepeat)
        addTarget(self, action: #selector(highlight), for: .touchDragInside)
        addTarget(self, action: #selector(unhighlight), for: .touchDragOutside)
        addTarget(self, action: #selector(unhighlight), for: .touchUpOutside)
        addTarget(self, action: #selector(unhighlight), for: .touchCancel)
        addTarget(self, action: #selector(unhighlight), for: .touchDragExit)
        addTarget(self, action: #selector(unhighlight), for: .touchUpInside)
    }
    
    @objc private func highlight() {
        UIView.animate(withDuration: Constants.Animation.short, delay: 0, options: [.curveEaseOut], animations: {
            self.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        }, completion: nil)
    }
    
    @objc private func unhighlight() {
        UIView.animate(withDuration: Constants.Animation.short, delay: 0, options: [.curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
