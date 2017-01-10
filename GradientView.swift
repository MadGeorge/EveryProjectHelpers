import UIKit

/// Designable view with linear gradient settings
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topGradientColor: UIColor!
    @IBInspectable var bottomGradientColor: UIColor!
    @IBInspectable var locationTop: CGFloat = 0.0
    @IBInspectable var locationBottom: CGFloat = 1.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
    }

    override func draw(_ rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let context = UIGraphicsGetCurrentContext();
        
        let gradientColors = [topGradientColor.cgColor, bottomGradientColor.cgColor];
        
        let gradientLocations: [CGFloat] = [locationTop, locationBottom]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: gradientLocations)
        
        let startPoint = CGPoint(x: 0, y: 0)
        
        let endPoint = CGPoint(x: 0, y: bounds.height)
        
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: [])
    }
 
}

/// Designable view with radial gradient settings
@IBDesignable
class RadialGradientView: UIView {
    
    @IBInspectable var topGradientColor: UIColor! = UIColor.black
    @IBInspectable var bottomGradientColor: UIColor! = UIColor.white
    @IBInspectable var startRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let context = UIGraphicsGetCurrentContext();
        
        let gradientColors = [topGradientColor.cgColor, bottomGradientColor.cgColor];
        
        let gradientLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: gradientLocations)
        
        var radius = frame.width
        if radius < frame.height {
            radius = frame.height
        }
        
        context?.drawRadialGradient(gradient!, startCenter: center, startRadius: startRadius, endCenter: center, endRadius: radius, options: [])
    }
    
}
