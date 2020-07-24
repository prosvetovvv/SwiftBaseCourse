//
//  GameScene.swift
//  Lesson8_Snake
//
//  Created by Vitaly Prosvetov on 22.07.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var snake: Snake?
    
    // вызывается при первом запуске сцены
    override func didMove(to view: SKView) {
        settingScene (for: view)
        createСounterClockwiseButton (for: view)
        createClockwiseButton (for: view)
        createSnake (for: view)
        createApple()
    }
    
    private func settingScene (for view: SKView) {
        
        backgroundColor = GameColors.backgroundColor
        // вектор и сила гравитации
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        // добавляем поддержку физики
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 0, y: 90, width: view.scene!.frame.maxX, height: view.scene!.frame.maxY-90))
        // выключаем внешние воздействия на игру
        self.physicsBody?.allowsRotation = false
        // включаем отображение физ. тела
        // view.showsPhysics = true
        // Делаем нашу сцену делегатом соприкосновений
        self.physicsWorld.contactDelegate = self
        
        // устанавливаем категорию взаимодействия с другими объектами
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        // устанавливаем категории, с которыми будут пересекаться края сцены
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
    
    private func createСounterClockwiseButton (for view: SKView) {
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        counterClockwiseButton.fillColor = GameColors.upButtonColor
        counterClockwiseButton.strokeColor = GameColors.upButtonColor
        counterClockwiseButton.lineWidth = 1
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
    }
    
    private func createClockwiseButton (for view: SKView) {
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX-80, y: view.scene!.frame.minY+30)
        clockwiseButton.fillColor = GameColors.upButtonColor
        clockwiseButton.strokeColor = GameColors.upButtonColor
        clockwiseButton.lineWidth = 1
        clockwiseButton.name = "clockwiseButton"
        self.addChild(clockwiseButton)
    }
    
    private func createSnake (for view: SKView) {
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
    
    private func createApple() {
        let randX = CGFloat.random(in: 20..<view!.scene!.frame.maxX-20)
        let randY = CGFloat.random(in: 90..<view!.scene!.frame.maxY-20)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // перебираем все точки, куда прикоснулся палец
        for touch in touches {
            // определяем координаты касания для точки
            let touchLocation = touch.location(in: self)
            // проверяем, есть ли объект по этим координатам, и если есть, то не наша ли это кнопка
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            // если это наша кнопка, заливаем ее зеленым
            touchedNode.fillColor = GameColors.downButtonColor
            // определяем, какая кнопка нажата, и поворачиваем в нужную сторону
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // повторяем все то же самое для действия, когда палец отрывается от экрана
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            touchedNode.fillColor = GameColors.upButtonColor
        }
    }
    
    // вызывается при обрыве нажатия на экран, например, если телефон примет звонок и свернет приложение
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    // вызывается при обработке кадров сцены
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
}

// Категория пересечения объектов
struct CollisionCategories{
    // Тело змеи
    static let Snake: UInt32 = 0x1 << 0
    // Голова змеи
    static let SnakeHead: UInt32 = 0x1 << 1
    // Яблоко
    static let Apple: UInt32 = 0x1 << 2
    // Край сцены (экрана)
    static let EdgeBody:   UInt32 = 0x1 << 3
}



extension GameScene: SKPhysicsContactDelegate {
    
    // Добавляем метод отслеживания начала столкновения
    func didBegin(_ contact: SKPhysicsContact) {
        
        // логическая сумма масок соприкоснувшихся объектов
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        // вычитаем из суммы голову змеи, и у нас остается маска второго объекта
        let collisionObject = bodies ^ CollisionCategories.SnakeHead
        
        // проверяем, что это за второй объект
        switch collisionObject {
        case CollisionCategories.Apple:
            // проверяем, что это яблоко
            // яблоко – это один из двух объектов, которые соприкоснулись. Используем тернарный оператор, чтобы вычислить, какой именно
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            // добавляем к змее еще одну секцию
            snake?.addBodyPart()
            print("!!!!")
            // удаляем съеденное яблоко со сцены
            apple?.removeFromParent()
            // создаем новое яблоко
            createApple()
            
        case CollisionCategories.EdgeBody: // проверяем, что это стенка экрана
            snake?.removeFromParent()
            self.createSnake(for: view!)
            
            //case CollisionCategories.Snake:
            //snake?.removeFromParent()
            //self.createSnake(for: view!)
            //print("!!!!")
            
        default:
            break
        }        
    }
}
