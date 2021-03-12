//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Ali Ma on 3/5/21.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController:
    UIViewController,
    UITableViewDelegate,
    UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 400
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 30
        
        
        query.findObjectsInBackground{
            (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
            }
            else{
                print("ERROR: ", error?.localizedDescription)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Solved
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username
        
        cell.captionLabel.text = post["caption"] as? String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoView.af_setImage(withURL: url)
        
        return cell
    }
    
    // ––––– Lab 6 TODO: Creating Fake Comments; Added a Comment column in Parse Dash-Board
    //Every time when user tap on an image, I get called back here:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let post = posts[indexPath.row]
        
        let comment = PFObject(className: "Comments")
        comment["text"] = "This is a random comment"
        comment["post"] = post
        comment["author"] = PFUser.current()!
        
        post.add(comment, forKey: "comments")
        
        post.saveInBackground(){
            (success, error) in
            if success{
                print("Comment saved")
            }else{
                print("Error saving comment")
            }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // ––––– Lab 6 TODO: Logout
    @IBAction func onLogoutButton(_ sender: Any) {
        
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate
          else {
            return
          }
        
        delegate.window?.rootViewController = loginViewController
    }
}

