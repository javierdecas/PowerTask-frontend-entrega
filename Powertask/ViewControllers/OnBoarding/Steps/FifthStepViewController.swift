//
//  ThirdStepViewController.swift
//  Powertask
//
//  Created by Daniel Torres on 28/2/22.
//  Updated by Javier de Castro on 29/05/2022
//

import UIKit
import UserNotifications

class FifthStepViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .left
        {
            if let pageController = parent as? OnBoardingViewController {
                
                setupNotificationConstraints()
                pageController.goNext()
            }
        }
        
        if sender.direction == .right
        {
            if let pageController = parent as? OnBoardingViewController {
                pageController.goBack()
            }
        }
    }
    
    private func setupNotificationConstraints(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound])
            {(accepted, error) in
                if !accepted {
                    print("permiso denegado por el usuario")
                }
            }
        }
}
