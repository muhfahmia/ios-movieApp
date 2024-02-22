//
//  UICollectionView.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
           register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func register<T: UICollectionViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    func calculateHeightContent(column: Int, heightRatio: CGFloat, totalItem: Int, spacing: CGFloat) -> CGSize {
        let totalRow = totalItem / column
        let heightItem = ((self.bounds.width / CGFloat(column)) * heightRatio) + spacing
        print("totalRow: \(totalRow)")
        print("heightItem: \(heightItem)")
        let totalHeight = heightItem * CGFloat(totalRow)
        self.contentSize = CGSize(width: self.bounds.width, height: totalHeight)
        return self.contentSize
    }
    
    func calcHeightContent(itemCount: Int) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
                return CGSize(width: bounds.width, height: 0)
        }
            
        let sectionInsets = flowLayout.sectionInset
        let minimumLineSpacing = flowLayout.minimumLineSpacing
        let minimumInteritemSpacing = flowLayout.minimumInteritemSpacing
        let collectionViewWidth = bounds.width - sectionInsets.left - sectionInsets.right
        
        // Calculate the width available for the items, considering the insets
        let availableWidthForItems = collectionViewWidth - minimumInteritemSpacing * CGFloat(flowLayout.minimumInteritemSpacing)
        
        // Calculate the total height of all items
        let totalItemsHeight = CGFloat(itemCount) * flowLayout.itemSize.height
        
        // Calculate the total spacing between items
        let totalInteritemSpacing = CGFloat(itemCount - 1) * minimumInteritemSpacing
        
        // Calculate the content height
        let contentHeight = totalItemsHeight + totalInteritemSpacing + sectionInsets.top + sectionInsets.bottom
            
        return CGSize(width: bounds.width, height: contentHeight)
    }
    
}
