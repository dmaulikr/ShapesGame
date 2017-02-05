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
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        setupPlayerAndObstacles()
    }
    
    func setupPlayerAndObstacles(){
        addObstacle()
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
        
        let section = SKShapeNode(path: path.cgPath)
        section.position = CGPoint(x:size.width/2, y:size.height/2)
        section.fillColor = .yellow
        section.strokeColor = .yellow
        addChild(section)
        
        let section2 = SKShapeNode(path: path.cgPath)
        section2.position = CGPoint(x: size.width/2, y: size.height/2)
        section2.fillColor = .red
        section2.strokeColor = .red
        section2.zRotation = CGFloat(M_PI)
        addChild(section2)
    }
    
    
}
