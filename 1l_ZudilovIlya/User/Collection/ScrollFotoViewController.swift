//
//  ScrollFotoViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 22.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class ScrollFotoViewController: UIViewController {

    var image = ""
    
    
    
    @IBOutlet weak var photoView: UIImageView!
 
    //lazy var tapGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
    let previosViewOffSet: CGFloat = 0.0
    let initialPositionForView: CGFloat = 0.0
    
    var imageArray = [UIImage]()
    
    var countSwipe = 0
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if image == "Mister Krabs.jpg" {
            imageArray = [#imageLiteral(resourceName: "Mister Krabs"), #imageLiteral(resourceName: "3-1"), #imageLiteral(resourceName: "3-2")]
        } else if image == "Patrick.jpg" {
            imageArray = [#imageLiteral(resourceName: "Patrick.jpg"), #imageLiteral(resourceName: "2-1"), #imageLiteral(resourceName: "2-2")]
        } else if image == "Spanch Bob.jpg" {
            imageArray = [#imageLiteral(resourceName: "Spanch Bob.jpg"), #imageLiteral(resourceName: "1-1"), #imageLiteral(resourceName: "1-3")]
        }
        
        
        print(image)
        photoView.image = imageArray[0]

        let swipeLeft = UISwipeGestureRecognizer()
        let swipeRight = UISwipeGestureRecognizer()
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        
        swipeLeft.addTarget(self, action: #selector(handleGesture))
        swipeRight.addTarget(self, action: #selector(handleGesture))
        
      
        
        // Do any additional setup after loading the view.
    }
    
  /*  @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
       
      
        if sender.state == .began {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            self.imageScroll.frame = CGRect(x: 0, y: 300, width: self.imageScroll.frame.width, height: self.imageScroll.frame.height)
                            self.imageScroll.image = self.imageArray[0]
                            //self.photoView.frame.origin = CGPoint(x: self.photoView.center.x, y: self.photoView.center.y)
                           
                           },
                           completion: nil )
                      
        } else if sender.state == .ended {
            self.view.backgroundColor = .yellow
            self.imageScroll.image =  imageArray[1]
        } else if sender.state == .changed {
            self.view.backgroundColor = .white
        }
        
        
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc
    
    private func handleGesture (_ sender: UISwipeGestureRecognizer) {
        
       
            
        switch sender.direction {
        
        
        case .left:
            
         

            if self.countSwipe < self.imageArray.count {
                self.countSwipe += 1
                print(self.countSwipe)
                UIView.animate(withDuration: 0.5,
                           animations: {
                            
                            self.photoView.frame.origin = CGPoint(x: -500, y: self.photoView.frame.origin.y)
                            self.photoView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                            
                           },
                           completion: {  _ in
                            
                            self.photoView.alpha = 0
                            self.photoView.frame.origin = CGPoint(x: self.view.frame.origin.x + 50, y: self.view.frame.origin.y)

                            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
                                
                                if self.countSwipe  < self.imageArray.count {
                                    self.photoView.alpha = 1
                                    self.photoView.image = self.imageArray[self.countSwipe]
                                    //self.photoView.frame.origin = CGPoint(x: +500, y: self.photoView.frame.origin.y)
                                    self.photoView.transform = CGAffineTransform(scaleX: 1, y: 1)
                                    self.photoView.center.x = self.view.frame.midX
                                    self.countSwipe += 1
                                    print(self.countSwipe)
                                } else if self.countSwipe == self.imageArray.count {
                                    self.photoView.alpha = 1
                                    self.photoView.image = self.imageArray.last
                                    self.photoView.transform = CGAffineTransform(scaleX: 1, y: 1)
                                    self.photoView.center.x = self.view.frame.midX}
                            })
                           })
                
                
                            
                
            } else {
                
                UIView.animate(withDuration: 0.5,
                           animations: {
                            
                            self.photoView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                            self.photoView.transform = CGAffineTransform(scaleX: 1, y: 1)                           })
            }
            case.right:
                
    
               
                
                if self.countSwipe > 0 {
                    
                    self.countSwipe -= 1
                    print(self.countSwipe)

                    
                    UIView.animate(withDuration: 0.5,
                               animations: {
                               
                                self.photoView.frame.origin = CGPoint(x: +500, y: self.photoView.frame.origin.y)
                                self.photoView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    
                                
                               },
                               completion: {  _ in
                                self.photoView.alpha = 0
                                self.photoView.frame.origin = CGPoint(x: self.view.frame.origin.x + 50, y: self.view.frame.origin.y)
                
                                
                                UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
                                    if self.countSwipe > 0 {
                                        self.countSwipe -= 1
                                        print(self.countSwipe)
                                        self.photoView.alpha = 1
                                        self.photoView.image = self.imageArray[self.countSwipe]
                                        //self.photoView.frame.origin = CGPoint(x: +500, y: self.photoView.frame.origin.y)
                                        self.photoView.transform = CGAffineTransform(scaleX: 1, y: 1)
                                        self.photoView.center.x = self.view.frame.midX


                                    }  else if self.countSwipe == 0 {
                                        self.photoView.alpha = 1
                                        self.photoView.image = self.imageArray.first
                                        self.photoView.transform = CGAffineTransform(scaleX: 1, y: 1)
                                        self.photoView.center.x = self.view.frame.midX}
                                })
                               })
                
                    
                } else {
                    UIView.animate(withDuration: 0.5,
                               animations: {
                                
                                self.photoView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                                self.photoView.transform = CGAffineTransform(scaleX: 1, y: 1)                           })
                }
                
        default: break
            

        
        }
      
        
    }

}
