//
//  CircleTransitionAnimator.swift
//  newApp
//
//  Created by Ogabek Mansurov on 6/17/23.
//

import UIKit

class CircleTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let presentationStartButton: UIButton
    
    let isPresenting: Bool
    
    init(presentationStartButton: UIButton,
         isPresenting: Bool) {
        self.presentationStartButton = presentationStartButton
        self.isPresenting = isPresenting
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresenting {
            present(using: transitionContext)
        } else {
            dismiss(using: transitionContext)
        }
        
        
        
        
    }
    
    func present(using transitionContext: UIViewControllerContextTransitioning)  {
        let containerView = transitionContext.containerView
        
        guard let presentedViewController = transitionContext.viewController(forKey: .to),
              let presentedView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let finalFrame = transitionContext.finalFrame(for: presentedViewController)
        let startbuttonFrame = presentationStartButton.convert(presentationStartButton.bounds, to: containerView)
        let startButtunCenter = CGPoint(x: startbuttonFrame.midX, y: startbuttonFrame.midY)
        
        let circleView = createCircle(for: presentedView)
        
        containerView.addSubview(circleView)
        containerView.addSubview(presentedView)
        
        presentedView.center = startButtunCenter
        presentedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        circleView.center = presentedView.center
        circleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        presentedView.frame = finalFrame
            
                        circleView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        circleView.center = presentedView.center
        }) {(finished) in
            circleView.removeFromSuperview()
            transitionContext.completeTransition(finished)
            
        }
    }
    
    func dismiss(using transitionContext: UIViewControllerContextTransitioning)  {
        let containerView = transitionContext.containerView
        
        containerView.backgroundColor = .white
        
        guard let dismissedView = transitionContext.view(forKey: .from),
                let presentedView = transitionContext.view(forKey: .to) else {
                transitionContext.completeTransition(false)
            return
        }
        
        let circleView = createCircle(for: dismissedView)
        circleView.center = presentedView.center
        containerView.insertSubview(circleView, belowSubview: dismissedView)
        
        let startbuttonFrame = presentationStartButton.convert(presentationStartButton.bounds, to: containerView)
        let startButtunCenter = CGPoint(x: startbuttonFrame.midX, y: startbuttonFrame.midY)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            circleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            
            dismissedView.center = startButtunCenter
            circleView.center = startButtunCenter
            
        }) { (finished) in
            circleView.removeFromSuperview()
            transitionContext.completeTransition(finished)
//            transitionContext.completeTransition(false)
        }
    }
    
    func createCircle(for view: UIView) -> UIView {
        let d = sqrt(view.bounds.height*view.bounds.width + view.bounds.height*view.bounds.height)
        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: d, height: d))
        circleView.layer.cornerRadius = d/2
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = view.backgroundColor
        return circleView
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
}
