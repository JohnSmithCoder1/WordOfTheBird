//
//  PageViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 8/9/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageControl = UIPageControl()
    
    lazy var viewControllerArray: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let help1ViewController = storyboard.instantiateViewController(withIdentifier: "Help1VC")
        let help2ViewController = storyboard.instantiateViewController(withIdentifier: "Help2VC")
        let help3ViewController = storyboard.instantiateViewController(withIdentifier: "Help3VC")
        
        return [help1ViewController, help2ViewController, help3ViewController]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = viewControllerArray.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        configurePageControl()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArray.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerArray.count > previousIndex else { return nil }
        
        return viewControllerArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArray.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard viewControllerArray.count != nextIndex else { return nil }
        
        guard viewControllerArray.count > nextIndex else { return nil }
        
        return viewControllerArray[nextIndex]
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = viewControllerArray.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .white
        view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        pageControl.currentPage = viewControllerArray.index(of: pageContentViewController)!
    }
    
}
