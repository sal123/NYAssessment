

import UIKit
@IBDesignable

class CustomView: UIView {

    @IBInspectable
    open var sideWidth : CGFloat = 0.5 {
    
        didSet{
            if hasBorder{
                self.layer.borderWidth = sideWidth
                
            }
        }
    }
    
    @IBInspectable
    open var hasBorder : Bool = false {
        
        didSet{
            if hasBorder{
                self.layer.borderWidth = sideWidth
            }
        }
    }
    
    @IBInspectable
    open var sideColor : UIColor = UIColor.lightGray {

        didSet{
            if hasBorder{
                self.layer.borderColor = sideColor.cgColor
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        
    }
    

}
