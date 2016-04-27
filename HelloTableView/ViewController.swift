//
//  ViewController.swift
//  HelloTableView
//
//  Created by 辛忠翰 on 2016/3/22.
//  Copyright © 2016年 Hsinhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //tableView有三個主要的問題。1.有幾個section 2.有幾列 3.要顯示什麼
    let fruitArray:[String] = ["apple", "banana", "watermellon", "mango"]
    let colorArray:[String] = ["blue", "red", "green"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return 1//這個tableView有1個section
        return 2//要用多個section先要到mainStoryBoard的tableView -> style ->選grooped，表示和程式說現在要用多個section了
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 3//表示這個section有3列(3筆資料)
        if section == 0 {
            return fruitArray.count
        }else{
            return colorArray.count
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//每次要顯示一筆資料時會來執行這一段的程式碼，此func要回傳那一列要顯示的tableViewCell裡面要顯示的內容
        //let cell = UITableViewCell()//產生tableViewCell物件，but此法很浪費memory，因為若有1萬筆資料便有1萬個cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)//利用此方法會把不在畫面上的cell重新再利用，而不是在傻傻地產生新的cell浪費memory，這邊回傳給我們的cell可能是回收的cell也可能是全新產生的cell(回到mainStoryBoard ->tableView ->prototype cells -> 看要有幾個cell再到cell ->identifier ->取名字)
        if indexPath.section == 0{//如果是section 0就去讀fruitArray的資料
            cell.textLabel?.text = fruitArray[indexPath.row]
        }else{//若是section1就去讀colorArray的資料
            cell.textLabel?.text = colorArray[indexPath.row]
        }
        //顯示每個cell(row)上的label文字
        //其中indexPath中有兩個重要的資訊，        indexPath.section就知道這次執行的方法，生成的cell是哪一個section;indexPath.row會生成一個tableViewCell(第一次呼叫index.row會回傳apple，第二次呼叫會回傳banana...以此類推)
        return cell
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {//可為tableView上的section加上title
        if section == 0{
            return "fruit"
        }else{
            return "color"
        }
    }
    //tableViewController為有tableView的controller，且delegate與dataSource都已經幫我們連好了(table view controller)為一個controller，可以控制tableview
}

