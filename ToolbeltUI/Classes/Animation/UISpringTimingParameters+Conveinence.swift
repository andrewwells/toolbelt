//
//  UISpringTimingParameters+Conveinence.swift
//  ToolbeltUI
//
//  Created by Andrew Wells on 8/25/18.
//

// * source
// https://medium.com/ios-os-x-development/demystifying-uikit-spring-animations-2bb868446773

extension UISpringTimingParameters {
    public convenience init(dampingRatio: CGFloat, frequencyResponse: CGFloat) {
        precondition(dampingRatio >= 0)
        precondition(frequencyResponse > 0)
        
        let mass = 1 as CGFloat
        let stiffness = pow(2 * .pi / frequencyResponse, 2) * mass
        let damping = 4 * .pi * dampingRatio * mass / frequencyResponse
        
        self.init(mass: mass, stiffness: stiffness, damping: damping, initialVelocity: .zero)
    }
}
