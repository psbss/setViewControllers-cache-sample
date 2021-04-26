//
//  nextViewController.swift
//  UIPageVC_UIKit_CacheCheckSample
//
//  Created by uehara yuki on 2021/04/23.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var reloadBarBtnItem: UIBarItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setVC()
        reloadBarBtnItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadBarBtnTapped(_:)))
        self.navigationItem.rightBarButtonItem = (reloadBarBtnItem as! UIBarButtonItem)
    }

    private lazy var pages: [UIViewController] = {
        return [
            createPage(color: randomColor()),
            createPage(color: randomColor()),
            createPage(color: randomColor())
        ]
    }()
    
    private func randomColor() -> UIColor {
        var arr: [UIColor]
        arr = [
            .blue,
            .black,
            .red,
            .white,
            .green,
            .purple
        ]
        return arr.randomElement()!
    }

    private func setVC() {
        self.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }

    private func createPage(color: UIColor) -> UIViewController {
        let page = UIViewController()
        page.view.backgroundColor = color
        let btn: UIButton = UIButton(frame: CGRect(x: 0, y: 50, width: self.view.frame.width/2, height: self.view.frame.height/4))
        btn.backgroundColor = .white
        btn.setTitle("Btn", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(PageViewController.nextBtn(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        return page
    }

    @objc func nextBtn(_ sender: UIButton) {
        print("HQ")
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func reloadBarBtnTapped(_ sender: UIBarButtonItem) {
        setVC()
        print("page reloaded")
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
