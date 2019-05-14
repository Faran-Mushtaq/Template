//
//  UIView+Extensions.swift


import UIKit




extension UIView {
    
    
    func expandView (){
        
    let viewFrame = self.frame
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y , width :0 , height : self.frame.size.height )
     self.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = viewFrame
            self.layoutIfNeeded()
        }) { (v) in
            
        }
      }
    
    
     func flipFromRight() {
       self.isHidden = false
        UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromRight, animations: {
            
        }) { (v) in
           // self.popInView(view: self)
        }
    }
    
    
    func popInView(view: UIView)  {
        
      UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            view.alpha = 1
            view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1);
            
            
            
            
        }) { (finished) in
            
            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveLinear, animations: {
                
                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                
            }) { (finished) in
                
            }
            
        }
    }
    
    
    
    
    func slideViewFromLeftToRight(success : @escaping (()->())){
        
        let actualFrame = self.frame
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: {
            self.frame.origin.x = actualFrame.width
        }) { (v) in
            success()
        }
        
        
    }
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.2,withTranslation translation : CGFloat = 5.0) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: -translation, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: translation, y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
    
    func rotate() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 2 * Double.pi
        animation.duration = 1 * 2
        animation.repeatCount = Float.infinity

        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.layer.add(animation, forKey: animation.keyPath)
    }
    
    func stopAnimationAndFinish(){
        if let presentation = self.layer.presentation(){
            if let currentRotation = presentation.value(forKeyPath: "transform.rotation.z") as? CGFloat{
                
                var duration = 2.0
                
                //smooth out duration for change
                duration = Double((CGFloat(Double.pi * 2) - currentRotation))/(Double.pi * 2)
                self.layer.removeAllAnimations()
                
                let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
                rotation.fromValue = currentRotation
                rotation.toValue = Double.pi * 2
                rotation.duration = duration * 2
                self.layer.add(rotation, forKey: "rotationAnimation")
                
            }
        }
    }
    
    
    
    func slideView (){
        
        let viewFrame = self.frame
        self.frame = CGRect(x:-self.frame.size.width, y:self.frame.origin.y , width :self.frame.size.width , height : self.frame.size.height )
        self.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = viewFrame
            self.layoutIfNeeded()
        }) { (v) in
            
        }
    }
    
    
    
    func popInFast(delay : CGFloat , multiplier : CGFloat){
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1);
        self.alpha = 0.0
        self.isHidden = false
        
        UIView.animate(withDuration: 0.2, delay: TimeInterval(multiplier * delay), options: .curveLinear, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
            
            
            
            
        }) { (finished) in
            
            UIView.animate(withDuration: 0.1, delay: TimeInterval((multiplier / 2.0 ) * delay), options: .curveLinear, animations: {
                
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                
            }) { (finished) in
                
            }
            
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    
    @IBInspectable var ccornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var bborderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var bborderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var sshadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var sshadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var sshadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var sshadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

public class Animations {
    
     static func flipView(view : UIView){
       
        
        view.flipFromRight()
        
    }
    
     static func slideView (view : UIView){
        
        let viewFrame = view.frame
        view.frame = CGRect(x:-view.frame.size.width, y:view.frame.origin.y , width :view.frame.size.width , height : view.frame.size.height )
        view.isHidden = false
  
        
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            view.frame = viewFrame
        }) { _ in
            
        }
    }
    
    static func slideViewFast (view : UIView){
        
        let viewFrame = view.frame
        view.frame = CGRect(x:-view.frame.size.width, y:view.frame.origin.y , width :view.frame.size.width , height : view.frame.size.height )
        view.isHidden = false
        
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            view.frame = viewFrame
        }) { _ in
            
        }
    }
    
}
