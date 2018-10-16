//
//  GameViewController.swift
//  FlappyBirdFake
//
//  Created by apple on 2018/9/25.
//  Copyright © 2018年 15132809. All rights reserved.
//


import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1 main view
        let skView = view as! SKView
        skView.showsFPS = true
        
        //2 config
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        
        //3 show
        skView.presentScene(scene)
        
    }
    
    
  
}
