//
//  Snake.swift
//  Lesson8_Snake
//
//  Created by Vitaly Prosvetov on 22.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    
    var body = [SnakeBodyPart]()
    // скорость перемещения
    let moveSpeed = 125.0
    // угол, необходимый для расчета направления
    var angle: CGFloat = 0.0
    
    convenience init(atPoint point: CGPoint) {
        self.init()
        // змейка начинается с головы, создадим ее
        let head = SnakeHead(atPoint: point)
        body.append(head)
        // и сделаем ее дочерним объектом.
        addChild(head)
    }
    
    func addBodyPart(){
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    func move(){
        guard !body.isEmpty else { return }
        let head = body[0]
        moveHead(head)
        for index in (0..<body.count) where index > 0 {
            let previousBodyPart = body[index-1]
            let currentBodyPart = body[index]
            moveBodyPart(previousBodyPart, c: currentBodyPart)
        }
    }
    
    func moveHead(_ head: SnakeBodyPart){
        // рассчитываем смещение точки
        let dx = CGFloat(moveSpeed) * sin(angle);
        let dy = CGFloat(moveSpeed) * cos(angle);
        // смещаем точку назначения головы
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        // действие перемещения головы
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        // запуск действия перемещения
        head.run(moveAction)
    }
    
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart){
        // перемещаем текущий элемент к предыдущему
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1 )
        // запуск действия перемещения
        c.run(moveAction)
    }
    
    func moveClockwise(){
        // смещаем угол на 45 градусов
        angle += CGFloat(Double.pi/2)
    }
    // поворот против часовой стрелки
    func moveCounterClockwise(){
        angle -= CGFloat(Double.pi/2)
    }
}

