//
//  Created by Tom Baranes on 23/08/16.
//  Copyright (c) 2016 IBAnimatable. All rights reserved.
//

import UIKit

public class ActivityIndicatorAnimationBallScale: ActivityIndicatorAnimating {

  // MARK: Properties

  private let duration: CFTimeInterval = 1

  // MARK: ActivityIndicatorAnimating

  public func configAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
    let animation = self.animation
    let circle = ActivityIndicatorShape.Circle.createLayerWith(size: size, color: color)
    circle.frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                          y: (layer.bounds.size.height - size.height) / 2,
                          width: size.width,
                          height: size.height)
    circle.addAnimation(animation, forKey: "animation")
    layer.addSublayer(circle)
  }
}

// MARK: - Setup

private extension ActivityIndicatorAnimationBallScale {

  var animation: CAAnimationGroup {
    let animation = CAAnimationGroup()
    animation.animations = [scaleAnimation, opacityAnimation]
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    animation.duration = duration
    animation.repeatCount = .infinity
    animation.removedOnCompletion = false
    return animation
  }

  var scaleAnimation: CABasicAnimation {
    let scaleAnimation = CABasicAnimation(keyPath:"transform.scale")
    scaleAnimation.duration = duration
    scaleAnimation.fromValue = 0
    scaleAnimation.toValue = 1
    return scaleAnimation
  }

  var opacityAnimation: CABasicAnimation {
    let opacityAnimation = CABasicAnimation(keyPath:"opacity")
    opacityAnimation.duration = duration
    opacityAnimation.fromValue = 1
    opacityAnimation.toValue = 0
    return opacityAnimation
  }

}
