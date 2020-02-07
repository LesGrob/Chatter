//
//  StepperViewController.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationViewPage: UIView {
    var changePage: (() -> Void)?
    
    convenience init(changePage action: @escaping () -> Void){
        self.init()
        self.changePage = action
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() { }
}

class PageObject {
    var label: String
    var view: AuthorizationViewPage
    init(label: String, view: AuthorizationViewPage) {
        self.label = label
        self.view = view
    }
}

//    MARK:- initializer
class PagerView: UIView {
    private var pages: [PageObject] = []
    private var currentPage: Int = 0
    public var getCurrentPage: Int { get { return currentPage } }
    public var getPages: [PageObject] { get { return pages } }
    
    private var slider: UIView!
    private var slideView: UIView!
    private var slideBackgroudView: UIView!
    private var stepViews: [UIView] = []
    private var stepPointViews: [UIView] = []
    private var stepTitles: [UILabel] = []
    
    //    MARK:- style constants
    private let slideHeight: CGFloat = 3.0
    private var slideMaxWidth: CGFloat = 0.0
    
    private let stepPointWidth: CGFloat = 20.0
    private let stepShadowedPointWidth: CGFloat = 8.0
    
    private let labelSize: CGFloat = 14.0
    private let labelTopMargin: CGFloat = 8.0
    
    private let distanceBetweenPoints: CGFloat = 60.0
    
    private var viewsTopMargin: CGFloat = 84
    
    convenience init(pages: [PageObject]) {
        self.init()
        self.pages = pages
        self.currentPage = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSliderView()
        setupViews()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupSliderView()
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupSliderView()
//        setupViews()
//    }
//    
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        setupSliderView()
//        setupViews()
//    }
}


//    MARK:- init style setup
extension PagerView {
    private func setupSliderView() {
        for view in subviews {
            view.removeFromSuperview()
        }
        
        self.slideMaxWidth = CGFloat(self.stepPointWidth * CGFloat(pages.count) + self.distanceBetweenPoints * CGFloat(pages.count - 1))
        
        self.slider = UIView(frame: CGRect(x: (self.frame.width - slideMaxWidth)/2, y: 24, width: slideMaxWidth, height: (stepPointWidth+labelSize+labelTopMargin)))
        self.addSubview(slider)
        
        self.slideBackgroudView = UIView(frame: CGRect(x: 0, y: (slider.frame.height -  slideHeight) / 2, width: slideMaxWidth, height: slideHeight))
        slideBackgroudView.backgroundColor = UIColor.Default.lightGray
        self.slider.addSubview(slideBackgroudView)
        
        self.slideView = UIView(frame: CGRect(x: 0, y: (slider.frame.height -  slideHeight) / 2, width: 0, height: slideHeight))
        slideView.backgroundColor = UIColor.Default.lightBlue
        
        self.slider.addSubview(slideView)
        
        let stepWidth = slideMaxWidth / CGFloat(pages.count - 1)
        for (index, item) in self.pages.enumerated() {
            //Main point
            let pointX = stepWidth * CGFloat(index) - stepPointWidth/2
            let pointY = (slider.frame.height -  stepPointWidth) / 2
            let point = UIView(frame: CGRect(x: pointX, y: pointY, width: self.stepPointWidth, height: self.stepPointWidth))
            
            point.tag = index
            point.layer.cornerRadius = self.stepPointWidth / 2
            point.backgroundColor = index > currentPage ? UIColor.Default.lightGray : UIColor.Default.lightBlue
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handlePointTap(_:)))
            point.addGestureRecognizer(tap)
            
            self.slider.addSubview(point)
            self.stepViews.append(point)
            
            // Shadowed point
            let shPointX = stepWidth * CGFloat(index) - stepShadowedPointWidth/2
            let shPointY = (slider.frame.height -  stepShadowedPointWidth) / 2
            let shPoint = UIView(frame: CGRect(x: shPointX, y: shPointY, width: stepShadowedPointWidth, height: stepShadowedPointWidth))
            
            shPoint.layer.cornerRadius = stepShadowedPointWidth / 2
            shPoint.backgroundColor = .white
            shPoint.dropShadow(shadow: .materialShadow05)
            shPoint.alpha = index != currentPage ? 0 : 1
            
            self.slider.addSubview(shPoint)
            self.stepPointViews.append(shPoint)
            
            // Item label
            let itemFrame = item.label.boundingRect(font: .customFont(ofSize: labelSize, weight: .light), countLine: 1)
            let labelWidth = (itemFrame.width > 50 ? 50 : itemFrame.width) + 8.0
            let labelY = point.frame.maxY + labelTopMargin
            let labelX = stepWidth * CGFloat(index) - labelWidth/2
            let label = UILabel(frame: CGRect(x: labelX, y: labelY , width: labelWidth, height: labelSize + 2))
            
            label.text = item.label
            label.textAlignment = .center
            label.textColor = UIColor.Default.lightGray
            label.font = .customFont(ofSize: labelSize, weight: .light)
            
            self.slider.addSubview(label)
            self.stepTitles.append(label)
        }
    }
    
    private func setupViews(){
        self.viewsTopMargin =  slider.frame.maxY + 24
        
        for (index, item) in pages.enumerated() {
            let x  = index == 0 ? 0 : self.frame.width
            item.view.frame = CGRect(x: x, y: self.viewsTopMargin, width: self.frame.width, height: (self.frame.height - viewsTopMargin))
            item.view.alpha = index == 0 ? 1 : 0
            addSubview(item.view)
        }
    }
    
    @objc  func handlePointTap(_ gesture: UIGestureRecognizer){
        guard let point = gesture.view, point.tag < self.currentPage else  {
            return
        }
        self.set(page: point.tag, completion: {})
    }
}

//    MARK:- refresh functions
extension PagerView {
    private func relayoutView(previousPage: Int) {
        let newWidth = self.slideMaxWidth * (CGFloat(currentPage) / CGFloat(pages.count - 1))
        let height = self.frame.height - self.viewsTopMargin
        let width = self.frame.width
        
        let rightDirection = (previousPage == (pages.count-1) && currentPage == 0) || previousPage < currentPage
        if !rightDirection {
            self.pages[self.currentPage].view.center = CGPoint(x: -self.center.x, y: self.center.y)
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseOut, animations: {
            self.slideView.frame = CGRect(x: 0, y: self.slideView.frame.minY, width: newWidth, height: self.slideHeight)
            
            for (index, _) in self.stepViews.enumerated() {
                self.stepViews[index].backgroundColor = index > self.currentPage ? UIColor.Default.lightGray : UIColor.Default.lightBlue
                self.stepPointViews[index].alpha = index != self.currentPage ? 0 : 1
            }
            
            
            self.pages[self.currentPage].view.alpha = 1
            self.pages[previousPage].view.alpha = 0
            if rightDirection {
                self.pages[self.currentPage].view.frame = CGRect(x: 0, y: self.viewsTopMargin, width: width, height: height)
                self.pages[previousPage].view.frame = CGRect(x: -width, y: self.viewsTopMargin, width: width, height: height)
            } else {
                self.pages[self.currentPage].view.frame = CGRect(x: 0, y: self.viewsTopMargin, width: width, height: height)
                self.pages[previousPage].view.frame = CGRect(x: width*2, y: self.viewsTopMargin, width: width, height: height)
            }
            
        }, completion: { _ in
            if rightDirection {
                self.pages[previousPage].view.frame = CGRect(x: width*2, y: self.viewsTopMargin, width: width, height: height)
            }
        })
    }
    
    public func set(page number: Int, completion:  @escaping () -> Void?) {
        guard number < pages.count && number >= 0 else {
            print("Index out of range")
            return
        }
        let prev = self.currentPage
        self.currentPage = number
        relayoutView(previousPage: prev)
    }
}
