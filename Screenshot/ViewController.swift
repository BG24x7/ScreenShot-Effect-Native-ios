//
//  ViewController.swift
//  Screenshot
//
//  Created by Bhoomika on 19/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageForSS: UIImageView!
    
    @IBAction func takeScreenshot(_ sender: UIButton) {
        self.view.showScreenEffect(screenshot: imageForSS)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension UIView {
    func showScreenEffect(screenshot: UIImageView) {
        let snapshotView = UIImageView()
        snapshotView.image = screenshot.image
        self.addSubview(snapshotView)
        snapshotView.frame = CGRect(x: screenshot.frame.minX, y: self.frame.minY, width: screenshot.frame.size.width, height: screenshot.frame.size.height)
        
        UIView.animate(withDuration: 0.5, animations: {
            snapshotView.frame = CGRect(x: screenshot.frame.minX, y: self.frame.maxY - screenshot.frame.size.height, width: (screenshot.frame.size.width)/2.5, height: (screenshot.frame.size.height)/2.5)
            snapshotView.alpha = 1
            snapshotView.layer.borderWidth = 4
            snapshotView.layer.borderColor = UIColor.white.cgColor
            snapshotView.layer.cornerRadius = 8
            snapshotView.layer.masksToBounds = true
            
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                snapshotView.alpha = 0
                snapshotView.removeFromSuperview()
            }
        }
    }
}
