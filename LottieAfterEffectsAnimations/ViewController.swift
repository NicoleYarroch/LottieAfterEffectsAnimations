//
//  ViewController.swift
//  LottieAfterEffectsAnimations
//
//  Created by Nicole on 2/6/17.
//  Copyright © 2017 nicole@livio. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    var livioAnimation: LAAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        livioAnimation = LAAnimationView.animationNamed("Livio_Play_v2")
        livioAnimation.contentMode = .scaleAspectFit
        animationView.addSubview(livioAnimation)
        animationView.clipsToBounds = true

        setAnimationFrame()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            self.playAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        livioAnimation.pause()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.setAnimationFrame()
            // self.playAnimation()
        }
    }

    func setAnimationFrame() {
        let livioAnimationFrameWidth = animationView.frame.width / 5
        let livioAnimationFrameHeight = animationView.frame.width / 5
        let livioAnimationFrameXPos = (animationView.frame.width - livioAnimationFrameWidth) / 2
        let livioAnimationFrameYPos = (animationView.frame.height - livioAnimationFrameHeight) / 2
        let livioAnimationFrame = CGRect(x: livioAnimationFrameXPos, y: livioAnimationFrameYPos, width: livioAnimationFrameWidth, height: livioAnimationFrameHeight)
        livioAnimation.frame = livioAnimationFrame
    }

    func playAnimation() {
        // Slight delay needed else the animation finishes before it shows on screen
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            self.livioAnimation.animationProgress = 0
            self.livioAnimation.play(completion: { (finished: Bool) in
                print("livio animation complete")
            })
        }
    }

    @IBAction func playAgainButton(_ sender: Any) {
        playAnimation()
    }
}

