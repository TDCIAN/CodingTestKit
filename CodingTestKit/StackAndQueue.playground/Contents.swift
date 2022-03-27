import UIKit

// MARK: 스택/큐 - LIFO, FIFO, push & pop! 스택과 큐를 이용해서 문제를 풀어보세요.

// MARK: 스택/큐 - 1 / 기능개발(https://programmers.co.kr/learn/courses/30/lessons/42586)

/*
 1) 문제 설명
 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다.
 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.
 또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고,
 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.
 먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때
 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.
 
 2) 제한 사항
 - 작업의 개수(progresses, speeds 배열의 길이)는 100개 이하입니다.
 - 작업 진도는 100 미만의 자연수입니다.
 - 작업 속도는 100 이하의 자연수입니다.
 - 배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다. 예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
 
 3) 입출력 예
 3-1)
 - progresses: [93, 30, 55]
 - speeds: [1, 30, 5]
 - return: [2, 1]
 
 3-2)
 - progresses: [95, 90, 99, 99, 80, 99]
 - speeds: [1, 1, 1, 1, 1, 1]
 - return: [1, 3, 2]
 
 4) 입출력 예 설명
 - 입출력 예 #1
 첫 번째 기능은 93% 완료되어 있고 하루에 1%씩 작업이 가능하므로 7일간 작업 후 배포가 가능합니다.
 두 번째 기능은 30%가 완료되어 있고 하루에 30%씩 작업이 가능하므로 3일간 작업 후 배포가 가능합니다.
 하지만 이전 첫 번째 기능이 아직 완성된 상태가 아니기 때문에 첫 번째 기능이 배포되는 7일째 배포됩니다.
 세 번째 기능은 55%가 완료되어 있고 하루에 5%씩 작업이 가능하므로 9일간 작업 후 배포가 가능합니다.
 따라서 7일째에 2개의 기능, 9일째에 1개의 기능이 배포됩니다.
 
 - 입출력 예 #2
 모든 기능이 하루에 1%씩 작업이 가능하므로, 작업이 끝나기까지 남은 일수는 각각 5일, 10일, 1일, 1일, 20일, 1일입니다.
 어떤 기능이 먼저 완성되었더라도 앞에 있는 모든 기능이 완성되지 않으면 배포가 불가능합니다.
 따라서 5일째에 1개의 기능, 10일째에 3개의 기능, 20일째에 2개의 기능이 배포됩니다.
 */

/*
 Python3 -> 참고: 다른 사람의 풀이
 
 def solution(progresses, speeds):
    answer = []
    time = 0
    count = 0
    while len(progresses) > 0:
        if (progresses[0] + time * speeds[0]) >= 100:
            progresses.pop(0)
            speeds.pop(0)
            count += 1
        else:
            if count > 0:
                answer.append(count)
                count = 0
            time += 1
    answer.append(count)
    return answer
 */

//let progresses1: [Int] = [93, 30, 55]
//let speeds1: [Int] = [1, 30, 5]
//
//let progresses2: [Int] = [95, 90, 99, 99, 80, 99]
//let speeds2: [Int] = [1, 1, 1, 1, 1, 1]

// Python3 코드를 Swift로 변환한 답
//func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
//    var progresses: [Int] = progresses
//    var speeds: [Int] = speeds
//    var answer: [Int] = []
//    var time: Int = 0
//    var count: Int = 0
//    while progresses.count > 0 {
//        if (progresses[0] + time * speeds[0]) >= 100 {
//            progresses.removeFirst()
//            speeds.removeFirst()
//            count += 1
//        } else {
//            if count > 0 {
//                answer.append(count)
//                count = 0
//            }
//            time += 1
//        }
//    }
//    answer.append(count)
//    return answer
//}

// Swift -> 곰튀김님 답
//func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
//    return zip(progresses, speeds)
//        .map {
//            (100 - $0 + ($1 - 1)) / $1
//        }
//        .reduce(([], 0)) { (tuple, day) -> ([Int], Int) in
//            let (list, lastMax) = tuple
//            print("튜플: \(tuple) - 리스트: \(list), 라스트맥스: \(lastMax), 데이: \(day)")
//            guard let lastCount = list.last else {
//                return ([1], day)
//            }
//            if lastMax >= day {
//                return (list.dropLast() + [lastCount + 1], lastMax)
//            }
//            return (list + [1], day)
//        }.0
//}
//print("케이스 1: \(solution(progresses1, speeds1))")
//print("케이스 2: \(solution(progresses2, speeds2))")

// MARK: 스택/큐 - 2 / 프린터(https://programmers.co.kr/learn/courses/30/lessons/42587)

/*
 1) 문제 설명
 일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다.
 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다.
 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.
 
 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
 3. 그렇지 않으면 J를 인쇄합니다.
 
 예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2라면 C D A B 순으로 인쇄하게 됩니다.
 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄 됩니다.
 현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의
 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return하도록
 solution 함수를 작성해주세요.
 
 2) 제한 사항
 - 현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
 - 인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
 - location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.
 
 3) 입출력 예
 3-1)
 - priorities: [2, 1, 3, 2]
 - location: 2
 - return: 1
 
 3-2)
 - priorities: [1, 1, 9, 1, 1, 1]
 - location: 0
 - return: 5
 
 4) 입출력 예 설명
 - 입출력 예 #1
 문제에 나온 예와 같습니다.
 
 - 입출력 예 #2
 6개의 문서(A, B, C, D, E, F)가 인쇄 대기목록에 있고 중요도가 1 1 9 1 1 1 이므로 C D E F A B 순으로 인쇄합니다.
 */

/*
 Python3 -> 참고: 다른 사람의 풀이
 
 def solution(priorities, location):
    queue = [(i,p) for i,p in enumerate(priorities)]
    answer = 0
    while True:
        current = queue.pop(0)
        if any(current[1] < q[1] for q in queue):
            queue.append(current)
        else:
            answer += 1
            if current[0] == location:
                return answer
 */

let priorities1: [Int] = [2, 1, 3, 2]
let location1: Int = 2
let priorities2: [Int] = [1, 1, 9, 1, 1, 1]
let location2: Int = 0

// Swift -> 프로그래머스 참고
func solution(_ priorities: [Int], _ location: Int) -> Int {
    var priority: [(Int, Int)] = priorities.enumerated().map { ($0.offset, $0.element) }
    print("프라이어리티: \(priority)")
    var printing: Int = 0
    
    while true {
        let pri: (Int, Int) = priority.remove(at: 0)
        print("프리: \(pri), priority.filter({ pri.1 < $0.1 }): \(priority.filter({ pri.1 < $0.1 }))")
        if !priority.filter({ pri.1 < $0.1 }).isEmpty {
            priority.append(pri)
            print("어펜드 되는 프리: \(pri), 프라이어리티: \(priority)")
        } else if pri.0 == location {
            printing = priorities.count - priority.count
            print("pri.0값: \(pri.0), location: \(location)")
            break
        }
    }
    return printing
}
print("케이스 1: \(solution(priorities1, location1))")
print("케이스 2: \(solution(priorities2, location2))")

