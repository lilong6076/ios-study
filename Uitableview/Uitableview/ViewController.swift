//
//  ViewController.swift
//  Uitableview
//
//  Created by gaoyan on 2022/7/1.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataSource = [[String:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tableView = UITableView(frame: view.bounds,style: .grouped)
        tableView.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = [
            ["name":"王小明","sex":"男","icon":"11","birthday":"2017-10-11"],
            ["name":"李磊","sex":"男","icon":"my_def_photo","birthday":"2011-12-30"],
            ["name":"韩梅","sex":"女","icon":"my_def_photo","birthday":"2014-9-10"],
            ["name":"JIM","sex":"男","icon":"my_def_photo","birthday":"2008-10-1"]]
        tableView.reloadData()
    }

    //UITableViewDatesource
    //cell的个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    //UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        //deueueReusableCell方法的作用是从单元格对象池中获取指定类型并可复用的单元格对象
        var cell:NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? NewTableViewCell
        if cell == nil{//如果从对象池中未获得,就调用实力话方法实例一个某一类型的、可复用的单元格
            cell = NewTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        
        let dict:Dictionary = dataSource[indexPath.row]
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.userLabel.text = dict["name"]
        cell?.sexLabel.text = dict["sex"]
        cell?.birthdayLabel.text = dict["birthday"]

//        cell?.textLabel?.text = "这是个标题"
//        cell?.detailTextLabel?.text = "这是内容了"
//        cell?.imageView?.image = UIImage(named:"Expense_success")
        return cell!
    }
    
    //UITableViewDelegate
    //设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    //选中cell后执行次方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

