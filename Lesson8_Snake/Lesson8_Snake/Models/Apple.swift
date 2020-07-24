//
//  Apple.swift
//  Lesson8_Snake
//
//  Created by Vitaly Prosvetov on 22.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit
import SpriteKit

class Apple: SKShapeNode {
    
    let diameter = 10
    
    convenience init(position: CGPoint) {
        self.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(diameter), height: CGFloat(diameter))).cgPath
        fillColor = GameColors.appleColor
        strokeColor = GameColors.appleColor
        lineWidth = 5
        self.position = position
        // Добавляем физическое тело, совпадающее с изображением яблока
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter + 1), center: CGPoint(x: 5, y:5))
        // Категория - яблоко
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple        
    }
    
}

