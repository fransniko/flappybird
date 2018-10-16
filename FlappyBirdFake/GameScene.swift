//
//  GameScene.swift
//  FlappyBirdFake
//
//  Created by apple on 2018/9/25.
//  Copyright © 2018年 15132809. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    
    let backgroundNode = SKSpriteNode(imageNamed: "bg")
    let playerNode1 = SKSpriteNode(imageNamed: "bird1")
    let orbNode = SKSpriteNode(imageNamed: "flower")
    let pillarNode = SKSpriteNode(imageNamed: "pillar")
    
    let CollisionCategoryPlayer : UInt32 = 0x1 << 1
    let CollisionCategoryPowerUpOrbs : UInt32 = 0x1 << 2
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        backgroundColor = SKColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        isUserInteractionEnabled = true
        
        
        // adding the background
        backgroundNode.size.width = frame.size.width
        backgroundNode.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundNode.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(backgroundNode)
        
        // add the player
        playerNode1.physicsBody = SKPhysicsBody(circleOfRadius: playerNode1.size.width / 2)
        playerNode1.physicsBody?.isDynamic = true
        
        playerNode1.position = CGPoint(x: size.width / 2.0 , y: 80.0)
        playerNode1.physicsBody?.linearDamping = 1.0
        playerNode1.physicsBody?.allowsRotation = false
        playerNode1.physicsBody?.categoryBitMask = CollisionCategoryPlayer
        playerNode1.physicsBody?.contactTestBitMask = CollisionCategoryPowerUpOrbs
        playerNode1.physicsBody?.collisionBitMask = 0
        addChild(playerNode1)
        
        orbNode.position = CGPoint(x: 150, y: size.height - 25)
        orbNode.physicsBody = SKPhysicsBody(circleOfRadius: orbNode.size.width / 2.0)
        orbNode.physicsBody?.isDynamic = false
        orbNode.physicsBody?.categoryBitMask = CollisionCategoryPowerUpOrbs
        orbNode.physicsBody?.collisionBitMask = 0
        orbNode.name = "flower"
        addChild(orbNode)
        
        // adding pillar
        pillarNode.position = CGPoint(x: size.width / 2.0, y: 80)
        pillarNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pillarNode.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(pillarNode)
        
        // let playerNode2 = SKSpriteNode(imageNamed: "Player")
        //playerNode2.position = CGPoint(x: size.width / 2.0, y: 100.0)
        //addChild(playerNode2)
        
        //let playerNode3 = SKSpriteNode(imageNamed: "Player")
        // playerNode3.position = CGPoint(x: size.width / 2.0, y: 120.0)
        //addChild(playerNode3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerNode1.physicsBody?.applyImpulse(CGVector(dx: 0.00, dy: 40.0))
    }
}
extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact){
        let nodeB = contact.bodyB.node
        if nodeB?.name == "flower" {
            nodeB?.removeFromParent()
        }
        
        
        
    }
}

