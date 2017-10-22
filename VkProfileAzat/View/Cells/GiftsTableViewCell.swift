import UIKit

class GiftsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstGiftImageView: UIImageView!
    @IBOutlet weak var secondGiftImageView: UIImageView!
    @IBOutlet weak var thirdGiftImageView: UIImageView!
    @IBOutlet weak var fourthGiftImageView: UIImageView!
    @IBOutlet weak var giftsCollectionView: UICollectionView!
    @IBOutlet weak var giftsLabel: UILabel!
    let giftsCellIdentefier = "GiftsCellIdentefier"
    let presentString = " подарков"
    
    func prepareCell(with item: CoreModelOfGifts) {
        giftsLabel.text = String(item.numberOfPresets) + presentString
        firstGiftImageView.image = UIImage(named:"gift\(arc4random_uniform(4) + 1).png")
        secondGiftImageView.image = UIImage(named:"gift\(arc4random_uniform(4) + 1).png")
        thirdGiftImageView.image = UIImage(named:"gift\(arc4random_uniform(4) + 1).png")
        fourthGiftImageView.image = UIImage(named:"gift\(arc4random_uniform(4) + 1).png")
    }

}
