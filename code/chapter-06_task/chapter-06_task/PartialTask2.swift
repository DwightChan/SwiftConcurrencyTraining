//
//  PartialTask.swift
//  chapter-06_task
//
//  Created by 丰源天下传媒 on 2023/2/25.
//

/// 如果有多个 task ，task 1， task2
/// 在 task2 中 调用 task1.cancel 方法
/// 则 task1 先遍历 子任务，直到 最后一层的子任务，
/// 然后 一层层， 从最后一层 先取消， 一层层取消（或者抛出异常），直到最后取消 task1 任务；


import Foundation
  
 
func printLine(_ line :String) async {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("fengyuantianxia:\(line)")
}

func searchCompanyInfo() async {
    let url = URL(string: "https://www.baidu.com/s?wd=fengyuantianxia")!
    do {
        for try await line in url.lines {
            await printLine(line)
        }
    } catch(let e) {
        print(e.localizedDescription)
    } 
}
 
