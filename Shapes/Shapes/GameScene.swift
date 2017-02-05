//
//  GameScene.swift
//  Shapes
//
//  Created by Shabir Jan on 05/02/2017.
//  Copyright © 2017 Shabir Jan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    struct PhysicsCategory {
        static let Player: UInt32 = 1
        static let Obstacle: UInt32 = 2
        static let Edge: UInt32 = 4
    }
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let colors = [SKColor.yellow,SKColor.red,SKColor.blue,SKColor.purple]
    let player = SKShapeNode(circleOfRadius: 40)
    
    override func didMove(to view: SKView) {
        setupPlayerAndObstacles()
        
        
        let playerBody = SKPhysicsBody(circleOfRadius: 30)
        playerBody.mass = 1.5
        playerBody.categoryBitMask = PhysicsCategory.Player
        player.physicsBody = playerBody
        
        let ledge = SKNode()
        ledge.position = CGPoint(x:size.width/2, y:160)
        let ledgeBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 10))
        ledgeBody.isDynamic = false
        ledgeBody.categoryBitMask = PhysicsCategory.Edge
        ledge.physicsBody = ledgeBody
        addChild(ledge)
        
        physicsWorld.gravity.dy = -22
        
    }
    
    func setupPlayerAndObstacles(){
        addPlayer()
        addObstacle()
    }
    func addPlayer(){
        player.fillColor = .blue
        player.strokeColor = player.fillColor
        player.position = CGPoint(x:size.width/2,y:200)
        addChild(player)
    }
    func addObstacle()
    {
        addCircleObstacle()
    }
    
    func addCircleObstacle() {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y:-200))
        
        path.addLine(to: CGPoint(x: 0, y: -160))
        
        path.addArc(withCenter: CGPoint.zero, radius: 160, startAngle: CGFloat(3.0 * M_PI_2), endAngle: CGFloat(0), clockwise: true)
        
        path.addLine(to: CGPoint(x:200,y:0))
        
        path.addArc(withCenter: CGPoint.zero, radius: 200, startAngle: CGFloat(0), endAngle: CGFloat(3.0 * M_PI_2), clockwise: false)
        
        let obstacle = obstacleByDuplicatingPath(path, clockwise: true)
        obstacle.position = CGPoint(x:size.width/2, y:size.height/2)
        addChild(obstacle)
        
        let rotationAction = SKAction.rotate(byAngle: 2.0 * CGFloat(M_PI), duration: 8.0)
        obstacle.run(SKAction.repeatForever(rotationAction))
       
    }
    
    
    func obstacleByDuplicatingPath(_ path:UIBezierPath, clockwise:Bool) -> SKNode{
        let container = SKNode()
        
        var rotationFactor = CGFloat(M_PI_2)
        if !clockwise{
            rotationFactor *= -1
        }
        
        for i in 0...3 {
            let section = SKShapeNode(path: path.cgPath)
            section.fillColor = colors[i]
            section.strokeColor = colors[i]
            section.zRotation = rotationFactor * CGFloat(i)
            
            container.addChild(section)
        }
        return container
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.physicsBody?.velocity.dy = 800.0
        
    }
    
}
