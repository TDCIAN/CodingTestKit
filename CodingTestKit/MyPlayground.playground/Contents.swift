import UIKit

// MARK: 해시 - Key-value 쌍으로 데이터를 빠르게 찾아보세요.

// MARK: 해시 - 1 / 완주하지 못한 선수(https://programmers.co.kr/learn/courses/30/lessons/42576)
/*
 1) 문제 설명
 수많은 마라톤 선수들이 마라톤에 참여하였습니다. 단 한 명의 선수를 제외하고는 모든 선수가 마라톤을 완주하였습니다.
 마라톤에 참여한 선수들의 이름이 담긴 배열 participant와 완주한 선수들의 이름이 담긴 배열 completion이 주어질 때,
 완주하지 못한 선수의 이름을 return 하도록 solution 함수를 작성해주세요.
 
 2) 제한사항
 - 마라톤 경기에 참여한 선수의 수는 1명 이상 100,000명 이하입니다.
 - completion의 길이는 participant의 길이보다 1 작습니다.
 - 참가자의 이름은 1개 이상 20개 이하의 알파벳 소문자로 이루어져 있습니다.
 - 참가자 중에는 동명이인이 있을 수 있습니다.
 
 3) 입출력 예
 - 사례 1
 (1) participant - 마라톤에 참여한 선수들의 이름이 담긴 배열
 ["leo", "kiki", "eden"]
 (2) completion - 완주한 선수들의 이름이 담긴 배열
 ["eden", "kiki"]
 (3) return - 완주하지 못한 선수의 이름
 "leo"
 - 사례 2
 (1) participant - 마라톤에 참여한 선수들의 이름이 담긴 배열
 ["marina", "josipa", "nikola", "vinko", "filipa"]
 (2) completion - 완주한 선수들의 이름이 담긴 배열
 ["josipa", "filipa", "marina", "nikola"]
 (3) return - 완주하지 못한 선수의 이름
 "vinko"
 - 사례 3
 (1) participant - 마라톤에 참여한 선수들의 이름이 담긴 배열
 ["mislav", "stanko", "mislav", "ana"]
 (2) completion - 완주한 선수들의 이름이 담긴 배열
 ["stanko", "ana", "mislav"]
 (3) return - 완주하지 못한 선수의 이름
 "mislav"
 
 4) 입출력 예 설명
 예제 #1
 - "leo"는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.
 예제 #2
 - "vinko"는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.
 예제 #3
 - "mislav"는 참여자 명단에는 두 명이 있지만, 완주자 명단에는 한 명밖에 없기 때문에 한 명은 완주하지 못했습니다.
 */

let participant1: [String] = ["leo", "kiki", "eden"]
let completion1: [String] = ["eden", "kiki"]

let participant2: [String] = ["marina", "josipa", "nikola", "vinko", "filipa"]
let completion2: [String] = ["josipa", "filipa", "marina", "nikola"]

let participant3: [String] = ["mislav", "stanko", "mislav", "ana"]
let completion3: [String] = ["stanko", "ana", "mislav"]

// Swift 내 풀이 -> 틀림
//func solution(participant: [String], completion: [String]) -> String {
//    var answer = ""
//    var countedParticipants: [String] = []
//    for i in 0..<participant.count {
//        if completion.contains(participant[i]) {
//            if countedParticipants.contains(participant[i]) {
//                answer = participant[i]
//            } else {
//                countedParticipants.append(participant[i])
//            }
//        } else {
//            answer = participant[i]
//        }
//    }
//    return answer
//}

/* Python3 내 풀이 -> 틀림
 def solution(participant, completion):
     answer = ''
     countedParticipants = []
     for player in participant:
         if player in completion:
             if player in countedParticipants:
                 answer = player
             else:
                 countedParticipants.append(player)
         else:
             answer = player
     return answer
 */

/* Pythone3 다른 사람 풀이
 좋아요 239개
 def solution(participant, completion):
     answer = ''
     temp = 0
     dic = {}
     for part in participant:
         dic[hash(part)] = part
         temp += int(hash(part))
     for com in completion:
         temp -= hash(com)
     answer = dic[temp]
     return answer
 
 좋아요 606개
 import collections
 
 def solution(participant, completion):
 answer = collections.Counter(participant) - collections.Counter(completion)
 return list(answer.keys())[0]
 */

// 위 풀이를 Swift로 변환
//func solution(participant: [String], completion: [String]) -> String {
//    var answer: String = ""
//    var temp: Int = 0
//    var dic: [Int: String] = [:]
//    for i in 0..<participant.count {
//        dic[participant[i].hashValue] = participant[i]
//        temp += participant[i].hashValue
//        print("--- 위 시작 ---")
//        print("위 (1) dic: \(dic) \n (2) temp: \(temp)")
//        print("--- 위 끝 ---")
//    }
//    for i in 0..<completion.count {
//        temp -= completion[i].hashValue
//        print("--- 아래 시작 ---")
//        print("아래 temp: \(temp)")
//        print("--- 아래 끝 ---")
//    }
//    answer = dic[temp] ?? ""
//    print("앤즈워: \(answer)")
//    return answer
//}
//
//DispatchQueue.main.async {
//    print("첫번째: \(solution(participant: participant1, completion: completion1))")
//    print("두번째: \(solution(participant: participant2, completion: completion2))")
//    print("세번째: \(solution(participant: participant3, completion: completion3))")
//}


// MARK: 해시 - 2 / 전화번호 목록(https://programmers.co.kr/learn/courses/30/lessons/42577)
/*
 1) 문제 설명
 전화번호부에 적힌 전화번호 중, 한 번호가 다른 번호의 접두어인 경우가 있는지 확인하려 합니다.
 전화번호가 다음과 같을 경우, 구조대 전화번호는 영석이의 전화번호의 접두사입니다.
 - 구조대: 119
 - 박준영: 97 674 223
 - 지영석: 11 9552 4421
 전화번호부에 적힌 전화번호를 담은 배열 phone_book이 solution 함수의 매개변수로 주어질 때,
 어떤 번호가 다른 번호의 접두어인 경우가 있으면 false를
 그렇지 않으면 true를 return 하도록 solution 함수를 작성해 주세요.
 
 2) 제한사항
 - phone_book의 길이는 1 이상 1,000,000 이하입니다.
    - 각 전화번호의 길이는 1 이상 20 이하입니다.
    - 같은 전화번호가 중복해서 들어있지 않습니다.
 
 3) 입출력 예
 phone_book
 ["119", "97674223", "1195524421"] -> return false
 ["123", "456", "789"] -> return true
 ["12", "123", "1235", "567", "88"] -> return false

 
 4) 입출력 예 설명
 예제 #1
 - 앞에서 설명한 예와 같습니다.
 예제 #2
 - 한 번호가 다른 번호의 접두사인 경우가 없으므로, 답은 true입니다.
 예제 #3
 - 첫 번째 전화번호, "12"가 두 번째 전화번호 "123"의 접두사입니다. 따라서 답은 false입니다.
 */

// Python 3 풀이 -> https://coding-grandpa.tistory.com/86
/*
 def solution(phone_book):
    # 1. Hash map을 만든다
    hash_map = {}
    for phone_number in phone_book:
        hash_map[phone_number] = 1
 
    # 2. 접두어가 Hash map에 존재하는지 찾는다
    for phone_number in phone_book:
        prefix = ""
        for number in phone_number:
            prefix += number
            # 3. 접두어를 찾아야 한다(기존 번호와 같은 경우 제외)
            if prefix in hash_map and prefix != phone_number:
                return False
    return True
 */

// Swift 풀이로 전환
//func solution(phoneBook: [String]) -> Bool {
//    var hashMap: [String: Int] = [:]
//    // 1.Hash map을 만든다
//    for phoneNumber in phoneBook {
//        hashMap[phoneNumber] = 1
//    }
//
//    // 2. 접두어가 Hash map에 존재하는지 찾는다
//    for phoneNumber in phoneBook {
//        var prefix: String = ""
//        for number in phoneNumber {
//            prefix += String(number)
//            // 3. 접두어를 찾아야 한다(기존 번호와 같은 경우 제외)
//            if hashMap.keys.contains(prefix) && prefix != phoneNumber {
//                return false
//            }
//        }
//    }
//    return true
//}
//let case1: [String] = ["119", "97674223", "1195524421"]
//let case2: [String] = ["123", "456", "789"]
//let case3: [String] = ["12", "123", "1235", "567", "88"]
//print("첫 번째: \(solution(phoneBook: case1))")
//print("두 번째: \(solution(phoneBook: case2))")
//print("세 번째: \(solution(phoneBook: case3))")

// MARK: 해시 - 3 / 위장(https://programmers.co.kr/learn/courses/30/lessons/42578)
/*
 1) 문제 설명
 스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.
 예를 들어 스파이가 가진 옷이 아래와 같고 오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면
 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.
 
 종류 / 이름
 얼굴 / 동그란 안경, 검정 선글라스
 상의 / 파란색 티셔츠
 하의 / 청바지
 겉옷 / 긴 코트
 
 스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return하도록
 solution 함수를 작성해주세요.
 
 2) 제한사항
 - clothes의 각 행은 [의상의 이름, 의상의 종류]로 이루어져 있습니다.
 - 스파이가 가진 의상의 수는 1개 이상 30개 이하입니다.
 - 같은 이름을 가진 의상은 존재하지 않습니다.
 - clothes의 모든 원소는 문자열로 이루어져 있습니다.
 - 모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '_'로만 이루어져 있습니다.
 - 스파이는 하루에 최소 한 개의 의상은 입습니다.
 
 3) 입출력 예
 [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]] -> return 5
 [["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]] -> return 3

 
 4) 입출력 예 설명
 예제 #1
 - headgear에 해당하는 의상이 yellow_hat, green_turban이고 eyewear에 해당하는 의상이 blue_sunglasses이므로
   아래와 같이 5개의 조합이 가능합니다.
 1. yellow_hat
 2. blue_sunglasses
 3. green_turban
 4. yellow_hat + blue_sunglasses
 5. green_turban + blue_sunglasses
 
 예제 #2
 - face에 해당하는 의상이 crow_mask, blue_sunglasses, smoky_makeup이므로 아래와 같이 3개의 조합이 가능합니다.
 1. crow_mask
 2. blue_sunglasses
 3. smoky_makeup
 */

/*
 파이썬3 풀이 참조 -> https://coding-grandpa.tistory.com/88
 지금 나온건 프로그래머스 사이트에 있는 다른 풀이
 def solution(clothes):
    clothes_type = {}
 
    for cloth, type in clothes:
        if type not in clothes_type:
            clothes_type[type] = 2
        else:
            clothes_type[type] += 1
 
    answer = 1
    for number in clothes_type.values():
        answer *= number
 
    return answer - 1
 */

//let case1 = [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]
//let case2 = [["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]
//
//// Swift 풀이
//func solution(clothes: [[String]]) -> Int {
//
//    var clothesType: [String: Int] = [:]
//    for cloth in clothes {
//        let type = cloth[1]
//        if !clothesType.keys.contains(type) {
//            clothesType[type] = 2
//        } else {
//            clothesType[type]! += 1
//        }
//    }
//
//    var answer: Int = 1
//    for number in clothesType.values {
//        answer *= number
//    }
//
//    return answer - 1
//}
//
//print("1번 케이스: \(solution(clothes: case1))")
//print("2번 케이스: \(solution(clothes: case2))")

