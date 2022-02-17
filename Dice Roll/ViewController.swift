//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import Lottie
import SwiftUI

class ViewController: UIViewController {

    
    lazy var backgroundAnimationView: AnimationView = {
    
    
    
        let animationView = AnimationView()
        //view.sendSubviewToBack(animationView)
        
        view.addSubview(animationView)
        
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
         
       
/*
        animationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        animationView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        animationView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
  */
        
        //animationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500) = false
        
        
        animationView.widthAnchor.constraint(equalToConstant: 450).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 175).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        
        
      //  let scaleValueProvider = SizeValueProvider(CGSize(width: 1000, height: 1000))
        
        //let dotKeyPath = AnimationKeypath(keypath:"Dot*.Shape 1.Scale")
        //animationView.setValueProvider(scaleValueProvider, keypath: dotKeyPath)
        
        /*

        NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3),animationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3)
                                    
                                    ])
         */

       
       // animationView.removeFromSuperview()
        
        return animationView
        
        
    }()
    lazy var backgroundAnimationView2: AnimationView = {
    
    
    
        let animationView2 = AnimationView()
        //view.sendSubviewToBack(animationView)
        
        view.addSubview(animationView2)
        
        
        
        animationView2.translatesAutoresizingMaskIntoConstraints = false
         
       

        animationView2.widthAnchor.constraint(equalToConstant: 450).isActive = true
        animationView2.heightAnchor.constraint(equalToConstant: 450).isActive = true
        animationView2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        animationView2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        
        //let scaleValueProvider = SizeValueProvider(CGSize(width: 1000, height: 1000))
        
        //let dotKeyPath = AnimationKeypath(keypath:"Dot*.Shape 1.Scale")
        //animationView2.setValueProvider(scaleValueProvider, keypath: dotKeyPath)
        
        /*

        NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3),animationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3)
                                    
                                    ])
         */

       
       // animationView.removeFromSuperview()
        
        return animationView2
        
        
    }()
    
    private func playBackgroundAnimationBoom2(){
        let animation = Animation.named("boom2")
        backgroundAnimationView2.animation = animation
        
        backgroundAnimationView2.play{_ in
            self.backgroundAnimationView2.isHidden = false
            
        }
        
        backgroundAnimationView2.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce)
    
        backgroundAnimationView2.play { (finished) in
            self.backgroundAnimationView2.isHidden = true
        }
        
    }
        
        
    private func playBackgroundAnimationBoom(){
        let animation = Animation.named("boom")
        backgroundAnimationView.animation = animation
        
        backgroundAnimationView.play{_ in
            self.backgroundAnimationView.isHidden = false
            
        }
        
        backgroundAnimationView.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce)
    
        backgroundAnimationView.play { (finished) in
            self.backgroundAnimationView.isHidden = true
        }
        
    }
    
    
    
    
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    //Int.random(in: 0...5)
    
   
    @IBOutlet weak var button: UIButton!
    
    
    
    
    var leftDiceNum = 1
    var rightDiceNum = 1
    
    
    let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree") , #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // createLayer()
       
        //    who .  what    =  value
      
        button.layer.cornerRadius = 15
        
        
    }

    
    
    private func createLayer() {
        
        let layer = CAEmitterLayer()
        
        
        layer.emitterPosition = CGPoint(x: view.center.x, y: view.center.y)
        
        /*
        let cell = CAEmitterCell()
        cell.scale = 0.008
        cell.birthRate = 50
        cell.velocity = 20
        //cell.spin = 1
        //cell.duration
        cell.emissionRange = .pi * 10
        cell.lifetime = 20
        cell.color = UIColor.systemPink.cgColor
        cell.contents = UIImage(named: "imageconf")!.cgImage
        layer.emitterCells = [cell]
        */
        
        let colors: [UIColor] = [
            .systemRed,
                .systemBlue,
            .systemOrange,
            .systemGreen,
            .systemPink,
            .systemPurple
        
        ]
        let cells: [CAEmitterCell] = colors.compactMap{
            let cell = CAEmitterCell()
            cell.scale = 0.006
            cell.birthRate = 25
            cell.velocity = (cell.velocity + 2) * 50
            cell.spin = 50
            //cell.duration
            
            
            
            cell.emissionRange = .pi * 10
            cell.lifetime = 20
            cell.color = $0.cgColor
            cell.contents = UIImage(named: "imageconf")!.cgImage
            return cell
        }
        
        layer.emitterCells = cells
        
        view.layer.addSublayer(layer)
        
        
    }
/*
    private func dismissLayer() {
        
        let layer = CAEmitterLayer()
        
        
        layer.emitterPosition = CGPoint(x: view.center.x, y: view.center.y)
        
        
        let cell = CAEmitterCell()
        cell.scale = 0.008
        cell.birthRate = 50
        cell.velocity = 20
        //cell.spin = 1
    
        cell.emissionRange = .pi * 10
        cell.lifetime = 20
        cell.duration = 1
       // cell.color
        cell.contents = UIImage(named: "imageconf")!.cgImage
        layer.emitterCells = [cell]
        
        
        view.layer.addSublayer(layer)
        
        
    }

 */

    @IBAction func rollButtonInitial(_ sender: UIButton) {
        
        //createLayer()
        //LottieAnimation()
        
        button.alpha = 0.7
        playBackgroundAnimationBoom()
        playBackgroundAnimationBoom2()
    }
    
    @IBAction func rollButtonPress(_ sender: UIButton) {
       
        //super.viewDidLoad()
        button.alpha = 1
        
        diceImageView1.image =  diceArray.randomElement()
        diceImageView2.image =  diceArray[Int.random(in: 0...5)]
        
        /*
        if leftDiceNum & rightDiceNum < 5 {
        
        leftDiceNum += 1
            rightDiceNum += 1
        }
        */
        
        
        
        
       
        
        print("button tapped")
    }
    
    
    
    
    
    
}

