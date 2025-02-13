#include <iostream>
#include <stack>
#include <vector>

void quicksort(std::vector<int>& arr) {
    if (arr.empty()) return;

    std::stack<int> stack;
    stack.push(0);
    stack.push(arr.size() - 1);

    while (!stack.empty()) {
        int end = stack.top();
        stack.pop();
        int start = stack.top();
        stack.pop();

        int pivot = arr[end];
        int partitionIndex = start;

        for (int i = start; i < end; ++i) {
            if (arr[i] <= pivot) {
                std::swap(arr[i], arr[partitionIndex]);
                ++partitionIndex;
            }
        }
        std::swap(arr[partitionIndex], arr[end]);

        if (partitionIndex - 1 > start) {
            stack.push(start);
            stack.push(partitionIndex - 1);
        }
        if (partitionIndex + 1 < end) {
            stack.push(partitionIndex + 1);
            stack.push(end);
        }
    }
}

int main() {
    std::vector<int> arr = {34, 7, 23, 32, 5, 62};
    quicksort(arr);

    for (int num : arr) {
        std::cout << num << " ";
    }
    return 0;
}
