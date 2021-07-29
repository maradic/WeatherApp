//
//  FloatingButton.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import UIKit

final class FloatingButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
        addTouchEvents()
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
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: nil)
    }
    
    @objc private func unhighlight() {
        UIView.animate(withDuration: Constants.Animation.short, delay: 0, options: [.curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func setupStyle() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.size.height / 2
        setImage(imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        setImage(imageView?.image?.withRenderingMode(.alwaysTemplate), for: .selected)
        setImage(imageView?.image?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        
        tintColor = .white
        backgroundColor = .defaultColor
        addBottomShadow(blur: 4, ySpread: 2)
        setTitle("", for: .normal)
        setTitle("", for: .focused)
        setTitle("", for: .selected)
        adjustsImageWhenDisabled = false
    }
}
