import UIKit

class WallViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var wallTextView: UITextView!
    let primaryNumber:String = "0"
    let dataString = "9 окт 2017"
    
    //    MARK: - Done Button Pressed
    @IBAction func doneButtonPressed(_ sender: Any) {
        guard let generalText = wallTextView.text, let wallImage = UIImage(named: "Image\(arc4random_uniform(4) + 1).png") else {return}
        let news = News(wallText: generalText, likeNumber: primaryNumber, commentNumber: primaryNumber, repostNumber: primaryNumber, dataString: dataString,wallImage: wallImage)
        newsTransferDelegate?.createNews(with: news)
        navigationController?.popToRootViewController(animated: true)
    }
    
    var newsTransferDelegate: NewsTransferProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wallTextView.delegate = self
    }
    
}
