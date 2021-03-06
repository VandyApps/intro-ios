//
//  GameScene.swift
//  RocketGame
//
//  Created by Ethan Look on 11/15/16.
//  Copyright (c) 2016 Ethan Look. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let rocket = Rocket(x: location.x, y: location.y, z: 0)
            rocket.addTo(self)
            rocket.flyAndRemove(self.frame.height + 100)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
