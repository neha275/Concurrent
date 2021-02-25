import UIKit


//By deafult dispatch queue is serial queue, second task is execute only after first task completion

let serialQueue = DispatchQueue(label: "single.queue")

var a:Int = 5

serialQueue.async {
    print("task 1 started")
    a = 5
    print("\(a)")
    print("task 1 finished")
}

serialQueue.async {
    print("task 2 started")
    a = 0
    print("\(a)")
    print("task 2 finished")
}



///Dispatch queue have a attribute called concurrent which is used for performing multiple task.
///Here task 2 is already stated before completing task 1
///that means task will not wait for another task
let concurrentQueue = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)
var b = 5
concurrentQueue.async {
    print("task 1 started")
    b = 7
    print("value is \(b)")
    print("task 1 complete")
}

concurrentQueue.async {
    print("task 2 started")
    b = 0
    print("value is \(b)")
    print("task 2 complete")
}
/* Output
 task 1 started
 task 2 started
 value is 0
 value is 0
 task 1 complete
 task 2 complete
The value of b is printing 0 because both the task is using same variable the race constion occur.
to resolve this issue barrier flag is used
 */

/// Barrier block the variable until writting is not finished
let concurrentQueueWithBarrier = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)
var c = 5
concurrentQueueWithBarrier.async(flags: .barrier) {
    print("task 1 started")
    c = 7
    print("value is \(c)")
    print("task 1 complete")
}

concurrentQueueWithBarrier.async {
    print("task 2 started")
    c = 0
    print("value is \(c)")
    print("task 2 complete")
}

/*task 1 started
 value is 7
 task 1 complete
 task 2 started
 value is 0
 task 2 complete
 */
