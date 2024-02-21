//
//  UICollectionViewFlowLayout+Responsive.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

class ResponsiveGridLayout: UICollectionViewFlowLayout {
    
    // Minimum column width for each item
    var minColumnWidth: CGFloat = 0
    
    // Minimum inter-item spacing
    var miniInteritemSpacing: CGFloat = 0
    
    var cellHeightRatio: CGFloat = 1
    
    init(minColumnWidth: CGFloat = 150, miniInteritemSpacing: CGFloat = 10, cellHeightRatio: CGFloat = 1) {
        self.minColumnWidth = minColumnWidth
        self.miniInteritemSpacing = miniInteritemSpacing
        self.cellHeightRatio = cellHeightRatio
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        
        // Calculate the number of columns based on available width and minimum column width
        let maxNumColumns = max(1, Int(availableWidth / minColumnWidth))
        
        // Calculate the width for each cell considering inter-item spacing
        let cellWidth = (availableWidth - CGFloat(maxNumColumns - 1) * minimumInteritemSpacing) / CGFloat(maxNumColumns)
        
        let cellHeight = cellWidth * cellHeightRatio
        // Set item size
        itemSize = CGSize(width: cellWidth, height: cellHeight) // Assuming square cells
        
        // Set minimum line spacing (vertical spacing between rows)
        minimumLineSpacing = miniInteritemSpacing
        
        // Set minimum inter-item spacing (horizontal spacing between cells)
        minimumInteritemSpacing = miniInteritemSpacing
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // Invalidate layout when bounds change (e.g., when device rotates)
        return true
    }
    
    func setColWidth(width: CGFloat) {
        minColumnWidth = width
    }
}
