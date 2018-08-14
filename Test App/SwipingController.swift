//
//  ViewController.swift
//  Test App
//
//  Created by Kendall Sanford on 7/30/18.
//  Copyright © 2018 Kendall Sanford. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    // view will transition layout fix for landscape mode
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
                
            }else{
                
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        })
    }
    
    let pages = [
        Page(imageName: "puppy", headerText: "What does a Puppy Say?", bodyText: "This is a puppy and it says woof!"),
        Page(imageName: "cat", headerText: "What does a Cat say?", bodyText: "This is a cat it says meow!"),
        Page(imageName: "fish", headerText: "What does a Fish say?", bodyText: "")
    ]
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    let prevButton: UIButton = {
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        
        //set next page variable
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        //set index path of page
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrev(){
        
        let prevIndex = max(pageControl.currentPage - 1, 0)
        
        //set index path of page
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    fileprivate func setupBottomControls(){
        let bottomControlStackView = UIStackView(arrangedSubviews:
            [prevButton,pageControl,nextButton])
        
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        bottomControlStackView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    //
    
    // set minimum line spacing
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // setup number of items inside the collection view
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //setup collection view re-usable cell info
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        
        //set cell page to page property created in page cell
        cell.page = page
        return cell
    }
    
    //setup
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //set target constant offset
        let x = targetContentOffset.pointee.x
        
        //get the image offset and divide by the screen width to get number of pages
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.register(PageCell.self,
                                 forCellWithReuseIdentifier: "cellId")
        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIColor{
    static var pink = UIColor(displayP3Red: 200/255, green: 120/255, blue: 23/255, alpha: 1)
}
