/// Isolate are simply used to do work at parallel during execution of program
/// There are many field in which isolates are used :
/// 1. Reading the data form database
/// 2. Sending Push notifications
/// 3. Parsing and Decoding the Large data files
/// 4. Processing the images, audio and video
/// and many more
/// It also include its separate memory management and parallel communication which is done to another services using http requests , getting API 's and many more

/// This is how you can declare an isolate
/// var isolate_name = await Isolate.spawn(isolateFunction_name,receivePort_name.sendPort_name);
/// but before using this, we have to create sendPort,receivePort and Isolate function

import 'dart:isolate';
import 'dart:async';
// Send port is simple a port where we can send data to a receiver's port
void isolateFibbonaci(SendPort sendPort){
  int n=20;
  int fib(n){
    if(n<=1)return 1;
    return fib(n-1)+fib(n-2);
  }
  int result=fib(n);
  sendPort.send(result);
}// This is simplest isolate function
// Function that runs in the new isolate
void computeFibonacci(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    final n = message[0] as int;
    final replyPort = message[1] as SendPort;

    int fib(int n) {
      if (n <= 1) return n;
      return fib(n - 1) + fib(n - 2);
    }

    replyPort.send(fib(n));
  });
}

Future<Stream<int>> startIsolateAndListen(int n) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(computeFibonacci, receivePort.sendPort);

  final sendPort = await receivePort.first as SendPort;
  final resultStreamController = StreamController<int>();

  for (int i = 0; i <= n; i++) {
    final responseReceivePort = ReceivePort();
    sendPort.send([i, responseReceivePort.sendPort]);

    responseReceivePort.listen((result) {
      resultStreamController.add(result as int);
      if (i == n) {
        resultStreamController.close();
      }
    });
  }

  return resultStreamController.stream;
}
void main() async {
  ReceivePort receivePort = ReceivePort();
  // Receive Port is create a Port where our data is collect at parallelism
  var isolate = await Isolate.spawn(isolateFibbonaci, receivePort.sendPort);

  receivePort.listen((data) {
    print(data);
    receivePort.close();
  });

  // Use of isolate with future and stream
  final n = 10;
  final fibonacciStream = await startIsolateAndListen(n);

  fibonacciStream.listen((number) {
    print('Fibonacci number: $number');
  }, onDone: () {
    print('Stream closed.');
  });
}
