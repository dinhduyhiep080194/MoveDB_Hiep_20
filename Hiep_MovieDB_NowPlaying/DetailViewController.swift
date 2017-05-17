//
//  DetailViewController.swift
//  Hiep_MovieDB_NowPlaying
//
//  Created by Dinh Duy Hiep on 5/17/17.
//  Copyright © 2017 cntt17. All rights reserved.
//

import UIKit

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)
    }
}

class DetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var releaseLabel: UILabel!
    @IBOutlet var voteLabel: UILabel!

    var queue = OperationQueue()
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queue.addOperation { () -> Void in
            if let posterName = self.movie?.poster {
                if let img = Downloader.downloadImageWithURL("https://image.tmdb.org/t/p/w160\(posterName)") {
                    OperationQueue.main.addOperation({
                        self.posterImage.image = img
                    })
                }
            }
        }
        if let name = self.movie?.title {
            print(name)
        }
        // titleLabel.text = "\(self.movie?.title)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
