//
//  ViewController.swift
//  MoveToCircle
//
//  Created by azinavi on 19/1/24.
//

import UIKit

class MoveToCircle: UIViewController {
    
    var circleView: UIView!
    let circleSize: CGFloat = 70
    var buttonToMoveCircle: [UIButton] = []
    var showButtons = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircleView()
        setupShowButtons()
        setupGesture()
        tapGesture()
        doubleTapGesture()
        
    }
    
    func setupGesture() {
        swipeToTopGesture()
        swipeToDownGesture()
        swipeToRightGesture()
        swipeToLeftGesture()
    }
    
    func doubleTapGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        doubleTap.numberOfTapsRequired = 2
        self.circleView.addGestureRecognizer(doubleTap)
    }
    @objc func doubleTap() {
        print("double tap")
        view.backgroundColor = .white
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.circleView.addGestureRecognizer(tapGesture)
    }
    @objc func tap() {
        let circleSize: CGFloat = 70
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        UIView.animate(withDuration: 1.0) {
            self.circleView.backgroundColor = randomColor
        }
        UIView.animate(withDuration: 1.0) {
            UIView.animate(withDuration: 1.5,
                           delay: 0.0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.0,
                           options: [],
                           animations: {
                UIView.animate(withDuration: 0.3) {
                    self.circleView.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
                }
            }, completion: nil)
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.circleView.transform = .identity
            }
        }
    }
    
    // Swipe to TOP gesture
    func swipeToTopGesture() {
        let swipeToTopGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToTop))
        swipeToTopGesture.direction = .up
        self.circleView.addGestureRecognizer(swipeToTopGesture)
    }
    @objc func swipeToTop() {
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        var circleFrame = circleView.frame
        UIView.animate(withDuration: 0.3) {
            circleFrame.origin.y -= 60
            self.circleView.frame = circleFrame
        }
        UIView.animate(withDuration: 1.0) {
            self.circleView.backgroundColor = randomColor
        }
    }
    
    // Swipe to DOWN gesture
    func swipeToDownGesture() {
        let swipeToDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDown))
        swipeToDownGesture.direction = .down
        self.circleView.addGestureRecognizer(swipeToDownGesture)
    }
    @objc func swipeToDown() {
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        var circleFrame = circleView.frame
        UIView.animate(withDuration: 0.3) {
            circleFrame.origin.y += 60
            self.circleView.frame = circleFrame
        }
        UIView.animate(withDuration: 1.0) {
            self.circleView.backgroundColor = randomColor
        }
    }
    
    // Swipe to RIGHT gesture
    func swipeToRightGesture() {
        let swipeToRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        swipeToRightGesture.direction = .right
        self.circleView.addGestureRecognizer(swipeToRightGesture)
    }
    @objc func swipeToRight() {
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        var circleFrame = circleView.frame
        UIView.animate(withDuration: 0.3) {
            circleFrame.origin.x += 60
            self.circleView.frame = circleFrame
        }
        UIView.animate(withDuration: 1.0) {
            self.circleView.backgroundColor = randomColor
        }
    }
    
    // Swipe to LEFT gesture
    func swipeToLeftGesture() {
        let swipeToLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        swipeToLeftGesture.direction = .left
        self.circleView.addGestureRecognizer(swipeToLeftGesture)
    }
    @objc func swipeToLeft() {
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        var circleFrame = circleView.frame
        UIView.animate(withDuration: 0.3) {
            circleFrame.origin.x -= 60
            self.circleView.frame = circleFrame
        }
        UIView.animate(withDuration: 1.0) {
            self.circleView.backgroundColor = randomColor
        }
    }
    
    func setupShowButtons() {
        showButtons.frame = CGRect(x: view.center.x - 75, y: 70, width: 150, height: 30)
        showButtons.backgroundColor = .systemBlue
        showButtons.setTitle("Show buttons", for: .normal)
        showButtons.setTitleColor(.white, for: .normal)
        showButtons.layer.borderWidth = 2.0
        showButtons.layer.borderColor = UIColor.blue.cgColor
        showButtons.addTarget(self, action: #selector(showToButtons), for: .touchUpInside)
        
        view.addSubview(showButtons)
    }
    @objc func showToButtons() {
        arrowsToMoveCircle()
        showButtons.removeFromSuperview()
    }
    
    //  Setup for circle
    func setupCircleView() {
        circleView = UIView(frame: CGRect(x: view.center.x - circleSize/2, y: view.center.y - circleSize/2, width: circleSize, height: circleSize))
        circleView.backgroundColor = UIColor.systemPink
        circleView.layer.cornerRadius = circleSize / 2
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor.red.cgColor
        circleView.layer.shadowOpacity = 1.5
        circleView.layer.shadowColor = UIColor.black.cgColor
        circleView.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.addSubview(circleView)
        view.backgroundColor = .black
    }
    
    //  Setup for buttons
    func arrowsToMoveCircle() {
        let upBotton = createButton(name: "▲", frame: CGRect(x: view.center.x - 20, y: 50, width: 40, height: 40))
        upBotton.backgroundColor = UIColor.systemBlue
        upBotton.tintColor = UIColor.white
        upBotton.layer.cornerRadius = 20
        let dowmBotton = createButton(name: "▼", frame: CGRect(x: view.center.x - 20, y: 140, width: 40, height: 40))
        dowmBotton.backgroundColor = UIColor.systemBlue
        dowmBotton.tintColor = UIColor.white
        dowmBotton.layer.cornerRadius = 20
        let rightBotton = createButton(name: "▶", frame: CGRect(x: view.center.x + 25, y: 95, width: 40, height: 40))
        rightBotton.backgroundColor = UIColor.systemBlue
        rightBotton.tintColor = UIColor.white
        rightBotton.layer.cornerRadius = 20
        let leftBotton = createButton(name: "◀", frame: CGRect(x: view.center.x - 65, y: 95, width: 40, height: 40))
        leftBotton.backgroundColor = UIColor.systemBlue
        leftBotton.tintColor = UIColor.white
        leftBotton.layer.cornerRadius = 20
        let resetButton = createButton(name: "🔄", frame: CGRect(x: view.center.x - 20, y: 95, width: 40, height: 40))
        resetButton.backgroundColor = UIColor.systemBlue
        resetButton.tintColor = UIColor.white
        resetButton.layer.cornerRadius = 20
        
        buttonToMoveCircle = [upBotton, dowmBotton, rightBotton, leftBotton, resetButton]
        
        // adds buttons to the VIEW
        for button in buttonToMoveCircle {
            view.addSubview(button)
        }
    }
    
    //  Custom method creates button
    func createButton(name: String, frame: CGRect) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(name, for: .normal)
        button.frame = frame
        button.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func moveCircle(_ sender: UIButton) {
        var newFrame = circleView.frame
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        
        switch sender.titleLabel?.text {
        case "▲":
            newFrame.origin.y -= 30
        case "▼":
            newFrame.origin.y += 30
        case "▶":
            newFrame.origin.x += 30
        case "◀":
            newFrame.origin.x -= 30
        case "🔄":
            UIView.animate(withDuration: 0.3) {
                newFrame.origin.x = self.view.center.x - self.circleSize / 2
                newFrame.origin.y = self.view.center.y - self.circleSize / 2
            }
            UIView.animate(withDuration: 1.0) {
//                self.circleView.transform = .init(scaleX: 0.5, y: 0.5)
            } completion: { _ in
                UIView.animate(withDuration: 1.0) {
//                    self.circleView.transform = .identity
                }
            }
        default:
            break
        }
        
        if isFrameValid(frame: newFrame) {
            UIView.animate(withDuration: 0.4) {
                self.circleView.frame = newFrame
                self.circleView.backgroundColor = randomColor
            }
        }
    }
    
    func isFrameValid(frame: CGRect) -> Bool {
        if (frame.minX <= 0 || frame.minY <= 0 || frame.maxX >= view.frame.width || frame.maxY >= view.frame.height + 10) {
            return false
        }
        for button in buttonToMoveCircle {
            if frame.intersects(button.frame) {
                return false
            }
        }
        return true
    }
}
