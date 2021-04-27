//
//  nextViewController.swift
//  setViewControllers_cache_sample
//
//  Created by uehara yuki on 2021/04/23.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var reloadBarBtnItem: UIBarItem!
    private var centerIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        reloadBarBtnItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadBarBtnTapped(_:)))
        self.navigationItem.rightBarButtonItem = (reloadBarBtnItem as! UIBarButtonItem)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setVC()
    }
    private lazy var pages: [UIViewController] = {
        return [
            createPage(color: .red),
            createPage(color: .blue),
            createPage(color: .yellow),
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
    // animated: true の場合、2枚目に遷移後1枚目に戻り、リロードすると2枚目の画面が変化していない→キャッシュされている。
    // animated: false の場合、キャッシュされないので画面は変更される。
    private func setVC() {
        self.setViewControllers([pages[centerIndex]], direction: .forward, animated: true, completion: nil)
    }
    private func createPage(color: UIColor) -> UIViewController {
        let page = UIViewController()
        page.view.backgroundColor = color
        return page
    }
    @objc func reloadBarBtnTapped(_ sender: UIBarButtonItem) {
        pages[centerIndex + 1] = createPage(color: .green)
        setVC()
        print("page reloaded")
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let pageIndex = pages.firstIndex(of: viewController), pageIndex - 1 >= 0 {
            return pages[pageIndex - 1]
        }
        return nil
    }
    // 以下にブレイクポイントを張ってみるとキャッシュ時の動作が分かりやすい
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
