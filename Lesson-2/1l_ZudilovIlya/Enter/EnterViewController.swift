//
//  EnterViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 20.12.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class EnterViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        loadVK()

        // Do any additional setup after loading the view.
    }
    
    func loadVK() {
        
    var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                URLQueryItem(name: "client_id", value: "7704934"),
                URLQueryItem(name: "display", value: "mobile"),
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "scope", value: "262144"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "v", value: "5.126")
            ]
            
            let request = URLRequest(url: urlComponents.url!)
                       
            webview.load(request)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EnterViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment
        
            else {
                decisionHandler(.allow)
                return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        let userID = Int(params["user_id"] ?? "0")
        
        Session.shared.acess_token = token
        Session.shared.userID = userID ?? 0
        
        print(Session.shared.acess_token!)
        
        decisionHandler(.cancel)
        
        let friends = APIFriends()
               friends.getData(fields: "bdate")
        
        let groups = APIGroups()
               groups.getData(fields: "name")
        
        let photos = APIPhotos()
               photos.getData(fields: "album_id")
        
        let search = APISearchGroups()
                search.getData(searchText: "Москва")
        
        self.performSegue(withIdentifier: "mainPage", sender: self)
        
    }
}
