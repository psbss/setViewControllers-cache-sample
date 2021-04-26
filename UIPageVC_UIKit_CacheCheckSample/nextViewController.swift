//
//  nextViewController.swift
//  UIPageVC_UIKit_CacheCheckSample
//
//  Created by uehara yuki on 2021/04/23.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
        UIPageControl.appearance().backgroundColor = .yellow
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
    }
    
    private lazy var pages: [UIViewController] = {
        return [
            createPage(color: .green),
            createPage(color: .blue),
            createPage(color: .red)
        ]
    }()
    
    private func createPage(color: UIColor) -> UIViewController {
        let page = UIViewController()
        page.view.backgroundColor = color
        return page
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let pageIndex = pages.firstIndex(of: viewController), pageIndex - 1 >= 0 {
            return pages[pageIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let pageIndex = pages.firstIndex(of: viewController), pageIndex + 1 < pages.count {
            return pages[pageIndex + 1]
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
