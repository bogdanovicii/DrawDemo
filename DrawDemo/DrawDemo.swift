//
//  DrawDemo.swift
//  DrawDemo
//
//  Created by Bogdan Ionescu on 09/08/2018.
//  Copyright © 2018 Bogdan Ionescu. All rights reserved.
//

import UIKit

@IBDesignable class DrawDemo: UIView {

    @IBInspectable var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
        //simpleShapeLayer()
        //addTwoSublayers()
        createHexagon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createRectangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path.close()
    }
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    func simpleShapeLayer() {
        //self.createRectangle()
        self.createTriangle()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        self.layer.mask = shapeLayer
        self.backgroundColor = .green
        //self.layer.addSublayer(shapeLayer)
    }
    
    func addTwoSublayers() {
        let width = self.frame.size.width/2
        let height = self.frame.size.height/2
        let path1 = UIBezierPath()
        
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        
        shapeLayer1.fillColor = UIColor.yellow.cgColor
        shapeLayer2.fillColor = UIColor.brown.cgColor
        
        shapeLayer2.position = CGPoint(x: width/2, y: height)
        shapeLayer1.position = CGPoint(x: width/2, y: 0.0)
        
        shapeLayer1.bounds.origin = CGPoint(x: 0.0, y: 0.0)
        shapeLayer1.bounds.size = CGSize(width: width, height: height)
        shapeLayer1.backgroundColor = UIColor.magenta.cgColor
        
        self.layer.addSublayer(shapeLayer2)
        self.layer.addSublayer(shapeLayer1)
    }
    
    func complexShape() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2 - 50.0, y: 0.0))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width/2 - 25.0, y: 25.0),
                    radius: 25.0,
                    startAngle: CGFloat(180.0).toRadians(),
                    endAngle: CGFloat(0.0).toRadians(),
                    clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2 + 50.0, y: 0.0))
        path.addCurve(to: CGPoint(x: self.frame.size.width, y: 50.0),
                      controlPoint1: CGPoint(x: self.frame.size.width + 50.0, y: 25.0),
                      controlPoint2: CGPoint(x: self.frame.size.width - 150.0, y: 50.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        self.backgroundColor = .orange
        self.layer.mask = shapeLayer
    }
    
    func createHexagon() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 40.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width - 40.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/2))
        path.addLine(to: CGPoint(x: self.frame.size.width - 40.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 40.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height/2))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        self.layer.mask = shapeLayer
    }
    
    
    func createTextLayer() {
        let textLayer = CATextLayer()
        textLayer.string = "Wow!\n This is text on a layer"
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.backgroundColor = UIColor.white.cgColor
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.font = UIFont(name: "Avenir", size: 15.0)
        textLayer.fontSize = 15.0
        textLayer.frame = CGRect(x: 0.0, y: self.frame.size.height/4,
                                 width: self.frame.size.width,
                                 height: self.frame.size.height/2)
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(textLayer)
    }
    /*
    override func draw(_ rect: CGRect) {
        //self.createRectangle()
        //self.createTriangle()
        //self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: self.frame.size.height, height: self.frame.size.height))
        //self.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 150.0, height: 0.0))
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2,
                                               y: self.frame.size.height/2), radius:
                                                self.frame.size.height/2,
                                                startAngle: CGFloat(240.0).toRadians(),
                                                endAngle: CGFloat(15.0).toRadians(),
                                                clockwise: false)
        UIColor.orange.setFill()
        path.fill()
        UIColor.black.setStroke()
        path.stroke()
    }
     */

}
extension CGFloat {
    func toRadians() -> CGFloat {
        return self * .pi / 180
    }
}

