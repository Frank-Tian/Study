import UIKit

/*:
 示例 1：
 
 输入：date = "2019-01-09"
 输出：9
 
 示例 2：
 
 输入：date = "2019-02-10"
 输出：41
 
 示例 3：
 
 输入：date = "2003-03-01"
 输出：60
 
 示例 4：
 
 输入：date = "2004-03-01"
 输出：61
 
 提示：
 
 - date.length == 10
 - date[4] == date[7] == '-'，其他的 date[i] 都是数字。
 - date 表示的范围从 1900 年 1 月 1 日至 2019 年 12 月 31 日。
 */
class Solution {
    
    func runnian(_ year: Int) -> Bool {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    }
    
    func monthDays(year: Int , month: Int) -> Int {
        let rn = runnian(year)
        var days = 0
        switch month {
            case 1,3,5,7,8,10,12:
                days = 31
            case 2:
                days = rn ? 29 : 28
            default:
                days = 30
        }
        return days
    }
    
    func dayOfYear(_ date: String) -> Int {
        var count = 0
        if date.count == 10 {
            
            var arr = date.split(separator: "-")
            let year = Int(arr[0])!
            let month = Int(arr[1])!
            let day = Int(arr[2])!
            
            for i in (1..<month) {
                count = monthDays(year: year, month: i) + count
            }
            count += day
        }
        return count
    }
}


var s = Solution()
print(s.dayOfYear("2019-01-09"))
print(s.dayOfYear("2019-02-10"))
print(s.dayOfYear("2003-03-01"))
print(s.dayOfYear("2004-03-01"))
//9
//41
//60
//61
