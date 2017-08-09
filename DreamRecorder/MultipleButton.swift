//
//  MultipleButton.swift
//  DreamRecorder
//
//  Created by JU HO YOON on 2017. 8. 9..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit

protocol MultipleButtonDelegate: NSObjectProtocol {
    func multipleButton(_: MultipleButton, didTapButtonAt index: Int)
}

@IBDesignable
class MultipleButton: UIStackView {
    
    @IBInspectable var numberOfButton: Int = 2 {
        didSet {
            self.setupButtons()
        }
    }
    @IBInspectable var buttonBackgroundColor: UIColor = UIColor.white {
        didSet {
            for button in self.buttons {
                button.backgroundColor = buttonBackgroundColor
            }
        }
    }
    @IBInspectable var buttonTitleColor: UIColor = UIColor.black {
        didSet {
            for button in self.buttons {
                button.setTitleColor(buttonTitleColor, for: .normal)
            }
        }
    }
    @IBInspectable var buttonTitleColorHighlighted: UIColor = UIColor.gray {
        didSet {
            for button in self.buttons {
                button.setTitleColor(buttonTitleColor, for: .highlighted)
            }
        }
    }
    
    var delegate: MultipleButtonDelegate?
    var buttons: [UIButton] = []
    
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.setupButtons()
    }
    
    private func setupButtons(){
        
        for button in self.buttons {
            self.removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        self.buttons.removeAll()
        
        for index in 0 ..< self.numberOfButton {
            let newButton = UIButton()
            self.buttons.append(newButton)
            newButton.backgroundColor = UIColor.red
            newButton.setTitle("\(index)", for: .normal)
            newButton.tag = index
            newButton.addTarget(self, action: #selector(self.buttonDidTouchUpInside(sender:)), for: .touchUpInside)
            self.addArrangedSubview(newButton)
        }
    }
    
    @objc private func buttonDidTouchUpInside(sender: UIButton) {
        self.delegate?.multipleButton(self, didTapButtonAt: sender.tag)
    }
    
}