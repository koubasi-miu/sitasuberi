import UIKit

class NewCollectionViewLayout: UICollectionViewLayout {
    // セルのサイズ
    let cellSize: CGFloat = 50
    var cellCount: Int {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.visibleCells.count
    }
    
    // 行数
    var rows: Int {
        guard let collectionView = collectionView else { return 0 }
        let allHeight = collectionView.bounds.height - 100
        return Int(allHeight / cellSize)
    }
    var columns: Int {
        guard let collectionView = collectionView else { return 0 }
        print(collectionView.numberOfItems(inSection: 0))
        return collectionView.numberOfItems(inSection: 0) / rows
    }
    
    // レイアウト
    private var layoutData = [UICollectionViewLayoutAttributes]()
    var contentWidth: CGFloat {
        return CGFloat(columns) * cellSize
    }
    var contentHeight: CGFloat {
        return CGFloat(rows) * cellSize
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    // レイアウトの準備
    override func prepare() {
        super.prepare()
        self.layoutData.removeAll()
        var x:CGFloat = cellSize * CGFloat((columns - 1))
        var y:CGFloat = 0
        for count in 0 ... collectionView!.numberOfItems(inSection: 0){
            let indexPath = NSIndexPath(item: count, section: 0)
            //レイアウトの配列に位置とサイズを登録する。
            let frame = CGRect(x: x, y: y, width: cellSize, height: cellSize)
            
            //ここで左右(y)だけの余白を設定してるよ
            let insetFrame = frame.insetBy(dx: 5, dy: 0)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            attributes.frame = insetFrame
            layoutData.append(attributes)
            
            // ここでcellをどの場所に配置するかを指定している
            // これはindexPath[1]が右上が0,左下が160(一番最後のセルのindex)となるように配置している(縦書き配置)
            if ((count + 1) % rows != 0){
                y += cellSize
            }else{
                y = 0
                x -= cellSize
            }
        }
        let cellHeight = collectionView!.frame.minY - 93
        collectionView?.setContentOffset(CGPoint(x: 100, y: cellHeight), animated: true)
        collectionView?.isPagingEnabled = true
    }
    
    //レイアウトを返す
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutData
    }
}
