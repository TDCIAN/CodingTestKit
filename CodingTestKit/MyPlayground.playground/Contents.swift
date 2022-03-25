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

func solution(participant: [String], completion: [String]) -> String {
    var answer: String = ""
    var temp: Int = 0
    var dic: [Int: String] = [:]
    for i in 0..<participant.count {
        dic[participant[i].hashValue] = participant[i]
        temp += participant[i].hashValue
        print("--- 위 시작 ---")
        print("위 (1) dic: \(dic) \n (2) temp: \(temp)")
        print("--- 위 끝 ---")
    }
    for i in 0..<completion.count {
        temp -= completion[i].hashValue
        print("--- 아래 시작 ---")
        print("아래 temp: \(temp)")
        print("--- 아래 끝 ---")
    }
    answer = dic[temp] ?? ""
    print("앤즈워: \(answer)")
    return answer
}

DispatchQueue.main.async {
    print("첫번째: \(solution(participant: participant1, completion: completion1))")
    print("두번째: \(solution(participant: participant2, completion: completion2))")
    print("세번째: \(solution(participant: participant3, completion: completion3))")
}

