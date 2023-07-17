//
//  ViewController.swift
//  ex_6_spingAnimation
//
//  Created by Кох Александр Станиславович on 17.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            moveView(to: position)
        }
    }
    
    private func configure() {
        squareView.frame = CGRect(x: view.bounds.midX - 50, y: view.bounds.midY - 50, width: 100, height: 100)
        squareView.backgroundColor = .blue
        squareView.layer.cornerRadius = 10
        view.addSubview(squareView)
    }
    
    private func moveView(to position: CGPoint) {
        var angle: CGFloat = 0
        
        if position.x >= squareView.center.x {
            angle = 0.3
        } else {
            angle = -0.3
        }
        
        squareView.transform = CGAffineTransform(rotationAngle: angle)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
            self.squareView.layer.position = position
            self.squareView.transform = .identity
        }
    }
}
