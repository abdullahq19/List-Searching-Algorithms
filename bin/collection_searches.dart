void main() {
  List<int> arr = [];

  for (int i = 0; i < 10e6; i++) {
    // Uniform elements list of 10 million integers
    arr.add(i + 1);
  }
  var (index, iterations) = Solution().linearSearch(arr, 8891407);
  // var (index, iterations) = Solution().binarySearch(arr, 8891407);
  // var (index, iterations) = Solution().interpolationSearch(arr, 8891407);

  if (index != -1) {
    print('Element ${arr[index]} found at index: $index');
  } else {
    print('Element not found');
  }
  // Number of iterations taken by the algorithm to find the number
  print('Iterations in loop: $iterations');
}

class Solution {
  // Stopwatch to calculate function execution time
  Stopwatch sw = Stopwatch();

  // Function for linear search
  (int, int) linearSearch(List<int> arr, int target) {
    // Stopwatch starts
    sw.start();
    int iterations = 0;

    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == target) {
        // Stoping stopwatch when element is found
        sw.stop();
        print('Linear Search');
        print('Time Taken: ${sw.elapsed.inMicroseconds.toString()}ms');
        return (i, iterations);
      }
      iterations++;
    }

    // Stoping stopwatch when element is found
    sw.stop();

    print('Linear Search');
    print('Time Taken: ${sw.elapsed.inMicroseconds.toString()}ms');
    return (-1, iterations);
  }

  // Function for binary search
  (int, int) binarySearch(List<int> arr, int target) {
    // Stopwatch starts
    sw.start();

    int first = 0;
    int last = arr.length - 1;
    int iterations = 0;

    while (first <= last) {
      int middle = first + (last - first) ~/ 2;
      int middleValue = arr[middle];
      iterations++;

      if (middleValue == target) {
        // Stoping stopwatch when element is found
        sw.stop();
        print('Binary Search');
        print('Time Taken: ${sw.elapsed.inMicroseconds.toString()}ms');
        return (middle, iterations);
      } else if (middleValue > target) {
        last = middle - 1;
      } else {
        first = middle + 1;
      }
    }

    // Stoping stopwatch when element is found
    sw.stop();

    print('Binary Search');
    print('Time Taken: ${sw.elapsed.inMicroseconds.toString()}ms');
    return (-1, iterations);
  }

  // Function for interpolation search
  (int, int) interpolationSearch(List<int> arr, int target) {
    // Stopwatch starts
    sw.start();

    int first = 0;
    int last = arr.length - 1;
    int iterations = 0;

    while (target >= arr[first] && target <= arr[last] && first <= last) {
      int probe = first +
          (last - first) * (target - arr[first]) ~/ (arr[last] - arr[first]);
      int value = arr[probe];
      iterations++;

      if (value == target) {
        // Stoping stopwatch when element is found
        sw.stop();
        print('Interpolation Search');
        print('Time Taken: ${sw.elapsed.inMicroseconds.toString()}ms');
        return (probe, iterations);
      } else if (value > target) {
        last = probe - 1;
      } else {
        first = probe + 1;
      }
    }

    // Stoping stopwatch when element is found
    sw.stop();

    print('Interpolation Search');
    print('Time Taken: ${sw.elapsed.inMicroseconds.toString()}ms');
    return (-1, iterations);
  }
}
