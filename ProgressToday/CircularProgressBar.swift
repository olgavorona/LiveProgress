//
//  CircularProgressBar.swift
//  ProgressToday
//
//  Created by Olga Vorona on 07/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit


class CircularProgressBar: UIView {
    
    /// The color of the progress bar
    @IBInspectable public var barColor: UIColor = UIColor.green
    /// The color of the base layer of the bar
    @IBInspectable public var trackColor: UIColor = UIColor.yellow
    
    //MARK: awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    //MARK: Public
    
    public var lineWidth:CGFloat = 50 {
        didSet{
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth - (0.20 * lineWidth)
        }
    }
    
    public var text: String = ""

    public var progress: Double = 0 {
        didSet {
            makeBar()
        }
    }
    
    
    
    
    //MARK: Private
    private var label = UILabel()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private var radius: CGFloat {
        get{
             return (self.frame.height - lineWidth)/2
        }
    }
    
    private var pathCenter: CGPoint{ get{ return self.convert(self.center,
                                                              from: self.superview) } }
    private func makeBar(){
        drawBackgroundLayer()
        drawForegroundLayer()
    }
    
    private func drawBackgroundLayer(){
        backgroundLayer.removeFromSuperlayer()
        let path = UIBezierPath(arcCenter: pathCenter,
                                radius: self.radius,
                                startAngle: 0,
                                endAngle: 2 * CGFloat.pi,
                                clockwise: true)
        backgroundLayer.lineWidth = lineWidth
        backgroundLayer.path = path.cgPath
        backgroundLayer.strokeColor = barColor.cgColor
        backgroundLayer.lineWidth = lineWidth - (lineWidth * 0.2)
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(backgroundLayer)
        
    }
    
    private func drawForegroundLayer(){
        foregroundLayer.removeFromSuperlayer()
        let endAngle = -CGFloat.pi / 2 + 2 * CGFloat.pi * CGFloat(progress/100)
        
        let path = UIBezierPath(arcCenter: pathCenter,
                                radius: self.radius,
                                startAngle: -CGFloat.pi / 2,
                                endAngle: endAngle,
                                clockwise: true)
        foregroundLayer.lineWidth = lineWidth

        foregroundLayer.path = path.cgPath
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = trackColor.cgColor
        layer.addSublayer(foregroundLayer)
        
    }
    
    private func configLabel(){
        label.sizeToFit()
        label.center = pathCenter
    }
    
    private func setupView() {
        makeBar()
        configLabel()
        addSubview(label)
    }
    
    
    
    //Layout Sublayers
    private var layoutDone = false
    override func layoutSublayers(of layer: CALayer) {
        if !layoutDone {
            setupView()
            label.text = text
            layoutDone = true
        }
    }
    
}
