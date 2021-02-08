//
//  FriendNameSelectorControl.swift
//  GeekBrainsUILesson
//
//  Created by Андрей Ситников on 07.02.2021.
//

import UIKit

class FriendNameSelectorControl: UIControl {
    /*
    var selectedName : FriendName?
    
    var symbols: [FriendName] = FriendName.allLetters
    
    private lazy var buttons: [UIButton] = {
        var buttons = [UIButton]()
        for latter in symbols {
            let button = UIButton(type: .system)
            button.setTitle(latter.title, for: .normal)
            button.addTarget(self, action: #selector(didTapLatter(button:)), for: .touchUpInside)
            button.setTitleColor(.gray, for: .normal)
            buttons.append(button)
        }
        return buttons
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(stackView)
        addPanGestureRecognizer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        addPanGestureRecognizer()
    }
    
    private func addPanGestureRecognizer() {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        addGestureRecognizer(recognizer)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed, .ended:
            let location = recognizer.location(in: self)
            let targetView = hitTest(location, with: nil)
            if let button = targetView as? UIButton, let index = buttons.firstIndex(of: button) {
                let nameByIndex = FriendName.allLetters[index]
                if nameByIndex != selectedName {
                    selectedName = nameByIndex
                    print(nameByIndex.title)
                    sendActions(for: .valueChanged)
                }
            }
        default:
            return
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    @objc func didTapLatter(button: UIButton) {
        guard let index = buttons.firstIndex(of: button) else { return }
        selectedName = FriendName(rawValue: index)
        for (idx, button) in buttons.enumerated() {
            button.isSelected = index == idx
        }
        sendActions(for: .valueChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    */
}
