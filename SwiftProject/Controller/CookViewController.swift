//
//  CookViewController.swift
//  SwiftProject
//
//  Created by 赵英奎 on 10/5/6.
//  Copyright © 2010年 赵英奎. All rights reserved.
//

//  ZYK0425

import UIKit

class CookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
//    存储模型
    var mutArray = NSMutableArray()
    
    @IBOutlet weak var adScrollView: UIScrollView!
    
    @IBOutlet weak var tv: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tv.dataSource = self
        self.tv.delegate = self
        // Do any additional setup after loading the view.
        
        registerCookCellInTableView()
        loadAdRequest()
        loadTableViewRequest()
    }
    
    //加载表格数据
    func loadTableViewRequest() {
        
        AFHttpRequest.get("https://openapi.alipay.com/gateway.do?app_id=2016062801561844&auth_token=kuaijieB3149456d0c9f49038590a1d663b5bX40&charset=GBK&method=alipay.user.userinfo.share&sign=XlfjhaBB08SG3VtvisVV4EahYyS5ooRZRks34UvCrdTLZpFSHYU0PCACsaSDZCPMOUvHlgxGDTvPvV0Ge%2FhdT02wDgUaUl3CV8lDT0AtUZmdpDWsUxzu5Wcz56MuzIfByAT38QEcJi%2BM0tvaj%2Fy9wgO8iEBVrr%2B4lhbZnm9B4EU%3D&sign_type=RSA&timestamp=2016-09-01 14:51:13&version=1.0", andSuccess: { (data: Data!) -> Void in
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            let array = json?.object(forKey: "data")
            for i in 0..<array!.count {
                let dict = array![i]
                //创建模型对象
                let cm = CookModel()
                cm.name = dict["name"] as? String
                cm.imageFilename = dict["imageFilename"] as? String
                cm.vegetableList = dict["vegetableList"] as? NSArray
                //将每个模型，存放到数组
                self.mutArray.add(cm)
                
            }
            
            self.tv.reloadData()
            
            
            }) { (reason: String!) -> Void in
                
        }
        
        
        
    }
    
    
    
    
    //加载广告轮播图
    func loadAdRequest() {
        AFHttpRequest.get(URL_COOKBOOK_AD, andSuccess: { (data: Data!) -> Void in
            
            //如果网络请求数据成功
            
            //try? 处理通过throw抛异常的函数，如果抛了异常,json值为nil,如果没抛异常json 字典
            //AnyObject 声明的指针，可以可以指向任意由类、结构体创建的对象
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            //解析json数据
            print(json)
            let array = json?.object(forKey: "data")
            //获得滚动视图的宽度
            let adWidth = self.adScrollView.bounds.size.width
            let adHeight = self.adScrollView.bounds.size.height
            //设置滚动视图的contentsize
            self.adScrollView.contentSize = CGSize(width: CGFloat(array!.count) * adWidth, height: adHeight)
            self.adScrollView.isPagingEnabled = true
            
            for i in 0..<array!.count {
                let dict = array![i]
                //获得每张图片的网络路径
                let urlName = dict["imageFilename"] as! String
                //创建UIImageView图片对象
                let imgView = UIImageView(frame: CGRect(x: CGFloat(i) * adWidth, y: 0, width: adWidth, height: adHeight))
                //imgView的现实的的图片
                imgView.sd_setImage(with: URL(string: urlName), placeholderImage: UIImage(named: "Home-More.png"))
                
                //向滚动视图添加图片
                self.adScrollView.addSubview(imgView)
                
                
            }
            
            
            }) { (reason: String!) -> Void in
             //如果加载失败
             print(reason)
                
        }
        
        
        
    }
    
    
    
    
    
    //注册自定制Cell方法
    func registerCookCellInTableView() {
        //加载nib文件
        let nib = UINib(nibName: "CookCell", bundle: nil)
        //将将在的nib文件注册到tableview
        self.tv.register(nib, forCellReuseIdentifier: "CookCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    //实现表格协议中方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Swift 中 as? as! 作用为强制类型转换
        //as? 可选强制类型转换，如果类型转换失败则返回nil
        //as! 强制类型转换，如果转换失败，则报错
        let cell = tableView.dequeueReusableCell(withIdentifier: "CookCell") as! CookCell
        cell.cm = self.mutArray.object(at: indexPath.row) as? CookModel
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mutArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}








