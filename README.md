# Concurrent in swift

## Dispatch Queue
- It is an abstraction layer or top layer of GCD Queue.
- It allow you to perform async and current task in your application
- The task is always execute in the order they are added in your queue

## Serial Dispatch
-  It perform only one task at a time
-  Serial Queue are often used to synchronize access of resource to stop *Data Race*

## Concurrent Queue
- It allow to execute multiple task in your application
- The task are run on different queue that are managed by dispatch queue
- The task will always start with the order they are added into the queue, but can finish in different order.

## Data Race
- A data race can occur when multiple thread access the same memory
- If you try to read the value of a variable on one thread at the same another thread is writing the value.
- It cause to crash of an application

## Barrier
- The solution of Data Race is  *barrier*. 
- It will stop the resource if multiple resources try to access. 
- It converts the thread into parallel extension.
